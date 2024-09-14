import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_comment/post_comment.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';

part 'data_source.g.dart';

@RestApi()
abstract class PostCommentDataSource {
  factory PostCommentDataSource(Dio dio, {String baseUrl}) =
      _PostCommentDataSource;

  @GET('/v1/posts/{postId}/comments')
  Future<PagingResponse<CommentResponse>> getComments({
    @Query('page') int? page,
    @Path('postId') required int postId,
    @Query('size') required int size,
  });

  @POST('/v1/user/posts/{postId}/comments')
  Future<CommentResponse> saveComment({
    @Path('postId') required int postId,
    @Body() required CommentCreationRequest request,
  });

  @PUT('/v1/user/posts/{postId}/comments/{commentId}')
  Future<CommentResponse> editComment({
    @Path('postId') required int postId,
    @Path('commentId') required int commentId,
    @Body() required CommentUpdateRequest request,
  });

  @DELETE('/v1/user/posts/{postId}/comments/{commentId}')
  Future<SuccessResponse> deleteComment({
    @Path('postId') required int postId,
    @Path('commentId') required int commentId,
  });

  @POST('/v1/user/posts/{postId}/comments/{commentId}/report')
  Future<SuccessResponse> reportComment({
    @Path('postId') required int postId,
    @Path('commentId') required int commentId,
  });

  @GET('/v1/admin/posts/comments/reported')
  Future<PagingResponse<CommentResponse>> getReportedComments({
    @Query('page') int? page,
    @Query('size') required int size,
  });
}
