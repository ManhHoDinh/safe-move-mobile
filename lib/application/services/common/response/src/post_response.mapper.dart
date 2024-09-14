// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_response.dart';

class PostResponseMapper extends ClassMapperBase<PostResponse> {
  PostResponseMapper._();

  static PostResponseMapper? _instance;
  static PostResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostResponseMapper._());
      PostLanguageMapper.ensureInitialized();
      PostCategoryDTOMapper.ensureInitialized();
      UserDTOMapper.ensureInitialized();
      PostTypeMapper.ensureInitialized();
      FileResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PostResponse';

  static int? _$id(PostResponse v) => v.id;
  static const Field<PostResponse, int> _f$id = Field('id', _$id, opt: true);
  static DateTime? _$createdAt(PostResponse v) => v.createdAt;
  static const Field<PostResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(PostResponse v) => v.updatedAt;
  static const Field<PostResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static PostLanguage? _$language(PostResponse v) => v.language;
  static const Field<PostResponse, PostLanguage> _f$language =
      Field('language', _$language, opt: true);
  static String? _$title(PostResponse v) => v.title;
  static const Field<PostResponse, String> _f$title =
      Field('title', _$title, opt: true);
  static String? _$content(PostResponse v) => v.content;
  static const Field<PostResponse, String> _f$content =
      Field('content', _$content, opt: true);
  static String? _$contentPlainText(PostResponse v) => v.contentPlainText;
  static const Field<PostResponse, String> _f$contentPlainText =
      Field('contentPlainText', _$contentPlainText, opt: true);
  static int? _$reactionCounter(PostResponse v) => v.reactionCounter;
  static const Field<PostResponse, int> _f$reactionCounter =
      Field('reactionCounter', _$reactionCounter, opt: true);
  static int? _$viewCounter(PostResponse v) => v.viewCounter;
  static const Field<PostResponse, int> _f$viewCounter =
      Field('viewCounter', _$viewCounter, opt: true);
  static int? _$commentCounter(PostResponse v) => v.commentCounter;
  static const Field<PostResponse, int> _f$commentCounter =
      Field('commentCounter', _$commentCounter, opt: true);
  static PostCategoryDTO? _$category(PostResponse v) => v.category;
  static const Field<PostResponse, PostCategoryDTO> _f$category =
      Field('category', _$category, opt: true);
  static UserDTO? _$writer(PostResponse v) => v.writer;
  static const Field<PostResponse, UserDTO> _f$writer =
      Field('writer', _$writer, opt: true);
  static bool? _$isReacted(PostResponse v) => v.isReacted;
  static const Field<PostResponse, bool> _f$isReacted =
      Field('isReacted', _$isReacted, opt: true);
  static PostType? _$type(PostResponse v) => v.type;
  static const Field<PostResponse, PostType> _f$type =
      Field('type', _$type, opt: true);
  static FileResponse? _$thumbnail(PostResponse v) => v.thumbnail;
  static const Field<PostResponse, FileResponse> _f$thumbnail =
      Field('thumbnail', _$thumbnail, opt: true);
  static FileResponse? _$mainThumbnail(PostResponse v) => v.mainThumbnail;
  static const Field<PostResponse, FileResponse> _f$mainThumbnail =
      Field('mainThumbnail', _$mainThumbnail, opt: true);
  static String? _$nameOfMainCharacter(PostResponse v) => v.nameOfMainCharacter;
  static const Field<PostResponse, String> _f$nameOfMainCharacter =
      Field('nameOfMainCharacter', _$nameOfMainCharacter, opt: true);
  static String? _$mainPageTitle(PostResponse v) => v.mainPageTitle;
  static const Field<PostResponse, String> _f$mainPageTitle =
      Field('mainPageTitle', _$mainPageTitle, opt: true);

  @override
  final MappableFields<PostResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #language: _f$language,
    #title: _f$title,
    #content: _f$content,
    #contentPlainText: _f$contentPlainText,
    #reactionCounter: _f$reactionCounter,
    #viewCounter: _f$viewCounter,
    #commentCounter: _f$commentCounter,
    #category: _f$category,
    #writer: _f$writer,
    #isReacted: _f$isReacted,
    #type: _f$type,
    #thumbnail: _f$thumbnail,
    #mainThumbnail: _f$mainThumbnail,
    #nameOfMainCharacter: _f$nameOfMainCharacter,
    #mainPageTitle: _f$mainPageTitle,
  };

  static PostResponse _instantiate(DecodingData data) {
    return PostResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        language: data.dec(_f$language),
        title: data.dec(_f$title),
        content: data.dec(_f$content),
        contentPlainText: data.dec(_f$contentPlainText),
        reactionCounter: data.dec(_f$reactionCounter),
        viewCounter: data.dec(_f$viewCounter),
        commentCounter: data.dec(_f$commentCounter),
        category: data.dec(_f$category),
        writer: data.dec(_f$writer),
        isReacted: data.dec(_f$isReacted),
        type: data.dec(_f$type),
        thumbnail: data.dec(_f$thumbnail),
        mainThumbnail: data.dec(_f$mainThumbnail),
        nameOfMainCharacter: data.dec(_f$nameOfMainCharacter),
        mainPageTitle: data.dec(_f$mainPageTitle));
  }

  @override
  final Function instantiate = _instantiate;

  static PostResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostResponse>(map);
  }

  static PostResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<PostResponse>(json);
  }
}

