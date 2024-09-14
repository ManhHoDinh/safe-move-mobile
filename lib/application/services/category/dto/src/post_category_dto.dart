import 'package:dart_mappable/dart_mappable.dart';

import 'category_type.dart';
import 'sub_category_dto.dart';

part 'post_category_dto.mapper.dart';

@MappableClass()
class PostCategoryDTO with PostCategoryDTOMappable {
  const PostCategoryDTO({
    this.id,
    this.categoryType,
    this.nameKorea,
    this.nameEnglish,
    this.nameChina,
    this.nameJapan,
    this.parent,
  });

  factory PostCategoryDTO.fromJson(Map<String, dynamic> json) =>
      PostCategoryDTOMapper.fromJson(json);

  final int? id;
  final CategoryType? categoryType;
  final String? nameKorea;
  final String? nameEnglish;
  final String? nameChina;
  final String? nameJapan;
  final SubCategoryDTO? parent;
}
