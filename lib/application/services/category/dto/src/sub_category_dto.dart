import 'package:dart_mappable/dart_mappable.dart';

import 'category_type.dart';

part 'sub_category_dto.mapper.dart';

@MappableClass()
class SubCategoryDTO with SubCategoryDTOMappable {
  const SubCategoryDTO({
    this.id,
    this.name,
    this.categoryType,
    this.nameKorea,
    this.nameEnglish,
    this.nameChina,
    this.nameJapan,
  });

  factory SubCategoryDTO.fromJson(Map<String, dynamic> json) =>
      SubCategoryDTOMapper.fromJson(json);

  final int? id;
  final String? name;
  final CategoryType? categoryType;
  final String? nameKorea;
  final String? nameEnglish;
  final String? nameChina;
  final String? nameJapan;
}
