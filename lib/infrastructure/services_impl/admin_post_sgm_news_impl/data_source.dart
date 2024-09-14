import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_community/post_community.dart';
part 'data_source.g.dart';

@RestApi()
abstract class AdminPostSgmNewsDataSource {
  factory AdminPostSgmNewsDataSource(Dio dio, {String baseUrl}) =
      _AdminPostSgmNewsDataSource;

  @POST('/v1/admin/posts/sgm-news')
  Future<PostResponse> saveSgmNewsPost({
    @Body() required PostRequest request,
  });

  @PUT('/v1/admin/posts/sgm-news/{id}')
  Future<PostResponse> updateSgmNewsPost({
    @Path('id') required int id,
    @Body() required PostRequest request,
  });

  @DELETE('/v1/admin/posts/sgm-news/{id}')
  Future<SuccessResponse> deleteSgmNewsPost({
    @Path('id') required int id,
  });
}
