import 'package:dart_mappable/dart_mappable.dart';

import '../../../product/product.dart';
import '../../../user/user.dart';

part 'cart_response.mapper.dart';

@MappableClass()
class CartResponse with CartResponseMappable {
  const CartResponse({
    this.id,
    this.user,
    this.product,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      CartResponseMapper.fromJson(json);

  final int? id;
  final UserDTO? user;
  final ProductResponse? product;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
