import 'package:dart_mappable/dart_mappable.dart';

import '../../../file/file.dart';
import '../../../user/dto/dto.dart';

part 'rating_response.mapper.dart';

@MappableClass()
class RatingResponse with RatingResponseMappable {
  const RatingResponse({
    this.id,
    this.writer,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.content,
    this.ratingPoint,
    this.isHidden,
  });

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      RatingResponseMapper.fromJson(json);

  final int? id;
  final UserDTO? writer;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<FileResponse>? images;
  final String? content;
  final int? ratingPoint;
  final bool? isHidden;
}
