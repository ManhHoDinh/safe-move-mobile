// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'youtube_video_controller.dart';

class YoutubeVideoTypeMapper extends EnumMapper<YoutubeVideoType> {
  YoutubeVideoTypeMapper._();

  static YoutubeVideoTypeMapper? _instance;
  static YoutubeVideoTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubeVideoTypeMapper._());
    }
    return _instance!;
  }

  static YoutubeVideoType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  YoutubeVideoType decode(dynamic value) {
    switch (value) {
      case 'LONG':
        return YoutubeVideoType.LONG;
      case 'SHORT':
        return YoutubeVideoType.SHORT;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(YoutubeVideoType self) {
    switch (self) {
      case YoutubeVideoType.LONG:
        return 'LONG';
      case YoutubeVideoType.SHORT:
        return 'SHORT';
    }
  }
}

extension YoutubeVideoTypeMapperExtension on YoutubeVideoType {
  String toValue() {
    YoutubeVideoTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<YoutubeVideoType>(this) as String;
  }
}

class YoutubeVideoSortMapper extends EnumMapper<YoutubeVideoSort> {
  YoutubeVideoSortMapper._();

  static YoutubeVideoSortMapper? _instance;
  static YoutubeVideoSortMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubeVideoSortMapper._());
    }
    return _instance!;
  }

  static YoutubeVideoSort fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  YoutubeVideoSort decode(dynamic value) {
    switch (value) {
      case 'LATEST':
        return YoutubeVideoSort.LATEST;
      case 'BY_VIEW':
        return YoutubeVideoSort.BY_VIEW;
      case 'BY_REACTION':
        return YoutubeVideoSort.BY_REACTION;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(YoutubeVideoSort self) {
    switch (self) {
      case YoutubeVideoSort.LATEST:
        return 'LATEST';
      case YoutubeVideoSort.BY_VIEW:
        return 'BY_VIEW';
      case YoutubeVideoSort.BY_REACTION:
        return 'BY_REACTION';
    }
  }
}

extension YoutubeVideoSortMapperExtension on YoutubeVideoSort {
  String toValue() {
    YoutubeVideoSortMapper.ensureInitialized();
    return MapperContainer.globals.toValue<YoutubeVideoSort>(this) as String;
  }
}

class YoutubeResponseMapper extends ClassMapperBase<YoutubeResponse> {
  YoutubeResponseMapper._();

  static YoutubeResponseMapper? _instance;
  static YoutubeResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubeResponseMapper._());
      YoutubeVideoTypeMapper.ensureInitialized();
      FileResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubeResponse';

  static int? _$id(YoutubeResponse v) => v.id;
  static const Field<YoutubeResponse, int> _f$id = Field('id', _$id, opt: true);
  static DateTime? _$createdAt(YoutubeResponse v) => v.createdAt;
  static const Field<YoutubeResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(YoutubeResponse v) => v.updatedAt;
  static const Field<YoutubeResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static YoutubeVideoType? _$type(YoutubeResponse v) => v.type;
  static const Field<YoutubeResponse, YoutubeVideoType> _f$type =
      Field('type', _$type, opt: true);
  static String? _$title(YoutubeResponse v) => v.title;
  static const Field<YoutubeResponse, String> _f$title =
      Field('title', _$title, opt: true);
  static FileResponse? _$thumbnail(YoutubeResponse v) => v.thumbnail;
  static const Field<YoutubeResponse, FileResponse> _f$thumbnail =
      Field('thumbnail', _$thumbnail, opt: true);
  static int? _$commentCounter(YoutubeResponse v) => v.commentCounter;
  static const Field<YoutubeResponse, int> _f$commentCounter =
      Field('commentCounter', _$commentCounter, opt: true);
  static int? _$viewCounter(YoutubeResponse v) => v.viewCounter;
  static const Field<YoutubeResponse, int> _f$viewCounter =
      Field('viewCounter', _$viewCounter, opt: true);
  static int? _$reactionCounter(YoutubeResponse v) => v.reactionCounter;
  static const Field<YoutubeResponse, int> _f$reactionCounter =
      Field('reactionCounter', _$reactionCounter, opt: true);
  static bool? _$isReacted(YoutubeResponse v) => v.isReacted;
  static const Field<YoutubeResponse, bool> _f$isReacted =
      Field('isReacted', _$isReacted, opt: true);
  static String? _$videoUrl(YoutubeResponse v) => v.videoUrl;
  static const Field<YoutubeResponse, String> _f$videoUrl =
      Field('videoUrl', _$videoUrl, opt: true);

  @override
  final MappableFields<YoutubeResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #type: _f$type,
    #title: _f$title,
    #thumbnail: _f$thumbnail,
    #commentCounter: _f$commentCounter,
    #viewCounter: _f$viewCounter,
    #reactionCounter: _f$reactionCounter,
    #isReacted: _f$isReacted,
    #videoUrl: _f$videoUrl,
  };

  static YoutubeResponse _instantiate(DecodingData data) {
    return YoutubeResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        type: data.dec(_f$type),
        title: data.dec(_f$title),
        thumbnail: data.dec(_f$thumbnail),
        commentCounter: data.dec(_f$commentCounter),
        viewCounter: data.dec(_f$viewCounter),
        reactionCounter: data.dec(_f$reactionCounter),
        isReacted: data.dec(_f$isReacted),
        videoUrl: data.dec(_f$videoUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubeResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubeResponse>(map);
  }

  static YoutubeResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubeResponse>(json);
  }
}

