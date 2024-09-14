part of 'reported_post_comment_cubit.dart';

class ReportedCommentState extends InfiniteLoaderState<CommentResponse> {
  const ReportedCommentState({
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

  ReportedCommentState setReplying(CommentResponse replying, int index) {
    return ReportedCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      replying: replying,
      replyingIndex: index,
      commentCount: commentCount,
    );
  }

  ReportedCommentState setEdit(ChildCommentResponse editing, int? index,
      {int? parentIndex}) {
    return ReportedCommentState(
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

  ReportedCommentState synced() {
    return ReportedCommentState(
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

  ReportedCommentState unSetEdit() {
    return ReportedCommentState(
      data: data,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      isFirstLoad: isFirstLoad,
      commentCount: commentCount,
    );
  }

  ReportedCommentState unsetReplying() {
    return ReportedCommentState(
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
    return ReportedCommentState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      commentCount: commentCount,
    );
  }

  ReportedCommentState copyWith({
    List<CommentResponse>? data,
    int? commentCount,
  }) {
    return ReportedCommentState(
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
