import 'package:dart_mappable/dart_mappable.dart';

import '../../../product/product.dart';

part 'order_detail_response.mapper.dart';

@MappableClass()
class OrderDetailResponse with OrderDetailResponseMappable {
  const OrderDetailResponse({
    this.id,
    this.productResponse,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponseMapper.fromJson(json);

  final int? id;
  final ProductResponse? productResponse;
  final double? currentPrice;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
