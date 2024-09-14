import 'package:dart_mappable/dart_mappable.dart';

part 'cart_update_request.mapper.dart';

@MappableClass()
class CartUpdateRequest with CartUpdateRequestMappable {
  const CartUpdateRequest({
    required this.quantity,
  });

  final int quantity;
}
