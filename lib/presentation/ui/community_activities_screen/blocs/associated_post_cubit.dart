import '../../../../application/services/common/common.dart';
import '../../../../application/services/common/response/response.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

part 'associated_post_state.dart';

class AssociatedPostCubit
    extends InfiniteLoaderCubit<AssociatedPostState, PostResponse> {
  AssociatedPostCubit({
    required this.postType,
    required super.failureHandlerManager,
    required this.userController,
  }) : super(initialState: const AssociatedPostState());

  final AssociatedPostType postType;
  final UserController userController;

  @override
  Future<Result<Failure, PageableData<PostResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    Result<Failure, PagingResponse<PostResponse>> result;

    switch (postType) {
      case AssociatedPostType.communityLiked:
        result = await userController.getMyLikedCommunityPosts(
          size: pageSize,
          page: page,
        );
        break;
      case AssociatedPostType.communityCommented:
        result = await userController.getMyCommunityPostWithComment(
          size: pageSize,
          page: page,
        );
        break;
      case AssociatedPostType.communityWritten:
        result = await userController.getMyCommunityPosts(
          size: pageSize,
          page: page,
        );
        break;
      case AssociatedPostType.curatorLiked:
        result = await userController.getMyLikedCuratorPosts(
          size: pageSize,
          page: page,
        );
        break;
      case AssociatedPostType.curatorCommented:
        result = await userController.getMyCuratorPostWithComment(
          size: pageSize,
          page: page,
        );
        break;
    }
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        return PageableData(
          totalItems: value.totalElements ?? 0,
          totalPages: totalPages,
          data: data,
        );
      },
    );
  }
}
