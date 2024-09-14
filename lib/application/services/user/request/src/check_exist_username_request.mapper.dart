// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'check_exist_username_request.dart';

class CheckExistUsernameRequestMapper
    extends ClassMapperBase<CheckExistUsernameRequest> {
  CheckExistUsernameRequestMapper._();

  static CheckExistUsernameRequestMapper? _instance;
  static CheckExistUsernameRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CheckExistUsernameRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CheckExistUsernameRequest';

  static String _$username(CheckExistUsernameRequest v) => v.username;
  static const Field<CheckExistUsernameRequest, String> _f$username =
      Field('username', _$username);

  @override
  final MappableFields<CheckExistUsernameRequest> fields = const {
    #username: _f$username,
  };

  static CheckExistUsernameRequest _instantiate(DecodingData data) {
    return CheckExistUsernameRequest(username: data.dec(_f$username));
  }

  @override
  final Function instantiate = _instantiate;

  static CheckExistUsernameRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CheckExistUsernameRequest>(map);
  }

  static CheckExistUsernameRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CheckExistUsernameRequest>(json);
  }
}

mixin CheckExistUsernameRequestMappable {
  String toJsonString() {
    return CheckExistUsernameRequestMapper.ensureInitialized()
        .encodeJson<CheckExistUsernameRequest>(
            this as CheckExistUsernameRequest);
  }

  Map<String, dynamic> toJson() {
    return CheckExistUsernameRequestMapper.ensureInitialized()
        .encodeMap<CheckExistUsernameRequest>(
            this as CheckExistUsernameRequest);
  }

  CheckExistUsernameRequestCopyWith<CheckExistUsernameRequest,
          CheckExistUsernameRequest, CheckExistUsernameRequest>
      get copyWith => _CheckExistUsernameRequestCopyWithImpl(
          this as CheckExistUsernameRequest, $identity, $identity);
  @override
  String toString() {
    return CheckExistUsernameRequestMapper.ensureInitialized()
        .stringifyValue(this as CheckExistUsernameRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CheckExistUsernameRequestMapper.ensureInitialized()
                .isValueEqual(this as CheckExistUsernameRequest, other));
  }

  @override
  int get hashCode {
    return CheckExistUsernameRequestMapper.ensureInitialized()
        .hashValue(this as CheckExistUsernameRequest);
  }
}

extension CheckExistUsernameRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckExistUsernameRequest, $Out> {
  CheckExistUsernameRequestCopyWith<$R, CheckExistUsernameRequest, $Out>
      get $asCheckExistUsernameRequest => $base
          .as((v, t, t2) => _CheckExistUsernameRequestCopyWithImpl(v, t, t2));
}

abstract class CheckExistUsernameRequestCopyWith<
    $R,
    $In extends CheckExistUsernameRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username});
  CheckExistUsernameRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CheckExistUsernameRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckExistUsernameRequest, $Out>
    implements
        CheckExistUsernameRequestCopyWith<$R, CheckExistUsernameRequest, $Out> {
  _CheckExistUsernameRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckExistUsernameRequest> $mapper =
      CheckExistUsernameRequestMapper.ensureInitialized();
  @override
  $R call({String? username}) =>
      $apply(FieldCopyWithData({if (username != null) #username: username}));
  @override
  CheckExistUsernameRequest $make(CopyWithData data) =>
      CheckExistUsernameRequest(
          username: data.get(#username, or: $value.username));

  @override
  CheckExistUsernameRequestCopyWith<$R2, CheckExistUsernameRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CheckExistUsernameRequestCopyWithImpl($value, $cast, t);
}
