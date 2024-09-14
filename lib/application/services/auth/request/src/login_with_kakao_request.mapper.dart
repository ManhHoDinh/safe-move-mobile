// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_with_kakao_request.dart';

class LoginWithKakaoRequestMapper
    extends ClassMapperBase<LoginWithKakaoRequest> {
  LoginWithKakaoRequestMapper._();

  static LoginWithKakaoRequestMapper? _instance;
  static LoginWithKakaoRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginWithKakaoRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginWithKakaoRequest';

  static String _$accessToken(LoginWithKakaoRequest v) => v.accessToken;
  static const Field<LoginWithKakaoRequest, String> _f$accessToken =
      Field('accessToken', _$accessToken);

  @override
  final MappableFields<LoginWithKakaoRequest> fields = const {
    #accessToken: _f$accessToken,
  };

  static LoginWithKakaoRequest _instantiate(DecodingData data) {
    return LoginWithKakaoRequest(accessToken: data.dec(_f$accessToken));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginWithKakaoRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginWithKakaoRequest>(map);
  }

  static LoginWithKakaoRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<LoginWithKakaoRequest>(json);
  }
}

mixin LoginWithKakaoRequestMappable {
  String toJsonString() {
    return LoginWithKakaoRequestMapper.ensureInitialized()
        .encodeJson<LoginWithKakaoRequest>(this as LoginWithKakaoRequest);
  }

  Map<String, dynamic> toJson() {
    return LoginWithKakaoRequestMapper.ensureInitialized()
        .encodeMap<LoginWithKakaoRequest>(this as LoginWithKakaoRequest);
  }

  LoginWithKakaoRequestCopyWith<LoginWithKakaoRequest, LoginWithKakaoRequest,
          LoginWithKakaoRequest>
      get copyWith => _LoginWithKakaoRequestCopyWithImpl(
          this as LoginWithKakaoRequest, $identity, $identity);
  @override
  String toString() {
    return LoginWithKakaoRequestMapper.ensureInitialized()
        .stringifyValue(this as LoginWithKakaoRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LoginWithKakaoRequestMapper.ensureInitialized()
                .isValueEqual(this as LoginWithKakaoRequest, other));
  }

  @override
  int get hashCode {
    return LoginWithKakaoRequestMapper.ensureInitialized()
        .hashValue(this as LoginWithKakaoRequest);
  }
}

extension LoginWithKakaoRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginWithKakaoRequest, $Out> {
  LoginWithKakaoRequestCopyWith<$R, LoginWithKakaoRequest, $Out>
      get $asLoginWithKakaoRequest =>
          $base.as((v, t, t2) => _LoginWithKakaoRequestCopyWithImpl(v, t, t2));
}

abstract class LoginWithKakaoRequestCopyWith<
    $R,
    $In extends LoginWithKakaoRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken});
  LoginWithKakaoRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoginWithKakaoRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginWithKakaoRequest, $Out>
    implements LoginWithKakaoRequestCopyWith<$R, LoginWithKakaoRequest, $Out> {
  _LoginWithKakaoRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginWithKakaoRequest> $mapper =
      LoginWithKakaoRequestMapper.ensureInitialized();
  @override
  $R call({String? accessToken}) => $apply(
      FieldCopyWithData({if (accessToken != null) #accessToken: accessToken}));
  @override
  LoginWithKakaoRequest $make(CopyWithData data) => LoginWithKakaoRequest(
      accessToken: data.get(#accessToken, or: $value.accessToken));

  @override
  LoginWithKakaoRequestCopyWith<$R2, LoginWithKakaoRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LoginWithKakaoRequestCopyWithImpl($value, $cast, t);
}
