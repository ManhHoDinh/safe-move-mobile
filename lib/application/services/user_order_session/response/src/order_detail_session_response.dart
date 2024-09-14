import 'package:dart_mappable/dart_mappable.dart';
import '../../../product/product.dart';

part 'order_detail_session_response.mapper.dart';

@MappableClass()
class OrderDetailSessionResponse with OrderDetailSessionResponseMappable {
  const OrderDetailSessionResponse({
    this.id,
    this.productResponse,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderDetailSessionResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailSessionResponseMapper.fromJson(json);

  final int? id;
  final ProductResponse? productResponse;
  final double? currentPrice;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
