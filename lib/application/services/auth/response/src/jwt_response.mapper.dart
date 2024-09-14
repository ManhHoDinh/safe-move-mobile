// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'jwt_response.dart';

class JwtResponseMapper extends ClassMapperBase<JwtResponse> {
  JwtResponseMapper._();

  static JwtResponseMapper? _instance;
  static JwtResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JwtResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'JwtResponse';

  static DateTime? _$createdAt(JwtResponse v) => v.createdAt;
  static const Field<JwtResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$expiredAt(JwtResponse v) => v.expiredAt;
  static const Field<JwtResponse, DateTime> _f$expiredAt =
      Field('expiredAt', _$expiredAt, opt: true);
  static DateTime? _$refreshCreateAt(JwtResponse v) => v.refreshCreateAt;
  static const Field<JwtResponse, DateTime> _f$refreshCreateAt =
      Field('refreshCreateAt', _$refreshCreateAt, opt: true);
  static DateTime? _$refreshExpiredAt(JwtResponse v) => v.refreshExpiredAt;
  static const Field<JwtResponse, DateTime> _f$refreshExpiredAt =
      Field('refreshExpiredAt', _$refreshExpiredAt, opt: true);
  static String? _$refreshToken(JwtResponse v) => v.refreshToken;
  static const Field<JwtResponse, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken, opt: true);
  static String? _$token(JwtResponse v) => v.token;
  static const Field<JwtResponse, String> _f$token =
      Field('token', _$token, opt: true);
  static int? _$userId(JwtResponse v) => v.userId;
  static const Field<JwtResponse, int> _f$userId =
      Field('userId', _$userId, opt: true);

  @override
  final MappableFields<JwtResponse> fields = const {
    #createdAt: _f$createdAt,
    #expiredAt: _f$expiredAt,
    #refreshCreateAt: _f$refreshCreateAt,
    #refreshExpiredAt: _f$refreshExpiredAt,
    #refreshToken: _f$refreshToken,
    #token: _f$token,
    #userId: _f$userId,
  };

  static JwtResponse _instantiate(DecodingData data) {
    return JwtResponse(
        createdAt: data.dec(_f$createdAt),
        expiredAt: data.dec(_f$expiredAt),
        refreshCreateAt: data.dec(_f$refreshCreateAt),
        refreshExpiredAt: data.dec(_f$refreshExpiredAt),
        refreshToken: data.dec(_f$refreshToken),
        token: data.dec(_f$token),
        userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static JwtResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JwtResponse>(map);
  }

  static JwtResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<JwtResponse>(json);
  }
}

mixin JwtResponseMappable {
  String toJsonString() {
    return JwtResponseMapper.ensureInitialized()
        .encodeJson<JwtResponse>(this as JwtResponse);
  }

  Map<String, dynamic> toJson() {
    return JwtResponseMapper.ensureInitialized()
        .encodeMap<JwtResponse>(this as JwtResponse);
  }

  JwtResponseCopyWith<JwtResponse, JwtResponse, JwtResponse> get copyWith =>
      _JwtResponseCopyWithImpl(this as JwtResponse, $identity, $identity);
  @override
  String toString() {
    return JwtResponseMapper.ensureInitialized()
        .stringifyValue(this as JwtResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            JwtResponseMapper.ensureInitialized()
                .isValueEqual(this as JwtResponse, other));
  }

  @override
  int get hashCode {
    return JwtResponseMapper.ensureInitialized().hashValue(this as JwtResponse);
  }
}

extension JwtResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JwtResponse, $Out> {
  JwtResponseCopyWith<$R, JwtResponse, $Out> get $asJwtResponse =>
      $base.as((v, t, t2) => _JwtResponseCopyWithImpl(v, t, t2));
}

abstract class JwtResponseCopyWith<$R, $In extends JwtResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {DateTime? createdAt,
      DateTime? expiredAt,
      DateTime? refreshCreateAt,
      DateTime? refreshExpiredAt,
      String? refreshToken,
      String? token,
      int? userId});
  JwtResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JwtResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JwtResponse, $Out>
    implements JwtResponseCopyWith<$R, JwtResponse, $Out> {
  _JwtResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JwtResponse> $mapper =
      JwtResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? createdAt = $none,
          Object? expiredAt = $none,
          Object? refreshCreateAt = $none,
          Object? refreshExpiredAt = $none,
          Object? refreshToken = $none,
          Object? token = $none,
          Object? userId = $none}) =>
      $apply(FieldCopyWithData({
        if (createdAt != $none) #createdAt: createdAt,
        if (expiredAt != $none) #expiredAt: expiredAt,
        if (refreshCreateAt != $none) #refreshCreateAt: refreshCreateAt,
        if (refreshExpiredAt != $none) #refreshExpiredAt: refreshExpiredAt,
        if (refreshToken != $none) #refreshToken: refreshToken,
        if (token != $none) #token: token,
        if (userId != $none) #userId: userId
      }));
  @override
  JwtResponse $make(CopyWithData data) => JwtResponse(
      createdAt: data.get(#createdAt, or: $value.createdAt),
      expiredAt: data.get(#expiredAt, or: $value.expiredAt),
      refreshCreateAt: data.get(#refreshCreateAt, or: $value.refreshCreateAt),
      refreshExpiredAt:
          data.get(#refreshExpiredAt, or: $value.refreshExpiredAt),
      refreshToken: data.get(#refreshToken, or: $value.refreshToken),
      token: data.get(#token, or: $value.token),
      userId: data.get(#userId, or: $value.userId));

  @override
  JwtResponseCopyWith<$R2, JwtResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _JwtResponseCopyWithImpl($value, $cast, t);
}
