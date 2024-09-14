import 'package:dart_mappable/dart_mappable.dart';

import 'category_type.dart';
import 'sub_category_dto.dart';

part 'category_dto.mapper.dart';

@MappableClass()
class CategoryDTO with CategoryDTOMappable {
  const CategoryDTO({
    this.id,
    this.nameKorea,
    this.nameEnglish,
    this.nameChina,
    this.nameJapan,
    this.categoryType,
    this.children,
    this.isRoot,
    this.isFavorite,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      CategoryDTOMapper.fromJson(json);

  final int? id;
  final String? nameKorea;
  final String? nameEnglish;
  final String? nameChina;
  final String? nameJapan;
  final CategoryType? categoryType;
  final List<SubCategoryDTO>? children;
  final bool? isRoot;
  final bool? isFavorite;
}
