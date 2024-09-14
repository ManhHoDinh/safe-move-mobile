// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'verify_password_request.dart';

class VerifyPasswordRequestMapper
    extends ClassMapperBase<VerifyPasswordRequest> {
  VerifyPasswordRequestMapper._();

  static VerifyPasswordRequestMapper? _instance;
  static VerifyPasswordRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerifyPasswordRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyPasswordRequest';

  static String _$password(VerifyPasswordRequest v) => v.password;
  static const Field<VerifyPasswordRequest, String> _f$password =
      Field('password', _$password);

  @override
  final MappableFields<VerifyPasswordRequest> fields = const {
    #password: _f$password,
  };

  static VerifyPasswordRequest _instantiate(DecodingData data) {
    return VerifyPasswordRequest(password: data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyPasswordRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyPasswordRequest>(map);
  }

  static VerifyPasswordRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<VerifyPasswordRequest>(json);
  }
}

mixin VerifyPasswordRequestMappable {
  String toJsonString() {
    return VerifyPasswordRequestMapper.ensureInitialized()
        .encodeJson<VerifyPasswordRequest>(this as VerifyPasswordRequest);
  }

  Map<String, dynamic> toJson() {
    return VerifyPasswordRequestMapper.ensureInitialized()
        .encodeMap<VerifyPasswordRequest>(this as VerifyPasswordRequest);
  }

  VerifyPasswordRequestCopyWith<VerifyPasswordRequest, VerifyPasswordRequest,
          VerifyPasswordRequest>
      get copyWith => _VerifyPasswordRequestCopyWithImpl(
          this as VerifyPasswordRequest, $identity, $identity);
  @override
  String toString() {
    return VerifyPasswordRequestMapper.ensureInitialized()
        .stringifyValue(this as VerifyPasswordRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            VerifyPasswordRequestMapper.ensureInitialized()
                .isValueEqual(this as VerifyPasswordRequest, other));
  }

  @override
  int get hashCode {
    return VerifyPasswordRequestMapper.ensureInitialized()
        .hashValue(this as VerifyPasswordRequest);
  }
}

extension VerifyPasswordRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyPasswordRequest, $Out> {
  VerifyPasswordRequestCopyWith<$R, VerifyPasswordRequest, $Out>
      get $asVerifyPasswordRequest =>
          $base.as((v, t, t2) => _VerifyPasswordRequestCopyWithImpl(v, t, t2));
}

abstract class VerifyPasswordRequestCopyWith<
    $R,
    $In extends VerifyPasswordRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? password});
  VerifyPasswordRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VerifyPasswordRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyPasswordRequest, $Out>
    implements VerifyPasswordRequestCopyWith<$R, VerifyPasswordRequest, $Out> {
  _VerifyPasswordRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyPasswordRequest> $mapper =
      VerifyPasswordRequestMapper.ensureInitialized();
  @override
  $R call({String? password}) =>
      $apply(FieldCopyWithData({if (password != null) #password: password}));
  @override
  VerifyPasswordRequest $make(CopyWithData data) =>
      VerifyPasswordRequest(password: data.get(#password, or: $value.password));

  @override
  VerifyPasswordRequestCopyWith<$R2, VerifyPasswordRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _VerifyPasswordRequestCopyWithImpl($value, $cast, t);
}
