import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'notification_settings_state.dart';

class NotificationSettingsCubit extends SafeCubit<NotificationSettingsState> {
  NotificationSettingsCubit({
    required this.failureHandlerManager,
    required this.userController,
    required this.loadingManager,
  }) : super(const NotificationSettingsState()) {
    reload();
  }

  final UserController userController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final response = await userController.getMyNotificationSetting();
    response.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    response.handleRight((value) {
      emit(
        state.copyWith(
          apiStatus: ApiStatus.success,
          selected: value.notificationTypes?.toSet(),
        ),
      );
    });
  }

  void toggle(NotificationType notificationType) async {
    final currentSettings = Set<NotificationType>.from(state.selected);
    if (currentSettings.contains(notificationType)) {
      currentSettings.remove(notificationType);
    } else {
      currentSettings.add(notificationType);
    }
    final patchNotificationResult = await loadingManager.startLoading(
        future: userController.upsertNotificationSetting(
      NotificationSettingRequest(notificationTypes: currentSettings.toList()),
    ));
    patchNotificationResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    patchNotificationResult.handleRight((value) {
      emit(state.copyWith(selected: currentSettings));
    });
  }
}
