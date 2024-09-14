// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'read_notification_request.dart';

class ReadNotificationRequestMapper
    extends ClassMapperBase<ReadNotificationRequest> {
  ReadNotificationRequestMapper._();

  static ReadNotificationRequestMapper? _instance;
  static ReadNotificationRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReadNotificationRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReadNotificationRequest';

  static bool _$isRead(ReadNotificationRequest v) => v.isRead;
  static const Field<ReadNotificationRequest, bool> _f$isRead =
      Field('isRead', _$isRead);

  @override
  final MappableFields<ReadNotificationRequest> fields = const {
    #isRead: _f$isRead,
  };

  static ReadNotificationRequest _instantiate(DecodingData data) {
    return ReadNotificationRequest(isRead: data.dec(_f$isRead));
  }

  @override
  final Function instantiate = _instantiate;

  static ReadNotificationRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReadNotificationRequest>(map);
  }

  static ReadNotificationRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ReadNotificationRequest>(json);
  }
}

mixin ReadNotificationRequestMappable {
  String toJsonString() {
    return ReadNotificationRequestMapper.ensureInitialized()
        .encodeJson<ReadNotificationRequest>(this as ReadNotificationRequest);
  }

  Map<String, dynamic> toJson() {
    return ReadNotificationRequestMapper.ensureInitialized()
        .encodeMap<ReadNotificationRequest>(this as ReadNotificationRequest);
  }

  ReadNotificationRequestCopyWith<ReadNotificationRequest,
          ReadNotificationRequest, ReadNotificationRequest>
      get copyWith => _ReadNotificationRequestCopyWithImpl(
          this as ReadNotificationRequest, $identity, $identity);
  @override
  String toString() {
    return ReadNotificationRequestMapper.ensureInitialized()
        .stringifyValue(this as ReadNotificationRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReadNotificationRequestMapper.ensureInitialized()
                .isValueEqual(this as ReadNotificationRequest, other));
  }

  @override
  int get hashCode {
    return ReadNotificationRequestMapper.ensureInitialized()
        .hashValue(this as ReadNotificationRequest);
  }
}

extension ReadNotificationRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReadNotificationRequest, $Out> {
  ReadNotificationRequestCopyWith<$R, ReadNotificationRequest, $Out>
      get $asReadNotificationRequest => $base
          .as((v, t, t2) => _ReadNotificationRequestCopyWithImpl(v, t, t2));
}

abstract class ReadNotificationRequestCopyWith<
    $R,
    $In extends ReadNotificationRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isRead});
  ReadNotificationRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReadNotificationRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReadNotificationRequest, $Out>
    implements
        ReadNotificationRequestCopyWith<$R, ReadNotificationRequest, $Out> {
  _ReadNotificationRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReadNotificationRequest> $mapper =
      ReadNotificationRequestMapper.ensureInitialized();
  @override
  $R call({bool? isRead}) =>
      $apply(FieldCopyWithData({if (isRead != null) #isRead: isRead}));
  @override
  ReadNotificationRequest $make(CopyWithData data) =>
      ReadNotificationRequest(isRead: data.get(#isRead, or: $value.isRead));

  @override
  ReadNotificationRequestCopyWith<$R2, ReadNotificationRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReadNotificationRequestCopyWithImpl($value, $cast, t);
}
