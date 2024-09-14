import 'package:dart_mappable/dart_mappable.dart';

part 'read_notification_request.mapper.dart';

@MappableClass()
class ReadNotificationRequest with ReadNotificationRequestMappable {
  const ReadNotificationRequest({
    required this.isRead,
  });

  factory ReadNotificationRequest.fromJson(Map<String, dynamic> json) =>
      ReadNotificationRequestMapper.fromJson(json);

  final bool isRead;
}
