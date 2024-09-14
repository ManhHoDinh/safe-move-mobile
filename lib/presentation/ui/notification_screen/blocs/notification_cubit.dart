import '../../../../application/services/common/response/src/paging_response.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'notification_state.dart';

class NotificationCubit
    extends InfiniteLoaderCubit<NotificationState, NotificationResponse> {
  NotificationCubit({
    required super.failureHandlerManager,
    required this.userController,
    required this.loadingManager,
    required super.initialState,
  });

  final UserController userController;
  final LoadingManager loadingManager;

  void readNotification(int notificationId, int index) async {
    final response = await userController.updateStatusNotification(
        notificationId: notificationId,
        request: const ReadNotificationRequest(isRead: true));

    response.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    response.handleRight((value) {
      final currentData = List<NotificationResponse>.from(state.data);
      currentData[index] = currentData[index].copyWith(isRead: true);
      emit(state.copyWith(data: currentData));
    });
  }

  @override
  Future<Result<Failure, PageableData<NotificationResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final Result<Failure, PagingResponse<NotificationResponse>>
        notificationsResponse = await userController.getMyNotifications(
      size: pageSize,
      page: page,
    );

    return notificationsResponse.mapResult(
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
