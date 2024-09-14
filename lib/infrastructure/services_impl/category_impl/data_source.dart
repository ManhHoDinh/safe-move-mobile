import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/category/category.dart';

part 'data_source.g.dart';

@RestApi()
abstract class CategoryDataSource {
  factory CategoryDataSource(Dio dio, {String baseUrl}) = _CategoryDataSource;

  @POST('/v1/category/get-all-category')
  Future<List<CategoryDTO>> getAllCategory(
    @Body() GetAllCategoryRequest request,
  );

  @GET('/v1/category/{id}')
  Future<CategoryDTO> getCategoryById(
    @Path('id') int id,
  );
}