mixin PostResponseMappable {
  String toJsonString() {
    return PostResponseMapper.ensureInitialized()
        .encodeJson<PostResponse>(this as PostResponse);
  }

  Map<String, dynamic> toJson() {
    return PostResponseMapper.ensureInitialized()
        .encodeMap<PostResponse>(this as PostResponse);
  }

  PostResponseCopyWith<PostResponse, PostResponse, PostResponse> get copyWith =>
      _PostResponseCopyWithImpl(this as PostResponse, $identity, $identity);
  @override
  String toString() {
    return PostResponseMapper.ensureInitialized()
        .stringifyValue(this as PostResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PostResponseMapper.ensureInitialized()
                .isValueEqual(this as PostResponse, other));
  }

  @override
  int get hashCode {
    return PostResponseMapper.ensureInitialized()
        .hashValue(this as PostResponse);
  }
}

extension PostResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostResponse, $Out> {
  PostResponseCopyWith<$R, PostResponse, $Out> get $asPostResponse =>
      $base.as((v, t, t2) => _PostResponseCopyWithImpl(v, t, t2));
}

abstract class PostResponseCopyWith<$R, $In extends PostResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PostCategoryDTOCopyWith<$R, PostCategoryDTO, PostCategoryDTO>? get category;
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get writer;
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get thumbnail;
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get mainThumbnail;
  $R call(
      {int? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      PostLanguage? language,
      String? title,
      String? content,
      String? contentPlainText,
      int? reactionCounter,
      int? viewCounter,
      int? commentCounter,
      PostCategoryDTO? category,
      UserDTO? writer,
      bool? isReacted,
      PostType? type,
      FileResponse? thumbnail,
      FileResponse? mainThumbnail,
      String? nameOfMainCharacter,
      String? mainPageTitle});
  PostResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostResponse, $Out>
    implements PostResponseCopyWith<$R, PostResponse, $Out> {
  _PostResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostResponse> $mapper =
      PostResponseMapper.ensureInitialized();
  @override
  PostCategoryDTOCopyWith<$R, PostCategoryDTO, PostCategoryDTO>? get category =>
      $value.category?.copyWith.$chain((v) => call(category: v));
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get writer =>
      $value.writer?.copyWith.$chain((v) => call(writer: v));
  @override
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get thumbnail =>
      $value.thumbnail?.copyWith.$chain((v) => call(thumbnail: v));
  @override
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get mainThumbnail =>
      $value.mainThumbnail?.copyWith.$chain((v) => call(mainThumbnail: v));
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? language = $none,
          Object? title = $none,
          Object? content = $none,
          Object? contentPlainText = $none,
          Object? reactionCounter = $none,
          Object? viewCounter = $none,
          Object? commentCounter = $none,
          Object? category = $none,
          Object? writer = $none,
          Object? isReacted = $none,
          Object? type = $none,
          Object? thumbnail = $none,
          Object? mainThumbnail = $none,
          Object? nameOfMainCharacter = $none,
          Object? mainPageTitle = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (language != $none) #language: language,
        if (title != $none) #title: title,
        if (content != $none) #content: content,
        if (contentPlainText != $none) #contentPlainText: contentPlainText,
        if (reactionCounter != $none) #reactionCounter: reactionCounter,
        if (viewCounter != $none) #viewCounter: viewCounter,
        if (commentCounter != $none) #commentCounter: commentCounter,
        if (category != $none) #category: category,
        if (writer != $none) #writer: writer,
        if (isReacted != $none) #isReacted: isReacted,
        if (type != $none) #type: type,
        if (thumbnail != $none) #thumbnail: thumbnail,
        if (mainThumbnail != $none) #mainThumbnail: mainThumbnail,
        if (nameOfMainCharacter != $none)
          #nameOfMainCharacter: nameOfMainCharacter,
        if (mainPageTitle != $none) #mainPageTitle: mainPageTitle
      }));
  @override
  PostResponse $make(CopyWithData data) => PostResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      language: data.get(#language, or: $value.language),
      title: data.get(#title, or: $value.title),
      content: data.get(#content, or: $value.content),
      contentPlainText:
          data.get(#contentPlainText, or: $value.contentPlainText),
      reactionCounter: data.get(#reactionCounter, or: $value.reactionCounter),
      viewCounter: data.get(#viewCounter, or: $value.viewCounter),
      commentCounter: data.get(#commentCounter, or: $value.commentCounter),
      category: data.get(#category, or: $value.category),
      writer: data.get(#writer, or: $value.writer),
      isReacted: data.get(#isReacted, or: $value.isReacted),
      type: data.get(#type, or: $value.type),
      thumbnail: data.get(#thumbnail, or: $value.thumbnail),
      mainThumbnail: data.get(#mainThumbnail, or: $value.mainThumbnail),
      nameOfMainCharacter:
          data.get(#nameOfMainCharacter, or: $value.nameOfMainCharacter),
      mainPageTitle: data.get(#mainPageTitle, or: $value.mainPageTitle));

  @override
  PostResponseCopyWith<$R2, PostResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PostResponseCopyWithImpl($value, $cast, t);
}
