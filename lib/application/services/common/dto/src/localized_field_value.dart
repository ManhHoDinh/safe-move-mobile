import 'package:dart_mappable/dart_mappable.dart';

part 'localized_field_value.mapper.dart';

@MappableClass()
class LocalizedFieldValue with LocalizedFieldValueMappable {
  const LocalizedFieldValue({
    this.id,
    this.kr,
    this.en,
    this.cn,
    this.jp,
  });

  factory LocalizedFieldValue.fromJson(Map<String, dynamic> json) =>
      LocalizedFieldValueMapper.fromJson(json);

  final int? id;
  final String? kr;
  final String? en;
  final String? cn;
  final String? jp;
}
