import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/user_address/user_address.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserAddressDataSource {
  factory UserAddressDataSource(Dio dio, {String baseUrl}) =
      _UserAddressDataSource;

  @GET('/v1/user/addresses')
  Future<PagingResponse<AddressResponse>> getAddresses({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @POST('/v1/user/addresses')
  Future<AddressResponse> addAddress(@Body() AddressRequest request);

  @GET('/v1/user/addresses/{id}')
  Future<AddressResponse> getAddressById({
    @Path('id') required int id,
  });

  @PUT('/v1/user/addresses/{id}')
  Future<AddressResponse> updateAddress({
    @Path('id') required int id,
    @Body() required AddressRequest request,
  });

  @DELETE('/v1/user/addresses/{id}')
  Future<SuccessResponse> deleteAddressById({
    @Path('id') required int id,
  });
}
