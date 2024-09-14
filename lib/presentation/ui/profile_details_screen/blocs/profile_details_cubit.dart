import '../../../../application/services/common/common.dart';
import '../../../../application/services/user/user.dart';
import '../../../../application/services/user_follow/controller/controller.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

class ProfileDetailsState {
  const ProfileDetailsState({
    this.apiStatus = ApiStatus.initial,
    this.userDetail,
    this.hasFollow = false,
  });

  final ApiStatus apiStatus;
  final UserDetailDTO? userDetail;
  final bool hasFollow;

  ProfileDetailsState copyWith({
    ApiStatus? apiStatus,
    UserDetailDTO? userDetail,
    bool? hasFollow,
  }) {
    return ProfileDetailsState(
      apiStatus: apiStatus ?? this.apiStatus,
      userDetail: userDetail ?? this.userDetail,
      hasFollow: hasFollow ?? this.hasFollow,
    );
  }
}

class ProfileDetailsCubit extends SafeCubit<ProfileDetailsState> {
  ProfileDetailsCubit({
    required this.userController,
    required this.loadingManager,
    required this.failureHandlerManager,
    required this.userId,
    required this.userFollowController,
  }) : super(const ProfileDetailsState()) {
    reload();
  }

  final UserController userController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final UserFollowController userFollowController;
  final int userId;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final userDetailsResponse =
        await userController.getUserInfoById(userId: userId);
    userDetailsResponse.handleLeft((failure) {
      failureHandlerManager.handle(failure);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    userDetailsResponse.handleRight((value) {
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        hasFollow: value.isFollowing,
        userDetail: value,
      ));
    });
  }

  void followToggle() async {
    final hasFollow = state.hasFollow;
    Result<Failure, SuccessResponse> apiResult;
    if (hasFollow) {
      apiResult = await loadingManager.startLoading(
          future: userFollowController.unfollowUser(
        followerUserId: userId,
      ));
    } else {
      apiResult = await loadingManager.startLoading(
          future: userFollowController.followUser(
        followerUserId: userId,
      ));
    }

    apiResult.handleLeft((failure) {
      failureHandlerManager.handle(failure);
    });
    apiResult.handleRight((value) {
      emit(state.copyWith(hasFollow: !hasFollow));
    });
  }

  void reportUser() async {
    Result<Failure, SuccessResponse> reportUserResult;
    reportUserResult = await loadingManager.startLoading(
        future: userController.reportUser(userId: userId));

    reportUserResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
  }
}
