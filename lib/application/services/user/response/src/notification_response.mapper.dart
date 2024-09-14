// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_response.dart';

class NotificationResponseMapper extends ClassMapperBase<NotificationResponse> {
  NotificationResponseMapper._();

  static NotificationResponseMapper? _instance;
  static NotificationResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationResponseMapper._());
      NotificationTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationResponse';

  static int? _$id(NotificationResponse v) => v.id;
  static const Field<NotificationResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static DateTime? _$createdAt(NotificationResponse v) => v.createdAt;
  static const Field<NotificationResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(NotificationResponse v) => v.updatedAt;
  static const Field<NotificationResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static String? _$titleKorea(NotificationResponse v) => v.titleKorea;
  static const Field<NotificationResponse, String> _f$titleKorea =
      Field('titleKorea', _$titleKorea, opt: true);
  static String? _$titleEnglish(NotificationResponse v) => v.titleEnglish;
  static const Field<NotificationResponse, String> _f$titleEnglish =
      Field('titleEnglish', _$titleEnglish, opt: true);
  static String? _$titleChina(NotificationResponse v) => v.titleChina;
  static const Field<NotificationResponse, String> _f$titleChina =
      Field('titleChina', _$titleChina, opt: true);
  static String? _$titleJapan(NotificationResponse v) => v.titleJapan;
  static const Field<NotificationResponse, String> _f$titleJapan =
      Field('titleJapan', _$titleJapan, opt: true);
  static NotificationType? _$type(NotificationResponse v) => v.type;
  static const Field<NotificationResponse, NotificationType> _f$type =
      Field('type', _$type, opt: true);
  static String? _$url(NotificationResponse v) => v.url;
  static const Field<NotificationResponse, String> _f$url =
      Field('url', _$url, opt: true);
  static bool? _$isRead(NotificationResponse v) => v.isRead;
  static const Field<NotificationResponse, bool> _f$isRead =
      Field('isRead', _$isRead, opt: true);

  @override
  final MappableFields<NotificationResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #titleKorea: _f$titleKorea,
    #titleEnglish: _f$titleEnglish,
    #titleChina: _f$titleChina,
    #titleJapan: _f$titleJapan,
    #type: _f$type,
    #url: _f$url,
    #isRead: _f$isRead,
  };

  static NotificationResponse _instantiate(DecodingData data) {
    return NotificationResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        titleKorea: data.dec(_f$titleKorea),
        titleEnglish: data.dec(_f$titleEnglish),
        titleChina: data.dec(_f$titleChina),
        titleJapan: data.dec(_f$titleJapan),
        type: data.dec(_f$type),
        url: data.dec(_f$url),
        isRead: data.dec(_f$isRead));
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationResponse>(map);
  }

  static NotificationResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationResponse>(json);
  }
}

mixin NotificationResponseMappable {
  String toJsonString() {
    return NotificationResponseMapper.ensureInitialized()
        .encodeJson<NotificationResponse>(this as NotificationResponse);
  }

  Map<String, dynamic> toJson() {
    return NotificationResponseMapper.ensureInitialized()
        .encodeMap<NotificationResponse>(this as NotificationResponse);
  }

  NotificationResponseCopyWith<NotificationResponse, NotificationResponse,
          NotificationResponse>
      get copyWith => _NotificationResponseCopyWithImpl(
          this as NotificationResponse, $identity, $identity);
  @override
  String toString() {
    return NotificationResponseMapper.ensureInitialized()
        .stringifyValue(this as NotificationResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NotificationResponseMapper.ensureInitialized()
                .isValueEqual(this as NotificationResponse, other));
  }

  @override
  int get hashCode {
    return NotificationResponseMapper.ensureInitialized()
        .hashValue(this as NotificationResponse);
  }
}

extension NotificationResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationResponse, $Out> {
  NotificationResponseCopyWith<$R, NotificationResponse, $Out>
      get $asNotificationResponse =>
          $base.as((v, t, t2) => _NotificationResponseCopyWithImpl(v, t, t2));
}

abstract class NotificationResponseCopyWith<
    $R,
    $In extends NotificationResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? titleKorea,
      String? titleEnglish,
      String? titleChina,
      String? titleJapan,
      NotificationType? type,
      String? url,
      bool? isRead});
  NotificationResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NotificationResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationResponse, $Out>
    implements NotificationResponseCopyWith<$R, NotificationResponse, $Out> {
  _NotificationResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationResponse> $mapper =
      NotificationResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? titleKorea = $none,
          Object? titleEnglish = $none,
          Object? titleChina = $none,
          Object? titleJapan = $none,
          Object? type = $none,
          Object? url = $none,
          Object? isRead = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (titleKorea != $none) #titleKorea: titleKorea,
        if (titleEnglish != $none) #titleEnglish: titleEnglish,
        if (titleChina != $none) #titleChina: titleChina,
        if (titleJapan != $none) #titleJapan: titleJapan,
        if (type != $none) #type: type,
        if (url != $none) #url: url,
        if (isRead != $none) #isRead: isRead
      }));
  @override
  NotificationResponse $make(CopyWithData data) => NotificationResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      titleKorea: data.get(#titleKorea, or: $value.titleKorea),
      titleEnglish: data.get(#titleEnglish, or: $value.titleEnglish),
      titleChina: data.get(#titleChina, or: $value.titleChina),
      titleJapan: data.get(#titleJapan, or: $value.titleJapan),
      type: data.get(#type, or: $value.type),
      url: data.get(#url, or: $value.url),
      isRead: data.get(#isRead, or: $value.isRead));

  @override
  NotificationResponseCopyWith<$R2, NotificationResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NotificationResponseCopyWithImpl($value, $cast, t);
}
