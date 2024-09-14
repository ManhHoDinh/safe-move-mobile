// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment_response.dart';

class CommentResponseMapper extends ClassMapperBase<CommentResponse> {
  CommentResponseMapper._();

  static CommentResponseMapper? _instance;
  static CommentResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentResponseMapper._());
      UserDTOMapper.ensureInitialized();
      ChildCommentResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CommentResponse';

  static int? _$id(CommentResponse v) => v.id;
  static const Field<CommentResponse, int> _f$id = Field('id', _$id, opt: true);
  static DateTime? _$createdAt(CommentResponse v) => v.createdAt;
  static const Field<CommentResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(CommentResponse v) => v.updatedAt;
  static const Field<CommentResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static bool? _$isHidden(CommentResponse v) => v.isHidden;
  static const Field<CommentResponse, bool> _f$isHidden =
      Field('isHidden', _$isHidden, opt: true);
  static UserDTO? _$user(CommentResponse v) => v.user;
  static const Field<CommentResponse, UserDTO> _f$user =
      Field('user', _$user, opt: true);
  static List<ChildCommentResponse>? _$childComments(CommentResponse v) =>
      v.childComments;
  static const Field<CommentResponse, List<ChildCommentResponse>>
      _f$childComments = Field('childComments', _$childComments, opt: true);
  static String? _$content(CommentResponse v) => v.content;
  static const Field<CommentResponse, String> _f$content =
      Field('content', _$content, opt: true);
  static int? _$postId(CommentResponse v) => v.postId;
  static const Field<CommentResponse, int> _f$postId =
      Field('postId', _$postId, opt: true);

  @override
  final MappableFields<CommentResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isHidden: _f$isHidden,
    #user: _f$user,
    #childComments: _f$childComments,
    #content: _f$content,
    #postId: _f$postId,
  };

  static CommentResponse _instantiate(DecodingData data) {
    return CommentResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        isHidden: data.dec(_f$isHidden),
        user: data.dec(_f$user),
        childComments: data.dec(_f$childComments),
        content: data.dec(_f$content),
        postId: data.dec(_f$postId));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentResponse>(map);
  }

  static CommentResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<CommentResponse>(json);
  }
}

mixin CommentResponseMappable {
  String toJsonString() {
    return CommentResponseMapper.ensureInitialized()
        .encodeJson<CommentResponse>(this as CommentResponse);
  }

  Map<String, dynamic> toJson() {
    return CommentResponseMapper.ensureInitialized()
        .encodeMap<CommentResponse>(this as CommentResponse);
  }

  CommentResponseCopyWith<CommentResponse, CommentResponse, CommentResponse>
      get copyWith => _CommentResponseCopyWithImpl(
          this as CommentResponse, $identity, $identity);
  @override
  String toString() {
    return CommentResponseMapper.ensureInitialized()
        .stringifyValue(this as CommentResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CommentResponseMapper.ensureInitialized()
                .isValueEqual(this as CommentResponse, other));
  }

  @override
  int get hashCode {
    return CommentResponseMapper.ensureInitialized()
        .hashValue(this as CommentResponse);
  }
}

extension CommentResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentResponse, $Out> {
  CommentResponseCopyWith<$R, CommentResponse, $Out> get $asCommentResponse =>
      $base.as((v, t, t2) => _CommentResponseCopyWithImpl(v, t, t2));
}

abstract class CommentResponseCopyWith<$R, $In extends CommentResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user;
  ListCopyWith<
      $R,
      ChildCommentResponse,
      ChildCommentResponseCopyWith<$R, ChildCommentResponse,
          ChildCommentResponse>>? get childComments;
  $R call(
      {int? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? isHidden,
      UserDTO? user,
      List<ChildCommentResponse>? childComments,
      String? content,
      int? postId});
  CommentResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommentResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentResponse, $Out>
    implements CommentResponseCopyWith<$R, CommentResponse, $Out> {
  _CommentResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentResponse> $mapper =
      CommentResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  ListCopyWith<
      $R,
      ChildCommentResponse,
      ChildCommentResponseCopyWith<$R, ChildCommentResponse,
          ChildCommentResponse>>? get childComments =>
      $value.childComments != null
          ? ListCopyWith($value.childComments!, (v, t) => v.copyWith.$chain(t),
              (v) => call(childComments: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? isHidden = $none,
          Object? user = $none,
          Object? childComments = $none,
          Object? content = $none,
          Object? postId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (isHidden != $none) #isHidden: isHidden,
        if (user != $none) #user: user,
        if (childComments != $none) #childComments: childComments,
        if (content != $none) #content: content,
        if (postId != $none) #postId: postId
      }));
  @override
  CommentResponse $make(CopyWithData data) => CommentResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      isHidden: data.get(#isHidden, or: $value.isHidden),
      user: data.get(#user, or: $value.user),
      childComments: data.get(#childComments, or: $value.childComments),
      content: data.get(#content, or: $value.content),
      postId: data.get(#postId, or: $value.postId));

  @override
  CommentResponseCopyWith<$R2, CommentResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CommentResponseCopyWithImpl($value, $cast, t);
}
