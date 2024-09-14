import 'package:dart_mappable/dart_mappable.dart';
part 'order_details_session_create_request.mapper.dart';

@MappableClass()
class OrderDetailsSessionCreateRequest
    with OrderDetailsSessionCreateRequestMappable {
  const OrderDetailsSessionCreateRequest({
    required this.productId,
    required this.currentPrice,
    required this.quantity,
  });

  factory OrderDetailsSessionCreateRequest.fromJson(
          Map<String, dynamic> json) =>
      OrderDetailsSessionCreateRequestMapper.fromJson(json);

  final int productId;
  final double currentPrice;
  final int quantity;
}
