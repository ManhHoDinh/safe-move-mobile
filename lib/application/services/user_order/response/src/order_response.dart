import 'package:dart_mappable/dart_mappable.dart';

import '../../../user/user.dart';
import '../../user_order.dart';

part 'order_response.mapper.dart';

@MappableClass()
class OrderResponse with OrderResponseMappable {
  const OrderResponse({
    this.id,
    this.user,
    this.orderDetailResponses,
    this.productsPrice,
    this.shippingFee,
    this.discountPrice,
    this.totalPrice,
    this.zipCode,
    this.mainAddress,
    this.detailAddress,
    this.phoneNumber,
    this.name,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
    this.courierId,
    this.courierName,
    this.trackingId,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      OrderResponseMapper.fromJson(json);

  final int? id;
  final UserDTO? user;
  final List<OrderDetailResponse>? orderDetailResponses;
  final double? productsPrice;
  final double? shippingFee;
  final double? discountPrice;
  final double? totalPrice;
  final String? zipCode;
  final String? mainAddress;
  final String? detailAddress;
  final String? phoneNumber;
  final String? name;
  final OrderStatusType? orderStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? courierId;
  final String? courierName;
  final String? trackingId;
}
