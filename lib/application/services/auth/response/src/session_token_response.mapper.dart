// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'session_token_response.dart';

class SessionTokenResponseMapper extends ClassMapperBase<SessionTokenResponse> {
  SessionTokenResponseMapper._();

  static SessionTokenResponseMapper? _instance;
  static SessionTokenResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionTokenResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SessionTokenResponse';

  static String? _$token(SessionTokenResponse v) => v.token;
  static const Field<SessionTokenResponse, String> _f$token =
      Field('token', _$token, opt: true);
  static String? _$createdAt(SessionTokenResponse v) => v.createdAt;
  static const Field<SessionTokenResponse, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$expiredAt(SessionTokenResponse v) => v.expiredAt;
  static const Field<SessionTokenResponse, String> _f$expiredAt =
      Field('expiredAt', _$expiredAt, opt: true);

  @override
  final MappableFields<SessionTokenResponse> fields = const {
    #token: _f$token,
    #createdAt: _f$createdAt,
    #expiredAt: _f$expiredAt,
  };

  static SessionTokenResponse _instantiate(DecodingData data) {
    return SessionTokenResponse(
        token: data.dec(_f$token),
        createdAt: data.dec(_f$createdAt),
        expiredAt: data.dec(_f$expiredAt));
  }

  @override
  final Function instantiate = _instantiate;

  static SessionTokenResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SessionTokenResponse>(map);
  }

  static SessionTokenResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<SessionTokenResponse>(json);
  }
}

mixin SessionTokenResponseMappable {
  String toJsonString() {
    return SessionTokenResponseMapper.ensureInitialized()
        .encodeJson<SessionTokenResponse>(this as SessionTokenResponse);
  }

  Map<String, dynamic> toJson() {
    return SessionTokenResponseMapper.ensureInitialized()
        .encodeMap<SessionTokenResponse>(this as SessionTokenResponse);
  }

  SessionTokenResponseCopyWith<SessionTokenResponse, SessionTokenResponse,
          SessionTokenResponse>
      get copyWith => _SessionTokenResponseCopyWithImpl(
          this as SessionTokenResponse, $identity, $identity);
  @override
  String toString() {
    return SessionTokenResponseMapper.ensureInitialized()
        .stringifyValue(this as SessionTokenResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SessionTokenResponseMapper.ensureInitialized()
                .isValueEqual(this as SessionTokenResponse, other));
  }

  @override
  int get hashCode {
    return SessionTokenResponseMapper.ensureInitialized()
        .hashValue(this as SessionTokenResponse);
  }
}

extension SessionTokenResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SessionTokenResponse, $Out> {
  SessionTokenResponseCopyWith<$R, SessionTokenResponse, $Out>
      get $asSessionTokenResponse =>
          $base.as((v, t, t2) => _SessionTokenResponseCopyWithImpl(v, t, t2));
}

abstract class SessionTokenResponseCopyWith<
    $R,
    $In extends SessionTokenResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? token, String? createdAt, String? expiredAt});
  SessionTokenResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SessionTokenResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SessionTokenResponse, $Out>
    implements SessionTokenResponseCopyWith<$R, SessionTokenResponse, $Out> {
  _SessionTokenResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SessionTokenResponse> $mapper =
      SessionTokenResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? token = $none,
          Object? createdAt = $none,
          Object? expiredAt = $none}) =>
      $apply(FieldCopyWithData({
        if (token != $none) #token: token,
        if (createdAt != $none) #createdAt: createdAt,
        if (expiredAt != $none) #expiredAt: expiredAt
      }));
  @override
  SessionTokenResponse $make(CopyWithData data) => SessionTokenResponse(
      token: data.get(#token, or: $value.token),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      expiredAt: data.get(#expiredAt, or: $value.expiredAt));

  @override
  SessionTokenResponseCopyWith<$R2, SessionTokenResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SessionTokenResponseCopyWithImpl($value, $cast, t);
}
