import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_comment/post_comment.dart';
import '../../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../post_details_screen/cubit/post_comment_cubit.dart';

class YoutubeVideoCommentCubit extends PostCommentCubit {
  YoutubeVideoCommentCubit({
    required super.controller,
    required super.failureHandlerManager,
    required super.postId,
    required super.loadingManager,
    required super.postSgmNewsController,
    required super.postCuratorController,
    required super.postCommunityController,
    required this.youtubeVideoController,
  }) : super(postType: PostType.SGM_NEWS);

  final YoutubeVideoController youtubeVideoController;

  @override
  Future<Result<Failure, int>> performGetCommentCount(int postId) async {
    final response =
        await youtubeVideoController.getYoutubeVideoById(id: postId);
    return response.mapResult(
        onLeft: (failure) => failure,
        onRight: (value) => value.commentCounter ?? 0);
  }

  @override
  Future<Result<Failure, SuccessResponse>> performDeleteComment(
      {required int commentId, required int postId}) {
    return youtubeVideoController.deleteComment(
      commentId: commentId,
      postId: postId,
    );
  }

  @override
  Future<Result<Failure, CommentResponse>> performAddComment(
      {required String content}) {
    return youtubeVideoController.saveComment(
      postId: postId,
      request: CommentCreationRequest(
        content: content,
        commentParentId: state.replying?.id,
      ),
    );
  }

  @override
  Future<Result<Failure, CommentResponse>> performEditComment(
      {required String content}) {
    return youtubeVideoController.editComment(
      postId: postId,
      commentId: state.editing?.id ?? 0,
      request: CommentUpdateRequest(
        content: content,
      ),
    );
  }

  @override
  Future<Result<Failure, PageableData<CommentResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final response = await youtubeVideoController.getYoutubeVideoComments(
        id: postId, size: pageSize, page: page);
    return response.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) => PageableData(
        totalPages: value.totalPages ?? 0,
        data: value.content ?? [],
      ),
    );
  }
}
