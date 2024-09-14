import 'package:dart_mappable/dart_mappable.dart';

import '../request.dart';

part 'order_session_create_request.mapper.dart';

@MappableClass()
class OrderSessionCreateRequest with OrderSessionCreateRequestMappable {
  const OrderSessionCreateRequest({
    this.addressId,
    this.discountPrice,
    required this.orderDetailSessionCreateRequests,
  });

  factory OrderSessionCreateRequest.fromJson(Map<String, dynamic> json) =>
      OrderSessionCreateRequestMapper.fromJson(json);

  final int? addressId;
  final double? discountPrice;
  final List<OrderDetailsSessionCreateRequest> orderDetailSessionCreateRequests;
}
