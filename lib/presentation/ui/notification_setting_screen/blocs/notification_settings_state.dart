part of 'notification_settings_cubit.dart';

class NotificationSettingsState {
  const NotificationSettingsState({
    this.apiStatus = ApiStatus.initial,
    this.selected = const {},
  });

  final ApiStatus apiStatus;
  final Set<NotificationType> selected;

  NotificationSettingsState copyWith({
    ApiStatus? apiStatus,
    Set<NotificationType>? selected,
  }) {
    return NotificationSettingsState(
      apiStatus: apiStatus ?? this.apiStatus,
      selected: selected ?? this.selected,
    );
  }
}
