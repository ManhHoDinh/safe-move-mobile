// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_with_naver_request.dart';

class LoginWithNaverRequestMapper
    extends ClassMapperBase<LoginWithNaverRequest> {
  LoginWithNaverRequestMapper._();

  static LoginWithNaverRequestMapper? _instance;
  static LoginWithNaverRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginWithNaverRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginWithNaverRequest';

  static String _$accessToken(LoginWithNaverRequest v) => v.accessToken;
  static const Field<LoginWithNaverRequest, String> _f$accessToken =
      Field('accessToken', _$accessToken);

  @override
  final MappableFields<LoginWithNaverRequest> fields = const {
    #accessToken: _f$accessToken,
  };

  static LoginWithNaverRequest _instantiate(DecodingData data) {
    return LoginWithNaverRequest(accessToken: data.dec(_f$accessToken));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginWithNaverRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginWithNaverRequest>(map);
  }

  static LoginWithNaverRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<LoginWithNaverRequest>(json);
  }
}

mixin LoginWithNaverRequestMappable {
  String toJsonString() {
    return LoginWithNaverRequestMapper.ensureInitialized()
        .encodeJson<LoginWithNaverRequest>(this as LoginWithNaverRequest);
  }

  Map<String, dynamic> toJson() {
    return LoginWithNaverRequestMapper.ensureInitialized()
        .encodeMap<LoginWithNaverRequest>(this as LoginWithNaverRequest);
  }

  LoginWithNaverRequestCopyWith<LoginWithNaverRequest, LoginWithNaverRequest,
          LoginWithNaverRequest>
      get copyWith => _LoginWithNaverRequestCopyWithImpl(
          this as LoginWithNaverRequest, $identity, $identity);
  @override
  String toString() {
    return LoginWithNaverRequestMapper.ensureInitialized()
        .stringifyValue(this as LoginWithNaverRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginWithNaverRequestMapper.ensureInitialized()
                .isValueEqual(this as LoginWithNaverRequest, other));
  }

  @override
  int get hashCode {
    return LoginWithNaverRequestMapper.ensureInitialized()
        .hashValue(this as LoginWithNaverRequest);
  }
}

extension LoginWithNaverRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginWithNaverRequest, $Out> {
  LoginWithNaverRequestCopyWith<$R, LoginWithNaverRequest, $Out>
      get $asLoginWithNaverRequest =>
          $base.as((v, t, t2) => _LoginWithNaverRequestCopyWithImpl(v, t, t2));
}

abstract class LoginWithNaverRequestCopyWith<
    $R,
    $In extends LoginWithNaverRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken});
  LoginWithNaverRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoginWithNaverRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginWithNaverRequest, $Out>
    implements LoginWithNaverRequestCopyWith<$R, LoginWithNaverRequest, $Out> {
  _LoginWithNaverRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginWithNaverRequest> $mapper =
      LoginWithNaverRequestMapper.ensureInitialized();
  @override
  $R call({String? accessToken}) => $apply(
      FieldCopyWithData({if (accessToken != null) #accessToken: accessToken}));
  @override
  LoginWithNaverRequest $make(CopyWithData data) => LoginWithNaverRequest(
      accessToken: data.get(#accessToken, or: $value.accessToken));

  @override
  LoginWithNaverRequestCopyWith<$R2, LoginWithNaverRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LoginWithNaverRequestCopyWithImpl($value, $cast, t);
}
