import '../../../../application/services/common/response/src/paging_response.dart';
import '../../../../application/services/user/user.dart';
import '../../../../application/services/user_follow/user_follow.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'follow_state.dart';

class FollowCubit extends InfiniteLoaderCubit<FollowState, UserDTO> {
  FollowCubit({
    required super.failureHandlerManager,
    required this.userController,
    required this.followController,
    required this.loadingManager,
    required super.initialState,
  });

  final UserController userController;
  final UserFollowController followController;
  final LoadingManager loadingManager;

  void unfollow(int userId, int index) async {
    final response = await loadingManager.startLoading(
        future: followController.unfollowUser(followerUserId: userId));

    response.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    response.handleRight((value) {
      final currentData = List<UserDTO>.from(state.data);
      currentData.removeAt(index);
      emit(state.copyWith(
          data: currentData, currentItemCount: state.currentItemCount - 1));
    });
  }

  @override
  Future<Result<Failure, PageableData<UserDTO>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    Result<Failure, PagingResponse<UserDTO>> followResponse;
    if (state.followType == FollowType.following) {
      followResponse = await userController.getMyFollowings(
        size: pageSize,
        page: page,
      );
    } else {
      followResponse = await userController.getMyFollowers(
        size: pageSize,
        page: page,
      );
    }
    return followResponse.mapResult(
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
