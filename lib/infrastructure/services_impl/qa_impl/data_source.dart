import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/qa/qa.dart';

part 'data_source.g.dart';

@RestApi()
abstract class QADataSource {
  factory QADataSource(Dio dio, {String baseUrl}) = _QADataSource;

  @GET('/v1/qas')
  Future<PagingResponse<QAResponse>> getQAs({
    @Query('page') int? page,
    @Query('size') required int size,
    @Query('productId') required int productId,
  });

  @POST('/v1/user/qas')
  Future<QAResponse> addQA({
    @Body() required QACreateRequest request,
  });

  @GET('/v1/user/qas')
  Future<PagingResponse<QAUserResponse>> getQAsByFilter({
    @Query('page') int? page,
    @Query('size') required int size,
    @Query('filter') required String filter,
    @Query('type') required String type,
  });

  @DELETE('/v1/user/qas/{id}')
  Future<QAResponse> deleteQAById({
    @Path('id') required int id,
  });
}
