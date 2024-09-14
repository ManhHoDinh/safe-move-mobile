import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_community/post_community.dart';
part 'data_source.g.dart';

@RestApi()
abstract class AdminPostCuratorDataSource {
  factory AdminPostCuratorDataSource(Dio dio, {String baseUrl}) =
      _AdminPostCuratorDataSource;

  @POST('/v1/admin/posts/curators')
  Future<PostResponse> saveCuratorPost({
    @Body() required PostRequest request,
  });

  @PUT('/v1/admin/posts/curators/{id}')
  Future<PostResponse> updateCuratorPost({
    @Path('id') required int id,
    @Body() required PostRequest request,
  });

  @DELETE('/v1/admin/posts/curators/{id}')
  Future<SuccessResponse> deleteCuratorPost({
    @Path('id') required int id,
  });
}
