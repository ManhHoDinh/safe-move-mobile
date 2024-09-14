import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';

part 'data_source.g.dart';

@RestApi()
abstract class PostCuratorDataSource {
  factory PostCuratorDataSource(Dio dio, {String baseUrl}) =
      _PostCuratorDataSource;

  @GET('/v1/posts/curators')
  Future<PagingResponse<PostResponse>> getCuratorPosts({
    @Query('postLanguage') PostLanguage? postLanguage,
    @Query('parentCategoryId') int? parentCategoryId,
    @Query('childCategoryIds') List<int>? childCategoryIds,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/posts/curators/{id}')
  Future<PostResponse> getCuratorPostById({
    @Path('id') required int id,
  });
}
