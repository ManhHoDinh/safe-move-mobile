// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category_type.dart';

class CategoryTypeMapper extends EnumMapper<CategoryType> {
  CategoryTypeMapper._();

  static CategoryTypeMapper? _instance;
  static CategoryTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryTypeMapper._());
    }
    return _instance!;
  }

  static CategoryType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CategoryType decode(dynamic value) {
    switch (value) {
      case 'COMMUNITY':
        return CategoryType.community;
      case 'CURATOR':
        return CategoryType.curator;
      case 'SGM_NEWS':
        return CategoryType.sgmNews;
      case 'STORE':
        return CategoryType.store;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CategoryType self) {
    switch (self) {
      case CategoryType.community:
        return 'COMMUNITY';
      case CategoryType.curator:
        return 'CURATOR';
      case CategoryType.sgmNews:
        return 'SGM_NEWS';
      case CategoryType.store:
        return 'STORE';
    }
  }
}

extension CategoryTypeMapperExtension on CategoryType {
  String toValue() {
    CategoryTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CategoryType>(this) as String;
  }
}
