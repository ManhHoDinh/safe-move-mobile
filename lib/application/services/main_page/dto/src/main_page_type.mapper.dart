// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'main_page_type.dart';

class MainPageTypeMapper extends EnumMapper<MainPageType> {
  MainPageTypeMapper._();

  static MainPageTypeMapper? _instance;
  static MainPageTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MainPageTypeMapper._());
    }
    return _instance!;
  }

  static MainPageType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MainPageType decode(dynamic value) {
    switch (value) {
      case 'MAIN':
        return MainPageType.MAIN;
      case 'BEST_CONTENT':
        return MainPageType.BEST_CONTENT;
      case 'ONLINE_MAGAZINE':
        return MainPageType.ONLINE_MAGAZINE;
      case 'BEST_REVIEW':
        return MainPageType.BEST_REVIEW;
      case 'SGM_NEWS':
        return MainPageType.SGM_NEWS;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MainPageType self) {
    switch (self) {
      case MainPageType.MAIN:
        return 'MAIN';
      case MainPageType.BEST_CONTENT:
        return 'BEST_CONTENT';
      case MainPageType.ONLINE_MAGAZINE:
        return 'ONLINE_MAGAZINE';
      case MainPageType.BEST_REVIEW:
        return 'BEST_REVIEW';
      case MainPageType.SGM_NEWS:
        return 'SGM_NEWS';
    }
  }
}

extension MainPageTypeMapperExtension on MainPageType {
  String toValue() {
    MainPageTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MainPageType>(this) as String;
  }
}
