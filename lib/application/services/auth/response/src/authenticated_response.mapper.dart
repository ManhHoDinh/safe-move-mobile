// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'authenticated_response.dart';

class AuthenticatedResponseMapper
    extends ClassMapperBase<AuthenticatedResponse> {
  AuthenticatedResponseMapper._();

  static AuthenticatedResponseMapper? _instance;
  static AuthenticatedResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthenticatedResponseMapper._());
      JwtResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthenticatedResponse';

  static JwtResponse? _$tokenInfo(AuthenticatedResponse v) => v.tokenInfo;
  static const Field<AuthenticatedResponse, JwtResponse> _f$tokenInfo =
      Field('tokenInfo', _$tokenInfo, opt: true);
  static int? _$userId(AuthenticatedResponse v) => v.userId;
  static const Field<AuthenticatedResponse, int> _f$userId =
      Field('userId', _$userId, opt: true);

  @override
  final MappableFields<AuthenticatedResponse> fields = const {
    #tokenInfo: _f$tokenInfo,
    #userId: _f$userId,
  };

  static AuthenticatedResponse _instantiate(DecodingData data) {
    return AuthenticatedResponse(
        tokenInfo: data.dec(_f$tokenInfo), userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthenticatedResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthenticatedResponse>(map);
  }

  static AuthenticatedResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<AuthenticatedResponse>(json);
  }
}

mixin AuthenticatedResponseMappable {
  String toJsonString() {
    return AuthenticatedResponseMapper.ensureInitialized()
        .encodeJson<AuthenticatedResponse>(this as AuthenticatedResponse);
  }

  Map<String, dynamic> toJson() {
    return AuthenticatedResponseMapper.ensureInitialized()
        .encodeMap<AuthenticatedResponse>(this as AuthenticatedResponse);
  }

  AuthenticatedResponseCopyWith<AuthenticatedResponse, AuthenticatedResponse,
          AuthenticatedResponse>
      get copyWith => _AuthenticatedResponseCopyWithImpl(
          this as AuthenticatedResponse, $identity, $identity);
  @override
  String toString() {
    return AuthenticatedResponseMapper.ensureInitialized()
        .stringifyValue(this as AuthenticatedResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AuthenticatedResponseMapper.ensureInitialized()
                .isValueEqual(this as AuthenticatedResponse, other));
  }

  @override
  int get hashCode {
    return AuthenticatedResponseMapper.ensureInitialized()
        .hashValue(this as AuthenticatedResponse);
  }
}

extension AuthenticatedResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthenticatedResponse, $Out> {
  AuthenticatedResponseCopyWith<$R, AuthenticatedResponse, $Out>
      get $asAuthenticatedResponse =>
          $base.as((v, t, t2) => _AuthenticatedResponseCopyWithImpl(v, t, t2));
}

abstract class AuthenticatedResponseCopyWith<
    $R,
    $In extends AuthenticatedResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  JwtResponseCopyWith<$R, JwtResponse, JwtResponse>? get tokenInfo;
  $R call({JwtResponse? tokenInfo, int? userId});
  AuthenticatedResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AuthenticatedResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthenticatedResponse, $Out>
    implements AuthenticatedResponseCopyWith<$R, AuthenticatedResponse, $Out> {
  _AuthenticatedResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthenticatedResponse> $mapper =
      AuthenticatedResponseMapper.ensureInitialized();
  @override
  JwtResponseCopyWith<$R, JwtResponse, JwtResponse>? get tokenInfo =>
      $value.tokenInfo?.copyWith.$chain((v) => call(tokenInfo: v));
  @override
  $R call({Object? tokenInfo = $none, Object? userId = $none}) =>
      $apply(FieldCopyWithData({
        if (tokenInfo != $none) #tokenInfo: tokenInfo,
        if (userId != $none) #userId: userId
      }));
  @override
  AuthenticatedResponse $make(CopyWithData data) => AuthenticatedResponse(
      tokenInfo: data.get(#tokenInfo, or: $value.tokenInfo),
      userId: data.get(#userId, or: $value.userId));

  @override
  AuthenticatedResponseCopyWith<$R2, AuthenticatedResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AuthenticatedResponseCopyWithImpl($value, $cast, t);
}
