// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_type.dart';

class NotificationTypeMapper extends EnumMapper<NotificationType> {
  NotificationTypeMapper._();

  static NotificationTypeMapper? _instance;
  static NotificationTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationTypeMapper._());
    }
    return _instance!;
  }

  static NotificationType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  NotificationType decode(dynamic value) {
    switch (value) {
      case 'COMMENT_MY_POST':
        return NotificationType.commentMyPost;
      case 'REACT_MY_POST':
        return NotificationType.reactMyPost;
      case 'FOLLOWING_UPLOAD_POST':
        return NotificationType.followingUploadPost;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(NotificationType self) {
    switch (self) {
      case NotificationType.commentMyPost:
        return 'COMMENT_MY_POST';
      case NotificationType.reactMyPost:
        return 'REACT_MY_POST';
      case NotificationType.followingUploadPost:
        return 'FOLLOWING_UPLOAD_POST';
    }
  }
}

extension NotificationTypeMapperExtension on NotificationType {
  String toValue() {
    NotificationTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<NotificationType>(this) as String;
  }
}
