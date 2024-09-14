import 'package:dart_mappable/dart_mappable.dart';

import '../../../category/category.dart';
import '../../../category/dto/src/post_category_dto.dart';
import '../../../file/response/response.dart';
import '../../../user/user.dart';
import '../../common.dart';

part 'post_response.mapper.dart';

@MappableClass()
class PostResponse with PostResponseMappable {
  const PostResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.title,
    this.content,
    this.contentPlainText,
    this.reactionCounter,
    this.viewCounter,
    this.commentCounter,
    this.category,
    this.writer,
    this.isReacted,
    this.type,
    this.thumbnail,
    this.mainThumbnail,
    this.nameOfMainCharacter,
    this.mainPageTitle,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      PostResponseMapper.fromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final PostType? type;
  final PostLanguage? language;
  final String? title;
  final String? content;
  final String? contentPlainText;
  final int? reactionCounter;
  final int? viewCounter;
  final int? commentCounter;
  final PostCategoryDTO? category;
  final UserDTO? writer;
  final bool? isReacted;
  final FileResponse? thumbnail;
  final FileResponse? mainThumbnail;
  final String? nameOfMainCharacter;
  final String? mainPageTitle;
}
