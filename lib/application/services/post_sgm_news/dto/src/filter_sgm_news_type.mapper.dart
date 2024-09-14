// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filter_sgm_news_type.dart';

class FilterSgmNewsTypeMapper extends EnumMapper<FilterSgmNewsType> {
  FilterSgmNewsTypeMapper._();

  static FilterSgmNewsTypeMapper? _instance;
  static FilterSgmNewsTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterSgmNewsTypeMapper._());
    }
    return _instance!;
  }

  static FilterSgmNewsType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FilterSgmNewsType decode(dynamic value) {
    switch (value) {
      case 'POPULAR':
        return FilterSgmNewsType.POPULAR;
      case 'LATEST':
        return FilterSgmNewsType.LATEST;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FilterSgmNewsType self) {
    switch (self) {
      case FilterSgmNewsType.POPULAR:
        return 'POPULAR';
      case FilterSgmNewsType.LATEST:
        return 'LATEST';
    }
  }
}

extension FilterSgmNewsTypeMapperExtension on FilterSgmNewsType {
  String toValue() {
    FilterSgmNewsTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FilterSgmNewsType>(this) as String;
  }
}
