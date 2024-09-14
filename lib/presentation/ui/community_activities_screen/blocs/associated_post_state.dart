part of 'associated_post_cubit.dart';

enum AssociatedPostType {
  communityLiked,
  communityCommented,
  communityWritten,
  curatorLiked,
  curatorCommented,
}

class AssociatedPostState extends InfiniteLoaderState<PostResponse> {
  const AssociatedPostState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
  });

  @override
  InfiniteLoaderState<PostResponse> loadingManagementStateChanged({
    List<PostResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return AssociatedPostState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
    );
  }
}
