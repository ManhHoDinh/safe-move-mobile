// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'find_username_response.dart';

class FindUsernameResponseMapper extends ClassMapperBase<FindUsernameResponse> {
  FindUsernameResponseMapper._();

  static FindUsernameResponseMapper? _instance;
  static FindUsernameResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FindUsernameResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FindUsernameResponse';

  static int? _$id(FindUsernameResponse v) => v.id;
  static const Field<FindUsernameResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$username(FindUsernameResponse v) => v.username;
  static const Field<FindUsernameResponse, String> _f$username =
      Field('username', _$username, opt: true);

  @override
  final MappableFields<FindUsernameResponse> fields = const {
    #id: _f$id,
    #username: _f$username,
  };

  static FindUsernameResponse _instantiate(DecodingData data) {
    return FindUsernameResponse(
        id: data.dec(_f$id), username: data.dec(_f$username));
  }

  @override
  final Function instantiate = _instantiate;

  static FindUsernameResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FindUsernameResponse>(map);
  }

  static FindUsernameResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<FindUsernameResponse>(json);
  }
}

mixin FindUsernameResponseMappable {
  String toJsonString() {
    return FindUsernameResponseMapper.ensureInitialized()
        .encodeJson<FindUsernameResponse>(this as FindUsernameResponse);
  }

  Map<String, dynamic> toJson() {
    return FindUsernameResponseMapper.ensureInitialized()
        .encodeMap<FindUsernameResponse>(this as FindUsernameResponse);
  }

  FindUsernameResponseCopyWith<FindUsernameResponse, FindUsernameResponse,
          FindUsernameResponse>
      get copyWith => _FindUsernameResponseCopyWithImpl(
          this as FindUsernameResponse, $identity, $identity);
  @override
  String toString() {
    return FindUsernameResponseMapper.ensureInitialized()
        .stringifyValue(this as FindUsernameResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FindUsernameResponseMapper.ensureInitialized()
                .isValueEqual(this as FindUsernameResponse, other));
  }

  @override
  int get hashCode {
    return FindUsernameResponseMapper.ensureInitialized()
        .hashValue(this as FindUsernameResponse);
  }
}

extension FindUsernameResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FindUsernameResponse, $Out> {
  FindUsernameResponseCopyWith<$R, FindUsernameResponse, $Out>
      get $asFindUsernameResponse =>
          $base.as((v, t, t2) => _FindUsernameResponseCopyWithImpl(v, t, t2));
}

abstract class FindUsernameResponseCopyWith<
    $R,
    $In extends FindUsernameResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? username});
  FindUsernameResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FindUsernameResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FindUsernameResponse, $Out>
    implements FindUsernameResponseCopyWith<$R, FindUsernameResponse, $Out> {
  _FindUsernameResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FindUsernameResponse> $mapper =
      FindUsernameResponseMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, Object? username = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (username != $none) #username: username
      }));
  @override
  FindUsernameResponse $make(CopyWithData data) => FindUsernameResponse(
      id: data.get(#id, or: $value.id),
      username: data.get(#username, or: $value.username));

  @override
  FindUsernameResponseCopyWith<$R2, FindUsernameResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FindUsernameResponseCopyWithImpl($value, $cast, t);
}
