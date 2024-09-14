// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'change_password_request.dart';

class ChangePasswordRequestMapper
    extends ClassMapperBase<ChangePasswordRequest> {
  ChangePasswordRequestMapper._();

  static ChangePasswordRequestMapper? _instance;
  static ChangePasswordRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangePasswordRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChangePasswordRequest';

  static String _$sessionToken(ChangePasswordRequest v) => v.sessionToken;
  static const Field<ChangePasswordRequest, String> _f$sessionToken =
      Field('sessionToken', _$sessionToken);
  static String _$username(ChangePasswordRequest v) => v.username;
  static const Field<ChangePasswordRequest, String> _f$username =
      Field('username', _$username);
  static String _$newPassword(ChangePasswordRequest v) => v.newPassword;
  static const Field<ChangePasswordRequest, String> _f$newPassword =
      Field('newPassword', _$newPassword);

  @override
  final MappableFields<ChangePasswordRequest> fields = const {
    #sessionToken: _f$sessionToken,
    #username: _f$username,
    #newPassword: _f$newPassword,
  };

  static ChangePasswordRequest _instantiate(DecodingData data) {
    return ChangePasswordRequest(
        sessionToken: data.dec(_f$sessionToken),
        username: data.dec(_f$username),
        newPassword: data.dec(_f$newPassword));
  }

  @override
  final Function instantiate = _instantiate;

  static ChangePasswordRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangePasswordRequest>(map);
  }

  static ChangePasswordRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChangePasswordRequest>(json);
  }
}

mixin ChangePasswordRequestMappable {
  String toJsonString() {
    return ChangePasswordRequestMapper.ensureInitialized()
        .encodeJson<ChangePasswordRequest>(this as ChangePasswordRequest);
  }

  Map<String, dynamic> toJson() {
    return ChangePasswordRequestMapper.ensureInitialized()
        .encodeMap<ChangePasswordRequest>(this as ChangePasswordRequest);
  }

  ChangePasswordRequestCopyWith<ChangePasswordRequest, ChangePasswordRequest,
          ChangePasswordRequest>
      get copyWith => _ChangePasswordRequestCopyWithImpl(
          this as ChangePasswordRequest, $identity, $identity);
  @override
  String toString() {
    return ChangePasswordRequestMapper.ensureInitialized()
        .stringifyValue(this as ChangePasswordRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ChangePasswordRequestMapper.ensureInitialized()
                .isValueEqual(this as ChangePasswordRequest, other));
  }

  @override
  int get hashCode {
    return ChangePasswordRequestMapper.ensureInitialized()
        .hashValue(this as ChangePasswordRequest);
  }
}

extension ChangePasswordRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangePasswordRequest, $Out> {
  ChangePasswordRequestCopyWith<$R, ChangePasswordRequest, $Out>
      get $asChangePasswordRequest =>
          $base.as((v, t, t2) => _ChangePasswordRequestCopyWithImpl(v, t, t2));
}

abstract class ChangePasswordRequestCopyWith<
    $R,
    $In extends ChangePasswordRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? sessionToken, String? username, String? newPassword});
  ChangePasswordRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChangePasswordRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangePasswordRequest, $Out>
    implements ChangePasswordRequestCopyWith<$R, ChangePasswordRequest, $Out> {
  _ChangePasswordRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangePasswordRequest> $mapper =
      ChangePasswordRequestMapper.ensureInitialized();
  @override
  $R call({String? sessionToken, String? username, String? newPassword}) =>
      $apply(FieldCopyWithData({
        if (sessionToken != null) #sessionToken: sessionToken,
        if (username != null) #username: username,
        if (newPassword != null) #newPassword: newPassword
      }));
  @override
  ChangePasswordRequest $make(CopyWithData data) => ChangePasswordRequest(
      sessionToken: data.get(#sessionToken, or: $value.sessionToken),
      username: data.get(#username, or: $value.username),
      newPassword: data.get(#newPassword, or: $value.newPassword));

  @override
  ChangePasswordRequestCopyWith<$R2, ChangePasswordRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChangePasswordRequestCopyWithImpl($value, $cast, t);
}
