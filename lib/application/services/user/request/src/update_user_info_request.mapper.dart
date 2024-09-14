// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_user_info_request.dart';

class UpdateUserInfoRequestMapper
    extends ClassMapperBase<UpdateUserInfoRequest> {
  UpdateUserInfoRequestMapper._();

  static UpdateUserInfoRequestMapper? _instance;
  static UpdateUserInfoRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateUserInfoRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserInfoRequest';

  static String _$name(UpdateUserInfoRequest v) => v.name;
  static const Field<UpdateUserInfoRequest, String> _f$name =
      Field('name', _$name);
  static String? _$email(UpdateUserInfoRequest v) => v.email;
  static const Field<UpdateUserInfoRequest, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$bio(UpdateUserInfoRequest v) => v.bio;
  static const Field<UpdateUserInfoRequest, String> _f$bio =
      Field('bio', _$bio, opt: true);

  @override
  final MappableFields<UpdateUserInfoRequest> fields = const {
    #name: _f$name,
    #email: _f$email,
    #bio: _f$bio,
  };

  static UpdateUserInfoRequest _instantiate(DecodingData data) {
    return UpdateUserInfoRequest(
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        bio: data.dec(_f$bio));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserInfoRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserInfoRequest>(map);
  }

  static UpdateUserInfoRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<UpdateUserInfoRequest>(json);
  }
}

mixin UpdateUserInfoRequestMappable {
  String toJsonString() {
    return UpdateUserInfoRequestMapper.ensureInitialized()
        .encodeJson<UpdateUserInfoRequest>(this as UpdateUserInfoRequest);
  }

  Map<String, dynamic> toJson() {
    return UpdateUserInfoRequestMapper.ensureInitialized()
        .encodeMap<UpdateUserInfoRequest>(this as UpdateUserInfoRequest);
  }

  UpdateUserInfoRequestCopyWith<UpdateUserInfoRequest, UpdateUserInfoRequest,
          UpdateUserInfoRequest>
      get copyWith => _UpdateUserInfoRequestCopyWithImpl(
          this as UpdateUserInfoRequest, $identity, $identity);
  @override
  String toString() {
    return UpdateUserInfoRequestMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserInfoRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UpdateUserInfoRequestMapper.ensureInitialized()
                .isValueEqual(this as UpdateUserInfoRequest, other));
  }

  @override
  int get hashCode {
    return UpdateUserInfoRequestMapper.ensureInitialized()
        .hashValue(this as UpdateUserInfoRequest);
  }
}

extension UpdateUserInfoRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserInfoRequest, $Out> {
  UpdateUserInfoRequestCopyWith<$R, UpdateUserInfoRequest, $Out>
      get $asUpdateUserInfoRequest =>
          $base.as((v, t, t2) => _UpdateUserInfoRequestCopyWithImpl(v, t, t2));
}

abstract class UpdateUserInfoRequestCopyWith<
    $R,
    $In extends UpdateUserInfoRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? email, String? bio});
  UpdateUserInfoRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserInfoRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserInfoRequest, $Out>
    implements UpdateUserInfoRequestCopyWith<$R, UpdateUserInfoRequest, $Out> {
  _UpdateUserInfoRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserInfoRequest> $mapper =
      UpdateUserInfoRequestMapper.ensureInitialized();
  @override
  $R call({String? name, Object? email = $none, Object? bio = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (email != $none) #email: email,
        if (bio != $none) #bio: bio
      }));
  @override
  UpdateUserInfoRequest $make(CopyWithData data) => UpdateUserInfoRequest(
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      bio: data.get(#bio, or: $value.bio));

  @override
  UpdateUserInfoRequestCopyWith<$R2, UpdateUserInfoRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserInfoRequestCopyWithImpl($value, $cast, t);
}
