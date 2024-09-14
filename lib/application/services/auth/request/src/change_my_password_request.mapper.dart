// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'change_my_password_request.dart';

class ChangeMyPasswordRequestMapper
    extends ClassMapperBase<ChangeMyPasswordRequest> {
  ChangeMyPasswordRequestMapper._();

  static ChangeMyPasswordRequestMapper? _instance;
  static ChangeMyPasswordRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ChangeMyPasswordRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChangeMyPasswordRequest';

  static String _$currentPassword(ChangeMyPasswordRequest v) =>
      v.currentPassword;
  static const Field<ChangeMyPasswordRequest, String> _f$currentPassword =
      Field('currentPassword', _$currentPassword);
  static String _$newPassword(ChangeMyPasswordRequest v) => v.newPassword;
  static const Field<ChangeMyPasswordRequest, String> _f$newPassword =
      Field('newPassword', _$newPassword);

  @override
  final MappableFields<ChangeMyPasswordRequest> fields = const {
    #currentPassword: _f$currentPassword,
    #newPassword: _f$newPassword,
  };

  static ChangeMyPasswordRequest _instantiate(DecodingData data) {
    return ChangeMyPasswordRequest(
        currentPassword: data.dec(_f$currentPassword),
        newPassword: data.dec(_f$newPassword));
  }

  @override
  final Function instantiate = _instantiate;

  static ChangeMyPasswordRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangeMyPasswordRequest>(map);
  }

  static ChangeMyPasswordRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChangeMyPasswordRequest>(json);
  }
}

mixin ChangeMyPasswordRequestMappable {
  String toJsonString() {
    return ChangeMyPasswordRequestMapper.ensureInitialized()
        .encodeJson<ChangeMyPasswordRequest>(this as ChangeMyPasswordRequest);
  }

  Map<String, dynamic> toJson() {
    return ChangeMyPasswordRequestMapper.ensureInitialized()
        .encodeMap<ChangeMyPasswordRequest>(this as ChangeMyPasswordRequest);
  }

  ChangeMyPasswordRequestCopyWith<ChangeMyPasswordRequest,
          ChangeMyPasswordRequest, ChangeMyPasswordRequest>
      get copyWith => _ChangeMyPasswordRequestCopyWithImpl(
          this as ChangeMyPasswordRequest, $identity, $identity);
  @override
  String toString() {
    return ChangeMyPasswordRequestMapper.ensureInitialized()
        .stringifyValue(this as ChangeMyPasswordRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ChangeMyPasswordRequestMapper.ensureInitialized()
                .isValueEqual(this as ChangeMyPasswordRequest, other));
  }

  @override
  int get hashCode {
    return ChangeMyPasswordRequestMapper.ensureInitialized()
        .hashValue(this as ChangeMyPasswordRequest);
  }
}

extension ChangeMyPasswordRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangeMyPasswordRequest, $Out> {
  ChangeMyPasswordRequestCopyWith<$R, ChangeMyPasswordRequest, $Out>
      get $asChangeMyPasswordRequest => $base
          .as((v, t, t2) => _ChangeMyPasswordRequestCopyWithImpl(v, t, t2));
}

abstract class ChangeMyPasswordRequestCopyWith<
    $R,
    $In extends ChangeMyPasswordRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? currentPassword, String? newPassword});
  ChangeMyPasswordRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChangeMyPasswordRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangeMyPasswordRequest, $Out>
    implements
        ChangeMyPasswordRequestCopyWith<$R, ChangeMyPasswordRequest, $Out> {
  _ChangeMyPasswordRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangeMyPasswordRequest> $mapper =
      ChangeMyPasswordRequestMapper.ensureInitialized();
  @override
  $R call({String? currentPassword, String? newPassword}) =>
      $apply(FieldCopyWithData({
        if (currentPassword != null) #currentPassword: currentPassword,
        if (newPassword != null) #newPassword: newPassword
      }));
  @override
  ChangeMyPasswordRequest $make(CopyWithData data) => ChangeMyPasswordRequest(
      currentPassword: data.get(#currentPassword, or: $value.currentPassword),
      newPassword: data.get(#newPassword, or: $value.newPassword));

  @override
  ChangeMyPasswordRequestCopyWith<$R2, ChangeMyPasswordRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChangeMyPasswordRequestCopyWithImpl($value, $cast, t);
}
