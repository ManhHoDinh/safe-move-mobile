import 'package:dart_mappable/dart_mappable.dart';

import '../../../category/category.dart';
import '../../../common/common.dart';
import '../../../file/file.dart';

part 'product_response.mapper.dart';

@MappableClass()
class ProductResponse with ProductResponseMappable {
  const ProductResponse({
    this.id,
    this.title,
    this.description,
    this.unitInStock,
    this.originalPrice,
    this.currentPrice,
    this.defaultShippingFee,
    this.jejuShippingFee,
    this.ruralShippingFee,
    this.images,
    this.category,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.ratingPoint,
    this.totalUserRating,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponseMapper.fromJson(json);

  final int? id;
  final LocalizedFieldValue? title;
  final LocalizedFieldValue? description;
  final int? unitInStock;
  final double? originalPrice;
  final double? currentPrice;
  final double? defaultShippingFee;
  final double? jejuShippingFee;
  final double? ruralShippingFee;
  final List<FileResponse>? images;
  final CategoryDTO? category;
  final int? totalUserRating;
  final bool? isDeleted;
  final double? ratingPoint;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
