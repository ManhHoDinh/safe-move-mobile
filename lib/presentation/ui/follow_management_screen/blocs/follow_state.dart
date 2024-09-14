import '../../../../application/services/user/dto/dto.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

enum FollowType {
  following,
  follower,
}

class FollowState extends InfiniteLoaderState<UserDTO> {
  const FollowState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    required this.followType,
    this.currentItemCount = 0,
  });

  final FollowType followType;
  final int currentItemCount;

  @override
  InfiniteLoaderState<UserDTO> loadingManagementStateChanged({
    List<UserDTO>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return FollowState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      followType: followType,
      currentItemCount: totalItems ?? currentItemCount,
    );
  }

  FollowState copyWith({
    List<UserDTO>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
    FollowType? followType,
    int? currentItemCount,
  }) {
    return FollowState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      followType: followType ?? this.followType,
      currentItemCount: currentItemCount ?? this.currentItemCount,
    );
  }
}
