// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_user_avatar_request.dart';

class UpdateUserAvatarRequestMapper
    extends ClassMapperBase<UpdateUserAvatarRequest> {
  UpdateUserAvatarRequestMapper._();

  static UpdateUserAvatarRequestMapper? _instance;
  static UpdateUserAvatarRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UpdateUserAvatarRequestMapper._());
      FileRequestMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserAvatarRequest';

  static FileRequest _$avatar(UpdateUserAvatarRequest v) => v.avatar;
  static const Field<UpdateUserAvatarRequest, FileRequest> _f$avatar =
      Field('avatar', _$avatar);

  @override
  final MappableFields<UpdateUserAvatarRequest> fields = const {
    #avatar: _f$avatar,
  };

  static UpdateUserAvatarRequest _instantiate(DecodingData data) {
    return UpdateUserAvatarRequest(avatar: data.dec(_f$avatar));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserAvatarRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserAvatarRequest>(map);
  }

  static UpdateUserAvatarRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<UpdateUserAvatarRequest>(json);
  }
}

mixin UpdateUserAvatarRequestMappable {
  String toJsonString() {
    return UpdateUserAvatarRequestMapper.ensureInitialized()
        .encodeJson<UpdateUserAvatarRequest>(this as UpdateUserAvatarRequest);
  }

  Map<String, dynamic> toJson() {
    return UpdateUserAvatarRequestMapper.ensureInitialized()
        .encodeMap<UpdateUserAvatarRequest>(this as UpdateUserAvatarRequest);
  }

  UpdateUserAvatarRequestCopyWith<UpdateUserAvatarRequest,
          UpdateUserAvatarRequest, UpdateUserAvatarRequest>
      get copyWith => _UpdateUserAvatarRequestCopyWithImpl(
          this as UpdateUserAvatarRequest, $identity, $identity);
  @override
  String toString() {
    return UpdateUserAvatarRequestMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserAvatarRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UpdateUserAvatarRequestMapper.ensureInitialized()
                .isValueEqual(this as UpdateUserAvatarRequest, other));
  }

  @override
  int get hashCode {
    return UpdateUserAvatarRequestMapper.ensureInitialized()
        .hashValue(this as UpdateUserAvatarRequest);
  }
}

extension UpdateUserAvatarRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserAvatarRequest, $Out> {
  UpdateUserAvatarRequestCopyWith<$R, UpdateUserAvatarRequest, $Out>
      get $asUpdateUserAvatarRequest => $base
          .as((v, t, t2) => _UpdateUserAvatarRequestCopyWithImpl(v, t, t2));
}

abstract class UpdateUserAvatarRequestCopyWith<
    $R,
    $In extends UpdateUserAvatarRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  FileRequestCopyWith<$R, FileRequest, FileRequest> get avatar;
  $R call({FileRequest? avatar});
  UpdateUserAvatarRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserAvatarRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserAvatarRequest, $Out>
    implements
        UpdateUserAvatarRequestCopyWith<$R, UpdateUserAvatarRequest, $Out> {
  _UpdateUserAvatarRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserAvatarRequest> $mapper =
      UpdateUserAvatarRequestMapper.ensureInitialized();
  @override
  FileRequestCopyWith<$R, FileRequest, FileRequest> get avatar =>
      $value.avatar.copyWith.$chain((v) => call(avatar: v));
  @override
  $R call({FileRequest? avatar}) =>
      $apply(FieldCopyWithData({if (avatar != null) #avatar: avatar}));
  @override
  UpdateUserAvatarRequest $make(CopyWithData data) =>
      UpdateUserAvatarRequest(avatar: data.get(#avatar, or: $value.avatar));

  @override
  UpdateUserAvatarRequestCopyWith<$R2, UpdateUserAvatarRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserAvatarRequestCopyWithImpl($value, $cast, t);
}