mixin YoutubeResponseMappable {
  String toJsonString() {
    return YoutubeResponseMapper.ensureInitialized()
        .encodeJson<YoutubeResponse>(this as YoutubeResponse);
  }

  Map<String, dynamic> toJson() {
    return YoutubeResponseMapper.ensureInitialized()
        .encodeMap<YoutubeResponse>(this as YoutubeResponse);
  }

  YoutubeResponseCopyWith<YoutubeResponse, YoutubeResponse, YoutubeResponse>
      get copyWith => _YoutubeResponseCopyWithImpl(
          this as YoutubeResponse, $identity, $identity);
  @override
  String toString() {
    return YoutubeResponseMapper.ensureInitialized()
        .stringifyValue(this as YoutubeResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubeResponseMapper.ensureInitialized()
                .isValueEqual(this as YoutubeResponse, other));
  }

  @override
  int get hashCode {
    return YoutubeResponseMapper.ensureInitialized()
        .hashValue(this as YoutubeResponse);
  }
}

extension YoutubeResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubeResponse, $Out> {
  YoutubeResponseCopyWith<$R, YoutubeResponse, $Out> get $asYoutubeResponse =>
      $base.as((v, t, t2) => _YoutubeResponseCopyWithImpl(v, t, t2));
}

