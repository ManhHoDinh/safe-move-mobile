import 'package:dart_mappable/dart_mappable.dart';

part 'cancel_order_request.mapper.dart';

@MappableClass()
class CancelOrderRequest with CancelOrderRequestMappable {
  const CancelOrderRequest({
    required this.orderId,
  });

  final int orderId;
}
