// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_setting_response.dart';

class NotificationSettingResponseMapper
    extends ClassMapperBase<NotificationSettingResponse> {
  NotificationSettingResponseMapper._();

  static NotificationSettingResponseMapper? _instance;
  static NotificationSettingResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = NotificationSettingResponseMapper._());
      NotificationTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationSettingResponse';

  static List<NotificationType>? _$notificationTypes(
          NotificationSettingResponse v) =>
      v.notificationTypes;
  static const Field<NotificationSettingResponse, List<NotificationType>>
      _f$notificationTypes =
      Field('notificationTypes', _$notificationTypes, opt: true);

  @override
  final MappableFields<NotificationSettingResponse> fields = const {
    #notificationTypes: _f$notificationTypes,
  };

  static NotificationSettingResponse _instantiate(DecodingData data) {
    return NotificationSettingResponse(
        notificationTypes: data.dec(_f$notificationTypes));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationSettingResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationSettingResponse>(map);
  }

  static NotificationSettingResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationSettingResponse>(json);
  }
}

mixin NotificationSettingResponseMappable {
  String toJsonString() {
    return NotificationSettingResponseMapper.ensureInitialized()
        .encodeJson<NotificationSettingResponse>(
            this as NotificationSettingResponse);
  }

  Map<String, dynamic> toJson() {
    return NotificationSettingResponseMapper.ensureInitialized()
        .encodeMap<NotificationSettingResponse>(
            this as NotificationSettingResponse);
  }

  NotificationSettingResponseCopyWith<NotificationSettingResponse,
          NotificationSettingResponse, NotificationSettingResponse>
      get copyWith => _NotificationSettingResponseCopyWithImpl(
          this as NotificationSettingResponse, $identity, $identity);
  @override
  String toString() {
    return NotificationSettingResponseMapper.ensureInitialized()
        .stringifyValue(this as NotificationSettingResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NotificationSettingResponseMapper.ensureInitialized()
                .isValueEqual(this as NotificationSettingResponse, other));
  }

  @override
  int get hashCode {
    return NotificationSettingResponseMapper.ensureInitialized()
        .hashValue(this as NotificationSettingResponse);
  }
}

extension NotificationSettingResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationSettingResponse, $Out> {
  NotificationSettingResponseCopyWith<$R, NotificationSettingResponse, $Out>
      get $asNotificationSettingResponse => $base
          .as((v, t, t2) => _NotificationSettingResponseCopyWithImpl(v, t, t2));
}

abstract class NotificationSettingResponseCopyWith<
    $R,
    $In extends NotificationSettingResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NotificationType,
          ObjectCopyWith<$R, NotificationType, NotificationType>>?
      get notificationTypes;
  $R call({List<NotificationType>? notificationTypes});
  NotificationSettingResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationSettingResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationSettingResponse, $Out>
    implements
        NotificationSettingResponseCopyWith<$R, NotificationSettingResponse,
            $Out> {
  _NotificationSettingResponseCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationSettingResponse> $mapper =
      NotificationSettingResponseMapper.ensureInitialized();
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
  NotificationSettingResponse $make(CopyWithData data) =>
      NotificationSettingResponse(
          notificationTypes:
              data.get(#notificationTypes, or: $value.notificationTypes));

  @override
  NotificationSettingResponseCopyWith<$R2, NotificationSettingResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NotificationSettingResponseCopyWithImpl($value, $cast, t);
}
