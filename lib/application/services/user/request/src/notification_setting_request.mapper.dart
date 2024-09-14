// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_setting_request.dart';

class NotificationSettingRequestMapper
    extends ClassMapperBase<NotificationSettingRequest> {
  NotificationSettingRequestMapper._();

  static NotificationSettingRequestMapper? _instance;
  static NotificationSettingRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = NotificationSettingRequestMapper._());
      NotificationTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationSettingRequest';

  static List<NotificationType>? _$notificationTypes(
          NotificationSettingRequest v) =>
      v.notificationTypes;
  static const Field<NotificationSettingRequest, List<NotificationType>>
      _f$notificationTypes = Field('notificationTypes', _$notificationTypes);

  @override
  final MappableFields<NotificationSettingRequest> fields = const {
    #notificationTypes: _f$notificationTypes,
  };

  static NotificationSettingRequest _instantiate(DecodingData data) {
    return NotificationSettingRequest(
        notificationTypes: data.dec(_f$notificationTypes));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationSettingRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationSettingRequest>(map);
  }

  static NotificationSettingRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationSettingRequest>(json);
  }
}

mixin NotificationSettingRequestMappable {
  String toJsonString() {
    return NotificationSettingRequestMapper.ensureInitialized()
        .encodeJson<NotificationSettingRequest>(
            this as NotificationSettingRequest);
  }

  Map<String, dynamic> toJson() {
    return NotificationSettingRequestMapper.ensureInitialized()
        .encodeMap<NotificationSettingRequest>(
            this as NotificationSettingRequest);
  }

  NotificationSettingRequestCopyWith<NotificationSettingRequest,
          NotificationSettingRequest, NotificationSettingRequest>
      get copyWith => _NotificationSettingRequestCopyWithImpl(
          this as NotificationSettingRequest, $identity, $identity);
  @override
  String toString() {
    return NotificationSettingRequestMapper.ensureInitialized()
        .stringifyValue(this as NotificationSettingRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NotificationSettingRequestMapper.ensureInitialized()
                .isValueEqual(this as NotificationSettingRequest, other));
  }

  @override
  int get hashCode {
    return NotificationSettingRequestMapper.ensureInitialized()
        .hashValue(this as NotificationSettingRequest);
  }
}

extension NotificationSettingRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationSettingRequest, $Out> {
  NotificationSettingRequestCopyWith<$R, NotificationSettingRequest, $Out>
      get $asNotificationSettingRequest => $base
          .as((v, t, t2) => _NotificationSettingRequestCopyWithImpl(v, t, t2));
}

abstract class NotificationSettingRequestCopyWith<
    $R,
    $In extends NotificationSettingRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NotificationType,
          ObjectCopyWith<$R, NotificationType, NotificationType>>?
      get notificationTypes;
  $R call({List<NotificationType>? notificationTypes});
  NotificationSettingRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationSettingRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationSettingRequest, $Out>
    implements
        NotificationSettingRequestCopyWith<$R, NotificationSettingRequest,
            $Out> {
  _NotificationSettingRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationSettingRequest> $mapper =
      NotificationSettingRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, NotificationType,
          ObjectCopyWith<$R, NotificationType, NotificationType>>?
      get notificationTypes => $value.notificationTypes != null
          ? ListCopyWith(
              $value.notificationTypes!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(notificationTypes: v))
          : null;
  @override
  $R call({Object? notificationTypes = $none}) => $apply(FieldCopyWithData(
      {if (notificationTypes != $none) #notificationTypes: notificationTypes}));
  @override
  NotificationSettingRequest $make(
          CopyWithData data) =>
      NotificationSettingRequest(
          notificationTypes:
              data.get(#notificationTypes, or: $value.notificationTypes));

  @override
  NotificationSettingRequestCopyWith<$R2, NotificationSettingRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NotificationSettingRequestCopyWithImpl($value, $cast, t);
}
