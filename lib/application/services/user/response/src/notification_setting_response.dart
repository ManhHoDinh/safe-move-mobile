import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/src/notification_type.dart';

part 'notification_setting_response.mapper.dart';

@MappableClass()
class NotificationSettingResponse with NotificationSettingResponseMappable {
  const NotificationSettingResponse({
    this.notificationTypes,
  });

  factory NotificationSettingResponse.fromJson(Map<String, dynamic> json) =>
      NotificationSettingResponseMapper.fromJson(json);

  final List<NotificationType>? notificationTypes;
}
