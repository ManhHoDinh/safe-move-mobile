import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';
import '../../../user/dto/dto.dart';
import '../../../user_address/user_address.dart';
import 'order_detail_session_response.dart';

part 'order_session_response.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum SessionStatus { paid, unpaid }

@MappableClass()
class OrderSessionResponse with OrderSessionResponseMappable {
  const OrderSessionResponse({
    this.id,
    this.user,
    this.productsPrice,
    this.shippingFee,
    this.discountPrice,
    this.totalPrice,
    this.zipcode,
    this.mainAddress,
    this.detailAddress,
    this.phoneNumber,
    this.name,
    this.sessionStatus,
    this.createdAt,
    this.updatedAt,
    this.orderDetailSessionResponse,
    this.isDefaultAddress,
    this.address,
    this.maxDiscountPrice,
  });

  factory OrderSessionResponse.fromJson(Map<String, dynamic> json) =>
      OrderSessionResponseMapper.fromJson(json);

  final int? id;
  final UserDTO? user;
  final double? productsPrice;
  final double? shippingFee;
  final double? discountPrice;
  final double? maxDiscountPrice;
  final double? totalPrice;
  final String? zipcode;
  final String? mainAddress;
  final String? detailAddress;
  final String? phoneNumber;
  final bool? isDefaultAddress;
  final String? name;
  final AddressResponse? address;
  final SessionStatus? sessionStatus;
  final List<OrderDetailSessionResponse>? orderDetailSessionResponse;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
