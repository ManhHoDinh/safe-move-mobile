// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'qa_filter_type.dart';

class QAFilterTypeMapper extends EnumMapper<QAFilterType> {
  QAFilterTypeMapper._();

  static QAFilterTypeMapper? _instance;
  static QAFilterTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QAFilterTypeMapper._());
    }
    return _instance!;
  }

  static QAFilterType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  QAFilterType decode(dynamic value) {
    switch (value) {
      case 'ALL':
        return QAFilterType.all;
      case 'YES':
        return QAFilterType.yes;
      case 'NO':
        return QAFilterType.no;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(QAFilterType self) {
    switch (self) {
      case QAFilterType.all:
        return 'ALL';
      case QAFilterType.yes:
        return 'YES';
      case QAFilterType.no:
        return 'NO';
    }
  }
}

extension QAFilterTypeMapperExtension on QAFilterType {
  String toValue() {
    QAFilterTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<QAFilterType>(this) as String;
  }
}
