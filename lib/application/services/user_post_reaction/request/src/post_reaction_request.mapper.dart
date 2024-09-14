// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_reaction_request.dart';

class PostReactionRequestMapper extends ClassMapperBase<PostReactionRequest> {
  PostReactionRequestMapper._();

  static PostReactionRequestMapper? _instance;
  static PostReactionRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostReactionRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PostReactionRequest';

  static bool _$isReact(PostReactionRequest v) => v.isReact;
  static const Field<PostReactionRequest, bool> _f$isReact =
      Field('isReact', _$isReact);

  @override
  final MappableFields<PostReactionRequest> fields = const {
    #isReact: _f$isReact,
  };

  static PostReactionRequest _instantiate(DecodingData data) {
    return PostReactionRequest(isReact: data.dec(_f$isReact));
  }

  @override
  final Function instantiate = _instantiate;

  static PostReactionRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostReactionRequest>(map);
  }

  static PostReactionRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<PostReactionRequest>(json);
  }
}

mixin PostReactionRequestMappable {
  String toJsonString() {
    return PostReactionRequestMapper.ensureInitialized()
        .encodeJson<PostReactionRequest>(this as PostReactionRequest);
  }

  Map<String, dynamic> toJson() {
    return PostReactionRequestMapper.ensureInitialized()
        .encodeMap<PostReactionRequest>(this as PostReactionRequest);
  }

  PostReactionRequestCopyWith<PostReactionRequest, PostReactionRequest,
          PostReactionRequest>
      get copyWith => _PostReactionRequestCopyWithImpl(
          this as PostReactionRequest, $identity, $identity);
  @override
  String toString() {
    return PostReactionRequestMapper.ensureInitialized()
        .stringifyValue(this as PostReactionRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PostReactionRequestMapper.ensureInitialized()
                .isValueEqual(this as PostReactionRequest, other));
  }

  @override
  int get hashCode {
    return PostReactionRequestMapper.ensureInitialized()
        .hashValue(this as PostReactionRequest);
  }
}

extension PostReactionRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostReactionRequest, $Out> {
  PostReactionRequestCopyWith<$R, PostReactionRequest, $Out>
      get $asPostReactionRequest =>
          $base.as((v, t, t2) => _PostReactionRequestCopyWithImpl(v, t, t2));
}

abstract class PostReactionRequestCopyWith<$R, $In extends PostReactionRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isReact});
  PostReactionRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PostReactionRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostReactionRequest, $Out>
    implements PostReactionRequestCopyWith<$R, PostReactionRequest, $Out> {
  _PostReactionRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostReactionRequest> $mapper =
      PostReactionRequestMapper.ensureInitialized();
  @override
  $R call({bool? isReact}) =>
      $apply(FieldCopyWithData({if (isReact != null) #isReact: isReact}));
  @override
  PostReactionRequest $make(CopyWithData data) =>
      PostReactionRequest(isReact: data.get(#isReact, or: $value.isReact));

  @override
  PostReactionRequestCopyWith<$R2, PostReactionRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PostReactionRequestCopyWithImpl($value, $cast, t);
}
