import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/dto.dart';

part 'notification_response.mapper.dart';

@MappableClass()
class NotificationResponse with NotificationResponseMappable {
  const NotificationResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.titleKorea,
    this.titleEnglish,
    this.titleChina,
    this.titleJapan,
    this.type,
    this.url,
    this.isRead,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponseMapper.fromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? titleKorea;
  final String? titleEnglish;
  final String? titleChina;
  final String? titleJapan;
  final NotificationType? type;
  final String? url;
  final bool? isRead;
}
