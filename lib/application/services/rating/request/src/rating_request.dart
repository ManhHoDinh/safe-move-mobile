import 'package:dart_mappable/dart_mappable.dart';

import '../../../user/request/request.dart';

part 'rating_request.mapper.dart';

@MappableClass()
class RatingRequest with RatingRequestMappable {
  const RatingRequest({
    this.content,
    required this.ratingPoint,
    required this.productId,
    this.images,
  });

  factory RatingRequest.fromJson(Map<String, dynamic> json) =>
      RatingRequestMapper.fromJson(json);

  final String? content;
  final int ratingPoint;
  final int productId;
  final List<FileRequest>? images;
}
