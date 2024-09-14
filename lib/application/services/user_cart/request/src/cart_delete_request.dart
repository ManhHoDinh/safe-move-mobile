import 'package:dart_mappable/dart_mappable.dart';

part 'cart_delete_request.mapper.dart';

@MappableClass()
class CartDeleteRequest with CartDeleteRequestMappable {
  const CartDeleteRequest({
    required this.ids,
  });

  final List<int> ids;
}
