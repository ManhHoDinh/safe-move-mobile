part of 'associated_post_by_user_id_cubit.dart';

class AssociatedPostStateByUserIdState
    extends InfiniteLoaderState<PostResponse> {
  const AssociatedPostStateByUserIdState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    required this.postType,
    required this.postActivityType,
  });

  final PostType postType;
  final PostActivityType postActivityType;

  AssociatedPostStateByUserIdState copyWith({
    PostActivityType? postActivityType,
    PostType? postType,
  }) {
    return AssociatedPostStateByUserIdState(
      data: data,
      isFirstLoad: isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      postType: postType ?? this.postType,
      postActivityType: postActivityType ?? this.postActivityType,
    );
  }

  @override
  InfiniteLoaderState<PostResponse> loadingManagementStateChanged({
    List<PostResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return AssociatedPostStateByUserIdState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      postType: postType,
      postActivityType: postActivityType,
    );
  }
}
