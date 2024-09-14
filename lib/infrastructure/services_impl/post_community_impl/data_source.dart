import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_community/post_community.dart';

part 'data_source.g.dart';

@RestApi()
abstract class PostCommunityDataSource {
  factory PostCommunityDataSource(Dio dio, {String baseUrl}) =
      _PostCommunityDataSource;

  @GET('/v1/posts/communities')
  Future<PagingResponse<PostResponse>> getCommunityPosts({
    @Query('categoryId') int? categoryId,
    @Query('filter') FilterCommunityPost? filter,
    @Query('postLanguage') PostLanguage? postLanguage,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/posts/communities/{id}')
  Future<PostResponse> getCommunityPostById({
    @Path('id') required int id,
  });

  @POST('/v1/user/posts/communities')
  Future<PostResponse> saveCommunityPost({
    @Body() required PostRequest request,
  });

  @PUT('/v1/user/posts/communities/{id}')
  Future<PostResponse> updateCommunityPost({
    @Path('id') required int id,
    @Body() required PostRequest request,
  });

  @DELETE('/v1/user/posts/communities/{id}')
  Future<SuccessResponse> deleteCommunityPost({
    @Path('id') required int id,
  });

  @POST('/v1/user/posts/communities/{id}/report')
  Future<SuccessResponse> reportCommunityPost({
    @Path('id') required int id,
  });

  @GET('/v1/admin/posts/reported')
  Future<PagingResponse<PostResponse>> getReportedCommunityPosts({
    @Query('postLanguage') PostLanguage? postLanguage,
    @Query('keyword') String? keyword,
    @Query('page') int? page,
    @Query('size') required int size,
  });
}
