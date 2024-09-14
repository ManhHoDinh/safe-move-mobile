import 'package:dart_mappable/dart_mappable.dart';

part 'cart_create_request.mapper.dart';

@MappableClass()
class CartCreateRequest with CartCreateRequestMappable {
  const CartCreateRequest({
    required this.productId,
    required this.quantity,
  });

  final int productId;
  final int quantity;
}