abstract class YoutubeResponseCopyWith<$R, $In extends YoutubeResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get thumbnail;
  $R call(
      {int? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      YoutubeVideoType? type,
      String? title,
      FileResponse? thumbnail,
      int? commentCounter,
      int? viewCounter,
      int? reactionCounter,
      bool? isReacted,
      String? videoUrl});
  YoutubeResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubeResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubeResponse, $Out>
    implements YoutubeResponseCopyWith<$R, YoutubeResponse, $Out> {
  _YoutubeResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubeResponse> $mapper =
      YoutubeResponseMapper.ensureInitialized();
  @override
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get thumbnail =>
      $value.thumbnail?.copyWith.$chain((v) => call(thumbnail: v));
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? type = $none,
          Object? title = $none,
          Object? thumbnail = $none,
          Object? commentCounter = $none,
          Object? viewCounter = $none,
          Object? reactionCounter = $none,
          Object? isReacted = $none,
          Object? videoUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (type != $none) #type: type,
        if (title != $none) #title: title,
        if (thumbnail != $none) #thumbnail: thumbnail,
        if (commentCounter != $none) #commentCounter: commentCounter,
        if (viewCounter != $none) #viewCounter: viewCounter,
        if (reactionCounter != $none) #reactionCounter: reactionCounter,
        if (isReacted != $none) #isReacted: isReacted,
        if (videoUrl != $none) #videoUrl: videoUrl
      }));
  @override
  YoutubeResponse $make(CopyWithData data) => YoutubeResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      type: data.get(#type, or: $value.type),
      title: data.get(#title, or: $value.title),
      thumbnail: data.get(#thumbnail, or: $value.thumbnail),
      commentCounter: data.get(#commentCounter, or: $value.commentCounter),
      viewCounter: data.get(#viewCounter, or: $value.viewCounter),
      reactionCounter: data.get(#reactionCounter, or: $value.reactionCounter),
      isReacted: data.get(#isReacted, or: $value.isReacted),
      videoUrl: data.get(#videoUrl, or: $value.videoUrl));

  @override
  YoutubeResponseCopyWith<$R2, YoutubeResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YoutubeResponseCopyWithImpl($value, $cast, t);
}

class ReactionRequestMapper extends ClassMapperBase<ReactionRequest> {
  ReactionRequestMapper._();

  static ReactionRequestMapper? _instance;
  static ReactionRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReactionRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ReactionRequest';

  static bool _$isReact(ReactionRequest v) => v.isReact;
  static const Field<ReactionRequest, bool> _f$isReact =
      Field('isReact', _$isReact);

  @override
  final MappableFields<ReactionRequest> fields = const {
    #isReact: _f$isReact,
  };

  static ReactionRequest _instantiate(DecodingData data) {
    return ReactionRequest(isReact: data.dec(_f$isReact));
  }

  @override
  final Function instantiate = _instantiate;

  static ReactionRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReactionRequest>(map);
  }

  static ReactionRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ReactionRequest>(json);
  }
}

mixin ReactionRequestMappable {
  String toJsonString() {
    return ReactionRequestMapper.ensureInitialized()
        .encodeJson<ReactionRequest>(this as ReactionRequest);
  }

  Map<String, dynamic> toJson() {
    return ReactionRequestMapper.ensureInitialized()
        .encodeMap<ReactionRequest>(this as ReactionRequest);
  }

  ReactionRequestCopyWith<ReactionRequest, ReactionRequest, ReactionRequest>
      get copyWith => _ReactionRequestCopyWithImpl(
          this as ReactionRequest, $identity, $identity);
  @override
  String toString() {
    return ReactionRequestMapper.ensureInitialized()
        .stringifyValue(this as ReactionRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ReactionRequestMapper.ensureInitialized()
                .isValueEqual(this as ReactionRequest, other));
  }

  @override
  int get hashCode {
    return ReactionRequestMapper.ensureInitialized()
        .hashValue(this as ReactionRequest);
  }
}

extension ReactionRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReactionRequest, $Out> {
  ReactionRequestCopyWith<$R, ReactionRequest, $Out> get $asReactionRequest =>
      $base.as((v, t, t2) => _ReactionRequestCopyWithImpl(v, t, t2));
}

abstract class ReactionRequestCopyWith<$R, $In extends ReactionRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isReact});
  ReactionRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReactionRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReactionRequest, $Out>
    implements ReactionRequestCopyWith<$R, ReactionRequest, $Out> {
  _ReactionRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReactionRequest> $mapper =
      ReactionRequestMapper.ensureInitialized();
  @override
  $R call({bool? isReact}) =>
      $apply(FieldCopyWithData({if (isReact != null) #isReact: isReact}));
  @override
  ReactionRequest $make(CopyWithData data) =>
      ReactionRequest(isReact: data.get(#isReact, or: $value.isReact));

  @override
  ReactionRequestCopyWith<$R2, ReactionRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ReactionRequestCopyWithImpl($value, $cast, t);
}
