part of 'post_comment_cubit.dart';

class PostCommentState extends InfiniteLoaderState<CommentResponse> {
  const PostCommentState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    this.replying,
    this.replyingIndex,
    this.commentCount = 0,
    this.needEditContentSync = false,
    this.editing,
    this.editingIndex,
    this.editingParentIndex,
  });

  final CommentResponse? replying;
  final int? replyingIndex;
  final int commentCount;

  final ChildCommentResponse? editing;
  final int? editingParentIndex;
  final int? editingIndex;
  final bool needEditContentSync;

  PostCommentState setReplying(CommentResponse replying, int index) {
    return PostCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      replying: replying,
      replyingIndex: index,
      commentCount: commentCount,
    );
  }

  PostCommentState setEdit(ChildCommentResponse editing, int? index,
      {int? parentIndex}) {
    return PostCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      commentCount: commentCount,
      editing: editing,
      editingParentIndex: parentIndex,
      editingIndex: index,
      needEditContentSync: true,
    );
  }

  PostCommentState synced() {
    return PostCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      commentCount: commentCount,
      editing: editing,
      editingParentIndex: editingParentIndex,
      editingIndex: editingIndex,
    );
  }

  PostCommentState unSetEdit() {
    return PostCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      commentCount: commentCount,
    );
  }

  PostCommentState unsetReplying() {
    return PostCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      commentCount: commentCount,
    );
  }

  @override
  InfiniteLoaderState<CommentResponse> loadingManagementStateChanged({
    List<CommentResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return PostCommentState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      commentCount: commentCount,
    );
  }

  PostCommentState copyWith({
    List<CommentResponse>? data,
    int? commentCount,
  }) {
    return PostCommentState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      replying: replying,
      replyingIndex: replyingIndex,
      editing: editing,
      editingIndex: editingIndex,
      editingParentIndex: editingParentIndex,
      needEditContentSync: needEditContentSync,
      commentCount: commentCount ?? this.commentCount,
    );
  }
}
