import 'package:dart_mappable/dart_mappable.dart';

part 'favorite_category_request.mapper.dart';

@MappableClass()
class FavoriteCategoryRequest with FavoriteCategoryRequestMappable {
  const FavoriteCategoryRequest({
    required this.isFavorite,
  });

  final bool isFavorite;
}
