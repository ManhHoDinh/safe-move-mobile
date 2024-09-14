import 'package:dart_mappable/dart_mappable.dart';

part 'confirm_order_request.mapper.dart';

@MappableClass()
class ConfirmOrderRequest with ConfirmOrderRequestMappable {
  const ConfirmOrderRequest({
    required this.orderId,
    required this.paymentKey,
    required this.amount,
    required this.orderSessionId,
  });

  final String orderId;
  final String paymentKey;
  final String amount;
  final int orderSessionId;
}
