// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_with_phone_number_request.dart';

class RegisterWithPhoneNumberRequestMapper
    extends ClassMapperBase<RegisterWithPhoneNumberRequest> {
  RegisterWithPhoneNumberRequestMapper._();

  static RegisterWithPhoneNumberRequestMapper? _instance;
  static RegisterWithPhoneNumberRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = RegisterWithPhoneNumberRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterWithPhoneNumberRequest';

  static String _$username(RegisterWithPhoneNumberRequest v) => v.username;
  static const Field<RegisterWithPhoneNumberRequest, String> _f$username =
      Field('username', _$username);
  static String _$password(RegisterWithPhoneNumberRequest v) => v.password;
  static const Field<RegisterWithPhoneNumberRequest, String> _f$password =
      Field('password', _$password);
  static String _$name(RegisterWithPhoneNumberRequest v) => v.name;
  static const Field<RegisterWithPhoneNumberRequest, String> _f$name =
      Field('name', _$name);
  static String _$phoneNumber(RegisterWithPhoneNumberRequest v) =>
      v.phoneNumber;
  static const Field<RegisterWithPhoneNumberRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);
  static String _$sessionToken(RegisterWithPhoneNumberRequest v) =>
      v.sessionToken;
  static const Field<RegisterWithPhoneNumberRequest, String> _f$sessionToken =
      Field('sessionToken', _$sessionToken);
  static String? _$referrerPhoneNumber(RegisterWithPhoneNumberRequest v) =>
      v.referrerPhoneNumber;
  static const Field<RegisterWithPhoneNumberRequest, String>
      _f$referrerPhoneNumber =
      Field('referrerPhoneNumber', _$referrerPhoneNumber, opt: true);

  @override
  final MappableFields<RegisterWithPhoneNumberRequest> fields = const {
    #username: _f$username,
    #password: _f$password,
    #name: _f$name,
    #phoneNumber: _f$phoneNumber,
    #sessionToken: _f$sessionToken,
    #referrerPhoneNumber: _f$referrerPhoneNumber,
  };

  static RegisterWithPhoneNumberRequest _instantiate(DecodingData data) {
    return RegisterWithPhoneNumberRequest(
        username: data.dec(_f$username),
        password: data.dec(_f$password),
        name: data.dec(_f$name),
        phoneNumber: data.dec(_f$phoneNumber),
        sessionToken: data.dec(_f$sessionToken),
        referrerPhoneNumber: data.dec(_f$referrerPhoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterWithPhoneNumberRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterWithPhoneNumberRequest>(map);
  }

  static RegisterWithPhoneNumberRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<RegisterWithPhoneNumberRequest>(json);
  }
}

mixin RegisterWithPhoneNumberRequestMappable {
  String toJsonString() {
    return RegisterWithPhoneNumberRequestMapper.ensureInitialized()
        .encodeJson<RegisterWithPhoneNumberRequest>(
            this as RegisterWithPhoneNumberRequest);
  }

  Map<String, dynamic> toJson() {
    return RegisterWithPhoneNumberRequestMapper.ensureInitialized()
        .encodeMap<RegisterWithPhoneNumberRequest>(
            this as RegisterWithPhoneNumberRequest);
  }

  RegisterWithPhoneNumberRequestCopyWith<RegisterWithPhoneNumberRequest,
          RegisterWithPhoneNumberRequest, RegisterWithPhoneNumberRequest>
      get copyWith => _RegisterWithPhoneNumberRequestCopyWithImpl(
          this as RegisterWithPhoneNumberRequest, $identity, $identity);
  @override
  String toString() {
    return RegisterWithPhoneNumberRequestMapper.ensureInitialized()
        .stringifyValue(this as RegisterWithPhoneNumberRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RegisterWithPhoneNumberRequestMapper.ensureInitialized()
                .isValueEqual(this as RegisterWithPhoneNumberRequest, other));
  }

  @override
  int get hashCode {
    return RegisterWithPhoneNumberRequestMapper.ensureInitialized()
        .hashValue(this as RegisterWithPhoneNumberRequest);
  }
}

extension RegisterWithPhoneNumberRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterWithPhoneNumberRequest, $Out> {
  RegisterWithPhoneNumberRequestCopyWith<$R, RegisterWithPhoneNumberRequest,
          $Out>
      get $asRegisterWithPhoneNumberRequest => $base.as(
          (v, t, t2) => _RegisterWithPhoneNumberRequestCopyWithImpl(v, t, t2));
}

abstract class RegisterWithPhoneNumberRequestCopyWith<
    $R,
    $In extends RegisterWithPhoneNumberRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? username,
      String? password,
      String? name,
      String? phoneNumber,
      String? sessionToken,
      String? referrerPhoneNumber});
  RegisterWithPhoneNumberRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RegisterWithPhoneNumberRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterWithPhoneNumberRequest, $Out>
    implements
        RegisterWithPhoneNumberRequestCopyWith<$R,
            RegisterWithPhoneNumberRequest, $Out> {
  _RegisterWithPhoneNumberRequestCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterWithPhoneNumberRequest> $mapper =
      RegisterWithPhoneNumberRequestMapper.ensureInitialized();
  @override
  $R call(
          {String? username,
          String? password,
          String? name,
          String? phoneNumber,
          String? sessionToken,
          Object? referrerPhoneNumber = $none}) =>
      $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (password != null) #password: password,
        if (name != null) #name: name,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (sessionToken != null) #sessionToken: sessionToken,
        if (referrerPhoneNumber != $none)
          #referrerPhoneNumber: referrerPhoneNumber
      }));
  @override
  RegisterWithPhoneNumberRequest $make(CopyWithData data) =>
      RegisterWithPhoneNumberRequest(
          username: data.get(#username, or: $value.username),
          password: data.get(#password, or: $value.password),
          name: data.get(#name, or: $value.name),
          phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
          sessionToken: data.get(#sessionToken, or: $value.sessionToken),
          referrerPhoneNumber:
              data.get(#referrerPhoneNumber, or: $value.referrerPhoneNumber));

  @override
  RegisterWithPhoneNumberRequestCopyWith<$R2, RegisterWithPhoneNumberRequest,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterWithPhoneNumberRequestCopyWithImpl($value, $cast, t);
}
