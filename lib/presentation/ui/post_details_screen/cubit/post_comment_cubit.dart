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

part 'post_comment_state.dart';

class PostCommentCubit
    extends InfiniteLoaderCubit<PostCommentState, CommentResponse> {
  PostCommentCubit({
    required this.controller,
    required super.failureHandlerManager,
    required this.postId,
    required this.loadingManager,
    required this.postSgmNewsController,
    required this.postCuratorController,
    required this.postCommunityController,
    required this.postType,
  }) : super(
          initialState: const PostCommentState(),
        );

  @override
  void firstLoad() {
    super.firstLoad();
    reloadCommentCount();
  }

  @override
  void reload() {
    super.reload();
    reloadCommentCount();
  }

  @protected
  Future<Result<Failure, int>> performGetCommentCount(int postId) async {
    Result<Failure, PostResponse> postResponse;
    switch (postType) {
      case PostType.COMMUNITY:
        postResponse =
            await postCommunityController.getCommunityPostById(id: postId);
        break;
      case PostType.CURATOR:
        postResponse =
            await postCuratorController.getCuratorPostById(id: postId);
        break;
      case PostType.SGM_NEWS:
        postResponse =
            await postSgmNewsController.getPostSgmNewsById(id: postId);
        break;
    }
    return postResponse.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) => value.commentCounter ?? 0,
    );
  }

  void reloadCommentCount() async {
    final Result<Failure, int> commentCountResult =
        await performGetCommentCount(postId);

    commentCountResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    commentCountResult.handleRight((value) {
      emit(state.copyWith(
        commentCount: value,
      ));
    });
  }

  final PostCommentController controller;
  final int postId;
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

  @protected
  Future<Result<Failure, SuccessResponse>> performReportComment({
    required int commentId,
    required int postId,
  }) {
    return controller.reportComment(
      commentId: commentId,
      postId: postId,
    );
  }

  void deleteComment(int index, {int? parentIndex}) async {
    int commentId = state.data[index].id ?? 0;
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
      PostCommentState currentState = state.copyWith(
          data: currentComments, commentCount: state.commentCount - 1);
      currentState = currentState.unsetReplying();
      emit(currentState);
    });
  }

  void reportComment(int index, {int? parentIndex}) async {
    int commentId = state.data[index].id ?? 0;
    if (parentIndex != null) {
      commentId = state.data[parentIndex].childComments?[index].id ?? 0;
    }
    final reportCommentResult = await loadingManager.startLoading(
      future: performReportComment(commentId: commentId, postId: postId),
    );
    reportCommentResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
  }

  @protected
  Future<Result<Failure, CommentResponse>> performAddComment(
      {required String content}) {
    return controller.saveComment(
      postId: postId,
      request: CommentCreationRequest(
        content: content,
        commentParentId: state.replying?.id,
      ),
    );
  }

  void _addComment(String content) async {
    final savedCommentResult = await loadingManager.startLoading(
      future: performAddComment(
        content: content,
      ),
    );
    savedCommentResult.handleLeft(
      (value) {
        failureHandlerManager.handle(value);
      },
    );

    savedCommentResult.handleRight((value) {
      final currentComments = List<CommentResponse>.from(state.data);
      if (state.replyingIndex == null) {
        currentComments.insert(0, value);
      } else {
        currentComments[state.replyingIndex!]
            .childComments
            ?.insert(0, ChildCommentResponse.fromComment(value));
      }
      PostCommentState currentState = state.copyWith(
          data: currentComments, commentCount: state.commentCount + 1);
      currentState = currentState.unsetReplying();
      emit(currentState);
    });
  }

  void submitComment(String content) async {
    if (state.editing == null) {
      _addComment(content);
    } else {
      _editComment(content);
    }
  }

  @protected
  Future<Result<Failure, CommentResponse>> performEditComment(
      {required String content}) {
    return controller.editComment(
      postId: postId,
      commentId: state.editing?.id ?? 0,
      request: CommentUpdateRequest(
        content: content,
      ),
    );
  }

  void _editComment(String content) async {
    final savedCommentResult = await loadingManager.startLoading(
      future: performEditComment(content: content),
    );
    savedCommentResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });

    savedCommentResult.handleRight((value) {
      final currentComments = List<CommentResponse>.from(state.data);
      if (state.editingParentIndex == null && state.editingIndex != null) {
        currentComments[state.editingIndex!] =
            currentComments[state.editingIndex!].copyWith(content: content);
      } else if (state.editingParentIndex != null &&
          state.editingIndex != null) {
        final targetChild = currentComments[state.editingParentIndex!]
            .childComments?[state.editingIndex!];
        if (targetChild != null) {
          currentComments[state.editingParentIndex!]
                  .childComments?[state.editingIndex!] =
              targetChild.copyWith(content: content);
        }
      }
      PostCommentState currentState = state.copyWith(data: currentComments);
      currentState = currentState.unSetEdit();
      emit(currentState);
    });
  }

  void setReply(CommentResponse parent, int index) {
    emit(state.setReplying(parent, index));
  }

  void cancelReply() {
    emit(state.unsetReplying());
  }

  void setEdit(ChildCommentResponse response, int index, {int? parentIndex}) {
    emit(state.setEdit(response, index, parentIndex: parentIndex));
  }

  void unSetEdit() {
    emit(state.unSetEdit());
  }

  void synced() {
    emit(state.synced());
  }

  @override
  Future<Result<Failure, PageableData<CommentResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final response = await controller.getComments(
        postId: postId, size: pageSize, page: page);
    return response.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) => PageableData(
        totalPages: value.totalPages ?? 0,
        data: value.content ?? [],
      ),
    );
  }
}
