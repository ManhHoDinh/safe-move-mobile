# kimes_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# kimes-mobile

## SDK Version

- Flutter: 3.19.3
- `lcov` installed with `choco` on `Windows` or `brew` on UNIX

## **INIT VERY IMPORTANT**

```shell
make
```

or

```shell
make init
```

## Color gen + Assets gen + Route gen + Language gen

```shell
make gen
```

### Color gen

```shell
make gen-color
```

### Locale gen

```shell
make gen-locale
```

## Clean

```shell
make clean
```

## Get

```shell
make get
```

## Format

```shell
make format
```

## Analyze

```shell
make lint
```

## Build

```shell
make build
```

### Debug

```shell
make build-debug
```

### Profile

```shell
make build-profile
```

### Release

```shell
make build-release
```

## Test

```shell
make test
```

## Image generation guide

- Add to `assets/`
- Add to `pubspec.yaml`
- Add to `assets_loader_handler.dart` // search this file

## Match passphrase

```
kimes
```

## Fastlane

- Register device
```shell
make lane-device
```

- Beta (Firebase App Distribution)

```shell
make lane
```

## Tag

- Local

```
git tag -a <tag_name> -m "<message>"
```

- Delete local:

```
git tag --delete <tag_name>
```

- Remote:

```
git push origin <tag_name>
```

- Delete remote:

```
git push -d origin <tag_name>
```

- Push all tags:

```
git push --tags
```


## Gen App Icon

dart run flutter_launcher_icons

## Gen App Splash

To gen

```shell
dart run flutter_native_splash:create
```

To remove

```shell
dart run flutter_native_splash:remove
```


## To rename app
- https://pub.dev/packages/rename