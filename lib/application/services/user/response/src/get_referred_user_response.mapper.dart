// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_referred_user_response.dart';

class GetReferredUserResponseMapper
    extends ClassMapperBase<GetReferredUserResponse> {
  GetReferredUserResponseMapper._();

  static GetReferredUserResponseMapper? _instance;
  static GetReferredUserResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = GetReferredUserResponseMapper._());
      UserDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GetReferredUserResponse';

  static List<UserDTO>? _$users(GetReferredUserResponse v) => v.users;
  static const Field<GetReferredUserResponse, List<UserDTO>> _f$users =
      Field('users', _$users, opt: true);

  @override
  final MappableFields<GetReferredUserResponse> fields = const {
    #users: _f$users,
  };

  static GetReferredUserResponse _instantiate(DecodingData data) {
    return GetReferredUserResponse(users: data.dec(_f$users));
  }

  @override
  final Function instantiate = _instantiate;

  static GetReferredUserResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetReferredUserResponse>(map);
  }

  static GetReferredUserResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<GetReferredUserResponse>(json);
  }
}

mixin GetReferredUserResponseMappable {
  String toJsonString() {
    return GetReferredUserResponseMapper.ensureInitialized()
        .encodeJson<GetReferredUserResponse>(this as GetReferredUserResponse);
  }

  Map<String, dynamic> toJson() {
    return GetReferredUserResponseMapper.ensureInitialized()
        .encodeMap<GetReferredUserResponse>(this as GetReferredUserResponse);
  }

  GetReferredUserResponseCopyWith<GetReferredUserResponse,
          GetReferredUserResponse, GetReferredUserResponse>
      get copyWith => _GetReferredUserResponseCopyWithImpl(
          this as GetReferredUserResponse, $identity, $identity);
  @override
  String toString() {
    return GetReferredUserResponseMapper.ensureInitialized()
        .stringifyValue(this as GetReferredUserResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GetReferredUserResponseMapper.ensureInitialized()
                .isValueEqual(this as GetReferredUserResponse, other));
  }

  @override
  int get hashCode {
    return GetReferredUserResponseMapper.ensureInitialized()
        .hashValue(this as GetReferredUserResponse);
  }
}

extension GetReferredUserResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetReferredUserResponse, $Out> {
  GetReferredUserResponseCopyWith<$R, GetReferredUserResponse, $Out>
      get $asGetReferredUserResponse => $base
          .as((v, t, t2) => _GetReferredUserResponseCopyWithImpl(v, t, t2));
}

abstract class GetReferredUserResponseCopyWith<
    $R,
    $In extends GetReferredUserResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, UserDTO, UserDTOCopyWith<$R, UserDTO, UserDTO>>? get users;
  $R call({List<UserDTO>? users});
  GetReferredUserResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetReferredUserResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetReferredUserResponse, $Out>
    implements
        GetReferredUserResponseCopyWith<$R, GetReferredUserResponse, $Out> {
  _GetReferredUserResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetReferredUserResponse> $mapper =
      GetReferredUserResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, UserDTO, UserDTOCopyWith<$R, UserDTO, UserDTO>>? get users =>
      $value.users != null
          ? ListCopyWith($value.users!, (v, t) => v.copyWith.$chain(t),
              (v) => call(users: v))
          : null;
  @override
  $R call({Object? users = $none}) =>
      $apply(FieldCopyWithData({if (users != $none) #users: users}));
  @override
  GetReferredUserResponse $make(CopyWithData data) =>
      GetReferredUserResponse(users: data.get(#users, or: $value.users));

  @override
  GetReferredUserResponseCopyWith<$R2, GetReferredUserResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetReferredUserResponseCopyWithImpl($value, $cast, t);
}
