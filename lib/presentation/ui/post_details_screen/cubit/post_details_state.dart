part of 'post_detail_cubit.dart';

class PostsDetailsState {
  const PostsDetailsState({
    this.apiStatus = ApiStatus.initial,
    this.postResponse,
    this.isReacted = false,
    this.reactionCount = 0,
    this.postDeleted = false,
  });

  final ApiStatus apiStatus;
  final PostResponse? postResponse;
  final bool isReacted;
  final int reactionCount;
  final bool postDeleted;

  PostsDetailsState copyWith({
    ApiStatus? apiStatus,
    PostResponse? postResponse,
    bool? isReacted,
    int? reactionCount,
    bool? postDeleted,
  }) {
    return PostsDetailsState(
      apiStatus: apiStatus ?? this.apiStatus,
      postResponse: postResponse ?? this.postResponse,
      isReacted: isReacted ?? this.isReacted,
      reactionCount: reactionCount ?? this.reactionCount,
      postDeleted: postDeleted ?? this.postDeleted,
    );
  }
}
