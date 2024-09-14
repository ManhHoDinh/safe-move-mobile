import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_comment/post_comment.dart';
import '../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';

part 'youtube_controller_impl.g.dart';

@RestApi()
abstract class YoutubeControllerDataSource {
  factory YoutubeControllerDataSource(Dio dio, {String baseUrl}) =
      _YoutubeControllerDataSource;

  @GET('/v1/youtube-videos')
  Future<PagingResponse<YoutubeResponse>> getPlayList({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('keyword') String? keyword,
    @Query('youtubeVideoType') YoutubeVideoType? youtubeVideoType,
    @Query('sort') YoutubeVideoSort? sort,
  });

  @GET('/v1/youtube-videos/{id}')
  Future<YoutubeResponse> getYoutubeVideoById({
    @Path('id') required int id,
  });

  @GET('/v1/youtube-videos/{id}/comments')
  Future<PagingResponse<CommentResponse>> getYoutubeVideoComments({
    @Path('id') required int id,
    @Query('page') int? page,
    @Query('size') int? size,
  });

  @POST('/v1/user/youtube-videos/{postId}/comments')
  Future<CommentResponse> saveComment({
    @Path('postId') required int postId,
    @Body() required CommentCreationRequest request,
  });

  @PUT('/v1/user/youtube-videos/{postId}/comments/{commentId}')
  Future<CommentResponse> editComment({
    @Path('postId') required int postId,
    @Path('commentId') required int commentId,
    @Body() required CommentUpdateRequest request,
  });

  @DELETE('/v1/user/youtube-videos/{postId}/comments/{commentId}')
  Future<SuccessResponse> deleteComment({
    @Path('postId') required int postId,
    @Path('commentId') required int commentId,
  });

  @PATCH('/v1/user/youtube-videos/{postId}/reaction')
  Future<SuccessResponse> reactPost({
    @Body() required ReactionRequest request,
    @Path('postId') required int postId,
  });
}

class YoutubeVideoControllerImpl
    with YoutubeVideoController, DataSourceErrorHandler {
  const YoutubeVideoControllerImpl({
    required this.dataSource,
  });

  final YoutubeControllerDataSource dataSource;

  @override
  Future<Result<Failure, PagingResponse<YoutubeResponse>>> getPlayList({
    int? page,
    int? size,
    String? keyword,
    YoutubeVideoType? youtubeVideoType,
    YoutubeVideoSort? sort,
  }) {
    return handleApiResult(
      future: () => dataSource.getPlayList(
        page: page,
        size: size,
        keyword: keyword,
        youtubeVideoType: youtubeVideoType,
        sort: sort,
      ),
    );
  }

  @override
  Future<Result<Failure, YoutubeResponse>> getYoutubeVideoById(
      {required int id}) {
    return handleApiResult(
      future: () => dataSource.getYoutubeVideoById(
        id: id,
      ),
    );
  }

  @override
  Future<Result<Failure, PagingResponse<CommentResponse>>>
      getYoutubeVideoComments({required int id, int? page, int? size}) {
    return handleApiResult(
      future: () => dataSource.getYoutubeVideoComments(
        id: id,
        page: page,
        size: size,
      ),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteComment(
      {required int postId, required int commentId}) {
    return handleApiResult(
      future: () => dataSource.deleteComment(
        postId: postId,
        commentId: commentId,
      ),
    );
  }

  @override
  Future<Result<Failure, CommentResponse>> editComment(
      {required int postId,
      required int commentId,
      required CommentUpdateRequest request}) {
    return handleApiResult(
      future: () => dataSource.editComment(
        postId: postId,
        commentId: commentId,
        request: request,
      ),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> reactYoutubeVideo(
      {required int id, required ReactionRequest request}) {
    return handleApiResult(
      future: () => dataSource.reactPost(
        postId: id,
        request: request,
      ),
    );
  }

  @override
  Future<Result<Failure, CommentResponse>> saveComment(
      {required int postId, required CommentCreationRequest request}) {
    return handleApiResult(
      future: () => dataSource.saveComment(
        postId: postId,
        request: request,
      ),
    );
  }
}
