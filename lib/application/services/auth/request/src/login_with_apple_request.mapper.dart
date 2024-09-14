// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_with_apple_request.dart';

class LoginWithAppleRequestMapper
    extends ClassMapperBase<LoginWithAppleRequest> {
  LoginWithAppleRequestMapper._();

  static LoginWithAppleRequestMapper? _instance;
  static LoginWithAppleRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginWithAppleRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginWithAppleRequest';

  static String _$idToken(LoginWithAppleRequest v) => v.idToken;
  static const Field<LoginWithAppleRequest, String> _f$idToken =
      Field('idToken', _$idToken);

  @override
  final MappableFields<LoginWithAppleRequest> fields = const {
    #idToken: _f$idToken,
  };

  static LoginWithAppleRequest _instantiate(DecodingData data) {
    return LoginWithAppleRequest(idToken: data.dec(_f$idToken));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginWithAppleRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginWithAppleRequest>(map);
  }

  static LoginWithAppleRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<LoginWithAppleRequest>(json);
  }
}

mixin LoginWithAppleRequestMappable {
  String toJsonString() {
    return LoginWithAppleRequestMapper.ensureInitialized()
        .encodeJson<LoginWithAppleRequest>(this as LoginWithAppleRequest);
  }

  Map<String, dynamic> toJson() {
    return LoginWithAppleRequestMapper.ensureInitialized()
        .encodeMap<LoginWithAppleRequest>(this as LoginWithAppleRequest);
  }

  LoginWithAppleRequestCopyWith<LoginWithAppleRequest, LoginWithAppleRequest,
          LoginWithAppleRequest>
      get copyWith => _LoginWithAppleRequestCopyWithImpl(
          this as LoginWithAppleRequest, $identity, $identity);
  @override
  String toString() {
    return LoginWithAppleRequestMapper.ensureInitialized()
        .stringifyValue(this as LoginWithAppleRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginWithAppleRequestMapper.ensureInitialized()
                .isValueEqual(this as LoginWithAppleRequest, other));
  }

  @override
  int get hashCode {
    return LoginWithAppleRequestMapper.ensureInitialized()
        .hashValue(this as LoginWithAppleRequest);
  }
}

extension LoginWithAppleRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginWithAppleRequest, $Out> {
  LoginWithAppleRequestCopyWith<$R, LoginWithAppleRequest, $Out>
      get $asLoginWithAppleRequest =>
          $base.as((v, t, t2) => _LoginWithAppleRequestCopyWithImpl(v, t, t2));
}

abstract class LoginWithAppleRequestCopyWith<
    $R,
    $In extends LoginWithAppleRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? idToken});
  LoginWithAppleRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoginWithAppleRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginWithAppleRequest, $Out>
    implements LoginWithAppleRequestCopyWith<$R, LoginWithAppleRequest, $Out> {
  _LoginWithAppleRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginWithAppleRequest> $mapper =
      LoginWithAppleRequestMapper.ensureInitialized();
  @override
  $R call({String? idToken}) =>
      $apply(FieldCopyWithData({if (idToken != null) #idToken: idToken}));
  @override
  LoginWithAppleRequest $make(CopyWithData data) =>
      LoginWithAppleRequest(idToken: data.get(#idToken, or: $value.idToken));

  @override
  LoginWithAppleRequestCopyWith<$R2, LoginWithAppleRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LoginWithAppleRequestCopyWithImpl($value, $cast, t);
}
