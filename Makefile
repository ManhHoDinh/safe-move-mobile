ifeq ($(wildcard ./.fvm),)
	fvm:=false
else
	fvm:=true
endif

ifeq ($(OS),Windows_NT)
	os:=windows
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		os:=linux
	else
		os:=osx
	endif
endif

init: clean --get-internal format
	git --version
	git config core.hooksPath git_hooks
ifneq ($(os), windows)
	chmod ug+x git_hooks/*
endif
ifeq ($(fvm), true)
	fvm flutter --version
	fvm dart --version
else
	flutter --version
	dart --version
endif

build: --build-internal format

--build-internal: lint clean --get-internal --gen-internal --build-debug-internal --build-profile-internal --build-release-internal

build-debug: clean --build-debug-internal format

--build-debug-internal:
ifeq ($(fvm), true)
	fvm flutter build apk --debug
else
	flutter build apk --debug
endif

build-profile: clean --build-profile-internal format

--build-profile-internal:
ifeq ($(fvm), true)
	fvm flutter build apk --profile
else
	flutter build apk --profile
endif

build-release: clean --build-release-internal format

--build-release-internal:
ifeq ($(fvm), true)
	fvm flutter build apk --release
else
	flutter build apk --release
endif

clean:
ifeq ($(fvm), true)
	fvm flutter clean
else
	flutter clean
endif

get: --get-internal format

--get-internal:
ifeq ($(fvm), true)
	fvm flutter pub get
else
	flutter pub get
endif


gen: --get-internal --gen-internal format

--gen-internal: --gen-color-internal --gen-locale-internal
ifeq ($(fvm), true)
	fvm dart run build_runner build --delete-conflicting-outputs
else
	dart run build_runner build --delete-conflicting-outputs
endif

gen-color: --gen-color-internal format

--gen-color-internal:
ifeq ($(fvm), true)
	fvm dart run color_gen:generate
else
	dart run color_gen:generate
endif

gen-locale: --gen-locale-internal format

--gen-locale-internal:
ifeq ($(fvm), true)
	fvm flutter gen-l10n
else
	flutter gen-l10n
endif


format:
ifeq ($(fvm), true)
	fvm dart format .
	fvm dart fix --apply .
else
	dart format .
	dart fix --apply .
endif

lint:
ifeq ($(fvm), true)
	fvm dart analyze
else
	dart analyze
endif

test: --test-internal

--test-internal:
ifeq ($(fvm), true)
	fvm flutter test --coverage
else
	flutter test --coverage
endif
ifeq ($(os), windows)
	perl C:\ProgramData\chocolatey\lib\lcov\tools\bin\lcov --remove coverage\lcov.info '**.auto_mappr.dart' '**.g.dart' '**.mapper.dart' -o coverage\lcov.info --ignore-errors unused
	perl C:\ProgramData\chocolatey\lib\lcov\tools\bin\genhtml coverage\lcov.info -o coverage\html
else
	lcov --remove coverage/lcov.info '**.auto_mappr.dart' '**.g.dart' '**.mapper.dart' -o coverage/lcov.info --ignore-errors unused
	genhtml coverage/lcov.info -o coverage/html
endif

lane: lint build --lane-android-internal --lane-ios-internal

lane-android: lint build --lane-android-internal
lane-ios: lint build --lane-ios-internal

lane-device:
ifeq ($(os), osx)
	cd ios && fastlane device
endif

--lane-android-internal:
ifneq ($(os), windows)
	cd android && bundle install
	cd android && fastlane beta
else
	cd android & bundle install
	cd android & fastlane beta
endif

--lane-ios-internal:
ifeq ($(os), osx)
	cd ios && bundle install
	cd ios && pod install --repo-update
	cd ios && fastlane beta
endif
