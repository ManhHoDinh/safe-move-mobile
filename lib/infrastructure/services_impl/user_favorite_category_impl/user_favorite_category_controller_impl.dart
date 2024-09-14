import '../../../application/services/category/category.dart';
import '../../../application/services/user_favorite_category/user_favorite_category.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserFavoriteCategoryControllerImpl
    with UserFavoriteCategoryController, DataSourceErrorHandler {
  UserFavoriteCategoryControllerImpl({
    required this.userFavoriteCategoryDataSource,
  });

  final UserFavoriteCategoryDataSource userFavoriteCategoryDataSource;

  @override
  Future<Result<Failure, CategoryDTO>> setCategoryIsFavorite(
      {required int categoryId, required FavoriteCategoryRequest request}) {
    return handleApiResult(
      future: () => userFavoriteCategoryDataSource.setCategoryIsFavorite(
          categoryId: categoryId, request: request),
    );
  }
}
