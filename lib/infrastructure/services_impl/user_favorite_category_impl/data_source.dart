import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/category/category.dart';
import '../../../application/services/user_favorite_category/user_favorite_category.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserFavoriteCategoryDataSource {
  factory UserFavoriteCategoryDataSource(Dio dio, {String baseUrl}) =
      _UserFavoriteCategoryDataSource;

  @POST('/v1/user/categories/{categoryId}/favorite')
  Future<CategoryDTO> setCategoryIsFavorite({
    @Path('categoryId') required int categoryId,
    @Body() required FavoriteCategoryRequest request,
  });
}
