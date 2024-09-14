import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

class NotificationState extends InfiniteLoaderState<NotificationResponse> {
  const NotificationState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    this.currentItemCount = 0,
  });
  final int currentItemCount;

  @override
  InfiniteLoaderState<NotificationResponse> loadingManagementStateChanged({
    List<NotificationResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return NotificationState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      currentItemCount: totalItems ?? currentItemCount,
    );
  }

  NotificationState copyWith({
    List<NotificationResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
    int? currentItemCount,
  }) {
    return NotificationState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      currentItemCount: currentItemCount ?? this.currentItemCount,
    );
  }
}
