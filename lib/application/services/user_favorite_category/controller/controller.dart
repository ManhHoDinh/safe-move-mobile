import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../category/category.dart';
import '../user_favorite_category.dart';

mixin UserFavoriteCategoryController {
  Future<Result<Failure, CategoryDTO>> setCategoryIsFavorite({
    required int categoryId,
    required FavoriteCategoryRequest request,
  });
}
