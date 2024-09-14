import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/src/notification_type.dart';

part 'notification_setting_request.mapper.dart';

@MappableClass()
class NotificationSettingRequest with NotificationSettingRequestMappable {
  const NotificationSettingRequest({
    required this.notificationTypes,
  });

  factory NotificationSettingRequest.fromJson(Map<String, dynamic> json) =>
      NotificationSettingRequestMapper.fromJson(json);

  final List<NotificationType>? notificationTypes;
}
