import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/rating/request/src/rating_request.dart';
import '../../../application/services/rating/response/response.dart';

part 'data_source.g.dart';

@RestApi()
abstract class RatingDataSource {
  factory RatingDataSource(Dio dio, {String baseUrl}) = _RatingDataSource;

  @GET('/v1/ratings')
  Future<PagingResponse<RatingResponse>> getRatings({
    @Query('page') int? page,
    @Query('size') required int size,
    @Query('productId') required int productId,
  });

  @POST('/v1/user/ratings')
  Future<RatingResponse> addRating(@Body() RatingRequest request);

  @DELETE('/v1/user/ratings/{id}')
  Future<SuccessResponse> deleteRatingById({
    @Path('id') required int id,
    @Query('productId') required int productId,
  });
}
