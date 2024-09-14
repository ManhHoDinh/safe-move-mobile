import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/response/response.dart';
import '../../../application/services/user_cart/user_cart.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserCartDataSource {
  factory UserCartDataSource(Dio dio, {String baseUrl}) = _UserCartDataSource;

  @GET('/v1/user/carts')
  Future<PagingResponse<CartResponse>> getCarts({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @POST('/v1/user/carts')
  Future<CartResponse> addCart({@Body() required CartCreateRequest request});

  @PATCH('/v1/user/carts/{id}')
  Future<CartResponse> updateCart({
    @Path('id') required String id,
    @Body() required CartUpdateRequest request,
  });

  @DELETE('/v1/user/carts')
  Future<SuccessResponse> deleteCart({
    @Body() required CartDeleteRequest request,
  });

  @DELETE('/v1/user/carts/all')
  Future<SuccessResponse> deleteCartAll();
}
