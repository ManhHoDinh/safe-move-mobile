// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'term_type.dart';

class TermTypeMapper extends EnumMapper<TermType> {
  TermTypeMapper._();

  static TermTypeMapper? _instance;
  static TermTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TermTypeMapper._());
    }
    return _instance!;
  }

  static TermType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TermType decode(dynamic value) {
    switch (value) {
      case 'TERM_OF_SERVICE':
        return TermType.TERM_OF_SERVICE;
      case 'TERM_AND_COND':
        return TermType.TERM_AND_COND;
      case 'MALL_TERMS_OF_USE':
        return TermType.MALL_TERMS_OF_USE;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TermType self) {
    switch (self) {
      case TermType.TERM_OF_SERVICE:
        return 'TERM_OF_SERVICE';
      case TermType.TERM_AND_COND:
        return 'TERM_AND_COND';
      case TermType.MALL_TERMS_OF_USE:
        return 'MALL_TERMS_OF_USE';
    }
  }
}

extension TermTypeMapperExtension on TermType {
  String toValue() {
    TermTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TermType>(this) as String;
  }
}
