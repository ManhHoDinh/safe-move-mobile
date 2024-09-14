// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_create_request.dart';

class PostRequestMapper extends ClassMapperBase<PostRequest> {
  PostRequestMapper._();

  static PostRequestMapper? _instance;
  static PostRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostRequestMapper._());
      PostLanguageMapper.ensureInitialized();
      FileRequestMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PostRequest';

  static PostLanguage _$language(PostRequest v) => v.language;
  static const Field<PostRequest, PostLanguage> _f$language =
      Field('language', _$language);
  static String _$title(PostRequest v) => v.title;
  static const Field<PostRequest, String> _f$title = Field('title', _$title);
  static String _$content(PostRequest v) => v.content;
  static const Field<PostRequest, String> _f$content =
      Field('content', _$content);
  static String _$contentPlainText(PostRequest v) => v.contentPlainText;
  static const Field<PostRequest, String> _f$contentPlainText =
      Field('contentPlainText', _$contentPlainText);
  static int _$categoryId(PostRequest v) => v.categoryId;
  static const Field<PostRequest, int> _f$categoryId =
      Field('categoryId', _$categoryId);
  static FileRequest? _$thumbnail(PostRequest v) => v.thumbnail;
  static const Field<PostRequest, FileRequest> _f$thumbnail =
      Field('thumbnail', _$thumbnail, opt: true);
  static bool _$isDraft(PostRequest v) => v.isDraft;
  static const Field<PostRequest, bool> _f$isDraft =
      Field('isDraft', _$isDraft);

  @override
  final MappableFields<PostRequest> fields = const {
    #language: _f$language,
    #title: _f$title,
    #content: _f$content,
    #contentPlainText: _f$contentPlainText,
    #categoryId: _f$categoryId,
    #thumbnail: _f$thumbnail,
    #isDraft: _f$isDraft,
  };

  static PostRequest _instantiate(DecodingData data) {
    return PostRequest(
        language: data.dec(_f$language),
        title: data.dec(_f$title),
        content: data.dec(_f$content),
        contentPlainText: data.dec(_f$contentPlainText),
        categoryId: data.dec(_f$categoryId),
        thumbnail: data.dec(_f$thumbnail),
        isDraft: data.dec(_f$isDraft));
  }

  @override
  final Function instantiate = _instantiate;

  static PostRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostRequest>(map);
  }

  static PostRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<PostRequest>(json);
  }
}

mixin PostRequestMappable {
  String toJsonString() {
    return PostRequestMapper.ensureInitialized()
        .encodeJson<PostRequest>(this as PostRequest);
  }

  Map<String, dynamic> toJson() {
    return PostRequestMapper.ensureInitialized()
        .encodeMap<PostRequest>(this as PostRequest);
  }

  PostRequestCopyWith<PostRequest, PostRequest, PostRequest> get copyWith =>
      _PostRequestCopyWithImpl(this as PostRequest, $identity, $identity);
  @override
  String toString() {
    return PostRequestMapper.ensureInitialized()
        .stringifyValue(this as PostRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PostRequestMapper.ensureInitialized()
                .isValueEqual(this as PostRequest, other));
  }

  @override
  int get hashCode {
    return PostRequestMapper.ensureInitialized().hashValue(this as PostRequest);
  }
}

extension PostRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostRequest, $Out> {
  PostRequestCopyWith<$R, PostRequest, $Out> get $asPostRequest =>
      $base.as((v, t, t2) => _PostRequestCopyWithImpl(v, t, t2));
}

abstract class PostRequestCopyWith<$R, $In extends PostRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  FileRequestCopyWith<$R, FileRequest, FileRequest>? get thumbnail;
  $R call(
      {PostLanguage? language,
      String? title,
      String? content,
      String? contentPlainText,
      int? categoryId,
      FileRequest? thumbnail,
      bool? isDraft});
  PostRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostRequest, $Out>
    implements PostRequestCopyWith<$R, PostRequest, $Out> {
  _PostRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostRequest> $mapper =
      PostRequestMapper.ensureInitialized();
  @override
  FileRequestCopyWith<$R, FileRequest, FileRequest>? get thumbnail =>
      $value.thumbnail?.copyWith.$chain((v) => call(thumbnail: v));
  @override
  $R call(
          {PostLanguage? language,
          String? title,
          String? content,
          String? contentPlainText,
          int? categoryId,
          bool? isDraft,
          Object? thumbnail = $none}) =>
      $apply(FieldCopyWithData({
        if (language != null) #language: language,
        if (title != null) #title: title,
        if (content != null) #content: content,
        if (contentPlainText != null) #contentPlainText: contentPlainText,
        if (categoryId != null) #categoryId: categoryId,
        if (thumbnail != $none) #thumbnail: thumbnail,
        if (isDraft != null) #isDraft: isDraft,
      }));
  @override
  PostRequest $make(CopyWithData data) => PostRequest(
        language: data.get(#language, or: $value.language),
        title: data.get(#title, or: $value.title),
        content: data.get(#content, or: $value.content),
        contentPlainText:
            data.get(#contentPlainText, or: $value.contentPlainText),
        categoryId: data.get(#categoryId, or: $value.categoryId),
        thumbnail: data.get(#thumbnail, or: $value.thumbnail),
        isDraft: data.get(#isDraft, or: $value.isDraft),
      );

  @override
  PostRequestCopyWith<$R2, PostRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostRequestCopyWithImpl($value, $cast, t);
}
