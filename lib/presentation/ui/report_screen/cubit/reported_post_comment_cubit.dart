import 'package:meta/meta.dart';

import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_comment/post_comment.dart';
import '../../../../application/services/post_community/post_community.dart';
import '../../../../application/services/post_curator/post_curator.dart';
import '../../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'reported_post_comment_state.dart';

class ReportedCommentCubit
    extends InfiniteLoaderCubit<ReportedCommentState, CommentResponse> {
  ReportedCommentCubit({
    required this.controller,
    required super.failureHandlerManager,
    required this.loadingManager,
    required this.postSgmNewsController,
    required this.postCuratorController,
    required this.postCommunityController,
    required this.postType,
  }) : super(
          initialState: const ReportedCommentState(),
        );

  final PostCommentController controller;
  final LoadingManager loadingManager;
  final PostCommunityController postCommunityController;
  final PostCuratorController postCuratorController;
  final PostSgmNewsController postSgmNewsController;
  final PostType postType;

  @protected
  Future<Result<Failure, SuccessResponse>> performDeleteComment({
    required int commentId,
    required int postId,
  }) {
    return controller.deleteComment(
      commentId: commentId,
      postId: postId,
    );
  }

  void deleteComment(int index, {int? parentIndex}) async {
    int commentId = state.data[index].id ?? 0;
    int postId = state.data[index].postId ?? 0;
    if (parentIndex != null) {
      commentId = state.data[parentIndex].childComments?[index].id ?? 0;
    }
    final deleteCommentResult = await loadingManager.startLoading(
      future: performDeleteComment(commentId: commentId, postId: postId),
    );
    deleteCommentResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });

    deleteCommentResult.handleRight((value) {
      final currentComments = List<CommentResponse>.from(state.data);
      if (parentIndex == null) {
        currentComments.removeAt(index);
      } else {
        currentComments[parentIndex].childComments?.removeAt(index);
      }
      ReportedCommentState currentState = state.copyWith(
          data: currentComments, commentCount: state.commentCount - 1);
      currentState = currentState.unsetReplying();
      emit(currentState);
    });
  }

  void synced() {
    emit(state.synced());
  }

  @override
  Future<Result<Failure, PageableData<CommentResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final response =
        await controller.getReportedComments(size: pageSize, page: page);
    return response.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) => PageableData(
        totalPages: value.totalPages ?? 0,
        data: value.content ?? [],
      ),
    );
  }
}
