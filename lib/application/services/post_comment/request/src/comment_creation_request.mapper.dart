// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment_creation_request.dart';

class CommentCreationRequestMapper
    extends ClassMapperBase<CommentCreationRequest> {
  CommentCreationRequestMapper._();

  static CommentCreationRequestMapper? _instance;
  static CommentCreationRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentCreationRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommentCreationRequest';

  static String? _$content(CommentCreationRequest v) => v.content;
  static const Field<CommentCreationRequest, String> _f$content =
      Field('content', _$content, opt: true);
  static int? _$commentParentId(CommentCreationRequest v) => v.commentParentId;
  static const Field<CommentCreationRequest, int> _f$commentParentId =
      Field('commentParentId', _$commentParentId, opt: true);

  @override
  final MappableFields<CommentCreationRequest> fields = const {
    #content: _f$content,
    #commentParentId: _f$commentParentId,
  };

  static CommentCreationRequest _instantiate(DecodingData data) {
    return CommentCreationRequest(
        content: data.dec(_f$content),
        commentParentId: data.dec(_f$commentParentId));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentCreationRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentCreationRequest>(map);
  }

  static CommentCreationRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CommentCreationRequest>(json);
  }
}

mixin CommentCreationRequestMappable {
  String toJsonString() {
    return CommentCreationRequestMapper.ensureInitialized()
        .encodeJson<CommentCreationRequest>(this as CommentCreationRequest);
  }

  Map<String, dynamic> toJson() {
    return CommentCreationRequestMapper.ensureInitialized()
        .encodeMap<CommentCreationRequest>(this as CommentCreationRequest);
  }

  CommentCreationRequestCopyWith<CommentCreationRequest, CommentCreationRequest,
          CommentCreationRequest>
      get copyWith => _CommentCreationRequestCopyWithImpl(
          this as CommentCreationRequest, $identity, $identity);
  @override
  String toString() {
    return CommentCreationRequestMapper.ensureInitialized()
        .stringifyValue(this as CommentCreationRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CommentCreationRequestMapper.ensureInitialized()
                .isValueEqual(this as CommentCreationRequest, other));
  }

  @override
  int get hashCode {
    return CommentCreationRequestMapper.ensureInitialized()
        .hashValue(this as CommentCreationRequest);
  }
}

extension CommentCreationRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentCreationRequest, $Out> {
  CommentCreationRequestCopyWith<$R, CommentCreationRequest, $Out>
      get $asCommentCreationRequest =>
          $base.as((v, t, t2) => _CommentCreationRequestCopyWithImpl(v, t, t2));
}

abstract class CommentCreationRequestCopyWith<
    $R,
    $In extends CommentCreationRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? content, int? commentParentId});
  CommentCreationRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommentCreationRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentCreationRequest, $Out>
    implements
        CommentCreationRequestCopyWith<$R, CommentCreationRequest, $Out> {
  _CommentCreationRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentCreationRequest> $mapper =
      CommentCreationRequestMapper.ensureInitialized();
  @override
  $R call({Object? content = $none, Object? commentParentId = $none}) =>
      $apply(FieldCopyWithData({
        if (content != $none) #content: content,
        if (commentParentId != $none) #commentParentId: commentParentId
      }));
  @override
  CommentCreationRequest $make(CopyWithData data) => CommentCreationRequest(
      content: data.get(#content, or: $value.content),
      commentParentId: data.get(#commentParentId, or: $value.commentParentId));

  @override
  CommentCreationRequestCopyWith<$R2, CommentCreationRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CommentCreationRequestCopyWithImpl($value, $cast, t);
}
