// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'child_comment_response.dart';

class ChildCommentResponseMapper extends ClassMapperBase<ChildCommentResponse> {
  ChildCommentResponseMapper._();

  static ChildCommentResponseMapper? _instance;
  static ChildCommentResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChildCommentResponseMapper._());
      UserDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChildCommentResponse';

  static int? _$id(ChildCommentResponse v) => v.id;
  static const Field<ChildCommentResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static DateTime? _$createdAt(ChildCommentResponse v) => v.createdAt;
  static const Field<ChildCommentResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(ChildCommentResponse v) => v.updatedAt;
  static const Field<ChildCommentResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static bool? _$isHidden(ChildCommentResponse v) => v.isHidden;
  static const Field<ChildCommentResponse, bool> _f$isHidden =
      Field('isHidden', _$isHidden, opt: true);
  static UserDTO? _$user(ChildCommentResponse v) => v.user;
  static const Field<ChildCommentResponse, UserDTO> _f$user =
      Field('user', _$user, opt: true);
  static String? _$content(ChildCommentResponse v) => v.content;
  static const Field<ChildCommentResponse, String> _f$content =
      Field('content', _$content, opt: true);

  @override
  final MappableFields<ChildCommentResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isHidden: _f$isHidden,
    #user: _f$user,
    #content: _f$content,
  };

  static ChildCommentResponse _instantiate(DecodingData data) {
    return ChildCommentResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        isHidden: data.dec(_f$isHidden),
        user: data.dec(_f$user),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static ChildCommentResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChildCommentResponse>(map);
  }

  static ChildCommentResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChildCommentResponse>(json);
  }
}

mixin ChildCommentResponseMappable {
  String toJsonString() {
    return ChildCommentResponseMapper.ensureInitialized()
        .encodeJson<ChildCommentResponse>(this as ChildCommentResponse);
  }

  Map<String, dynamic> toJson() {
    return ChildCommentResponseMapper.ensureInitialized()
        .encodeMap<ChildCommentResponse>(this as ChildCommentResponse);
  }

  ChildCommentResponseCopyWith<ChildCommentResponse, ChildCommentResponse,
          ChildCommentResponse>
      get copyWith => _ChildCommentResponseCopyWithImpl(
          this as ChildCommentResponse, $identity, $identity);
  @override
  String toString() {
    return ChildCommentResponseMapper.ensureInitialized()
        .stringifyValue(this as ChildCommentResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ChildCommentResponseMapper.ensureInitialized()
                .isValueEqual(this as ChildCommentResponse, other));
  }

  @override
  int get hashCode {
    return ChildCommentResponseMapper.ensureInitialized()
        .hashValue(this as ChildCommentResponse);
  }
}

extension ChildCommentResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChildCommentResponse, $Out> {
  ChildCommentResponseCopyWith<$R, ChildCommentResponse, $Out>
      get $asChildCommentResponse =>
          $base.as((v, t, t2) => _ChildCommentResponseCopyWithImpl(v, t, t2));
}

abstract class ChildCommentResponseCopyWith<
    $R,
    $In extends ChildCommentResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user;
  $R call(
      {int? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? isHidden,
      UserDTO? user,
      String? content});
  ChildCommentResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChildCommentResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChildCommentResponse, $Out>
    implements ChildCommentResponseCopyWith<$R, ChildCommentResponse, $Out> {
  _ChildCommentResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChildCommentResponse> $mapper =
      ChildCommentResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? isHidden = $none,
          Object? user = $none,
          Object? content = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (isHidden != $none) #isHidden: isHidden,
        if (user != $none) #user: user,
        if (content != $none) #content: content
      }));
  @override
  ChildCommentResponse $make(CopyWithData data) => ChildCommentResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      isHidden: data.get(#isHidden, or: $value.isHidden),
      user: data.get(#user, or: $value.user),
      content: data.get(#content, or: $value.content));

  @override
  ChildCommentResponseCopyWith<$R2, ChildCommentResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChildCommentResponseCopyWithImpl($value, $cast, t);
}
