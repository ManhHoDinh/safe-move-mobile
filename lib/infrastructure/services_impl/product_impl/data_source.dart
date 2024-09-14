import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/response/src/paging_response.dart';
import '../../../application/services/product/response/src/product_response.dart';

part 'data_source.g.dart';

@RestApi()
abstract class ProductDataSource {
  factory ProductDataSource(Dio dio, {String baseUrl}) = _ProductDataSource;

  @GET('/v1/products')
  Future<PagingResponse<ProductResponse>> getProducts({
    @Query('categoryIds') List<int>? categoryIds,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/products/{id}')
  Future<ProductResponse> getProductById({
    @Path('id') required int id,
  });
}
