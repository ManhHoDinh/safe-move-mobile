// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment_update_request.dart';

class CommentUpdateRequestMapper extends ClassMapperBase<CommentUpdateRequest> {
  CommentUpdateRequestMapper._();

  static CommentUpdateRequestMapper? _instance;
  static CommentUpdateRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentUpdateRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommentUpdateRequest';

  static String? _$content(CommentUpdateRequest v) => v.content;
  static const Field<CommentUpdateRequest, String> _f$content =
      Field('content', _$content, opt: true);

  @override
  final MappableFields<CommentUpdateRequest> fields = const {
    #content: _f$content,
  };

  static CommentUpdateRequest _instantiate(DecodingData data) {
    return CommentUpdateRequest(content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static CommentUpdateRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommentUpdateRequest>(map);
  }

  static CommentUpdateRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CommentUpdateRequest>(json);
  }
}

mixin CommentUpdateRequestMappable {
  String toJsonString() {
    return CommentUpdateRequestMapper.ensureInitialized()
        .encodeJson<CommentUpdateRequest>(this as CommentUpdateRequest);
  }

  Map<String, dynamic> toJson() {
    return CommentUpdateRequestMapper.ensureInitialized()
        .encodeMap<CommentUpdateRequest>(this as CommentUpdateRequest);
  }

  CommentUpdateRequestCopyWith<CommentUpdateRequest, CommentUpdateRequest,
          CommentUpdateRequest>
      get copyWith => _CommentUpdateRequestCopyWithImpl(
          this as CommentUpdateRequest, $identity, $identity);
  @override
  String toString() {
    return CommentUpdateRequestMapper.ensureInitialized()
        .stringifyValue(this as CommentUpdateRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CommentUpdateRequestMapper.ensureInitialized()
                .isValueEqual(this as CommentUpdateRequest, other));
  }

  @override
  int get hashCode {
    return CommentUpdateRequestMapper.ensureInitialized()
        .hashValue(this as CommentUpdateRequest);
  }
}

extension CommentUpdateRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommentUpdateRequest, $Out> {
  CommentUpdateRequestCopyWith<$R, CommentUpdateRequest, $Out>
      get $asCommentUpdateRequest =>
          $base.as((v, t, t2) => _CommentUpdateRequestCopyWithImpl(v, t, t2));
}

abstract class CommentUpdateRequestCopyWith<
    $R,
    $In extends CommentUpdateRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? content});
  CommentUpdateRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CommentUpdateRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommentUpdateRequest, $Out>
    implements CommentUpdateRequestCopyWith<$R, CommentUpdateRequest, $Out> {
  _CommentUpdateRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommentUpdateRequest> $mapper =
      CommentUpdateRequestMapper.ensureInitialized();
  @override
  $R call({Object? content = $none}) =>
      $apply(FieldCopyWithData({if (content != $none) #content: content}));
  @override
  CommentUpdateRequest $make(CopyWithData data) =>
      CommentUpdateRequest(content: data.get(#content, or: $value.content));

  @override
  CommentUpdateRequestCopyWith<$R2, CommentUpdateRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CommentUpdateRequestCopyWithImpl($value, $cast, t);
}
