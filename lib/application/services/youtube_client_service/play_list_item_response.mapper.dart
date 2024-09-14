// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'play_list_item_response.dart';

class PlayListItemMapper extends ClassMapperBase<PlayListItem> {
  PlayListItemMapper._();

  static PlayListItemMapper? _instance;
  static PlayListItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayListItemMapper._());
      YoutubePageInfoMapper.ensureInitialized();
      YoutubePageContentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PlayListItem';

  static YoutubePageInfo? _$pageInfo(PlayListItem v) => v.pageInfo;
  static const Field<PlayListItem, YoutubePageInfo> _f$pageInfo =
      Field('pageInfo', _$pageInfo, opt: true);
  static List<YoutubePageContent>? _$items(PlayListItem v) => v.items;
  static const Field<PlayListItem, List<YoutubePageContent>> _f$items =
      Field('items', _$items, opt: true);
  static String? _$etag(PlayListItem v) => v.etag;
  static const Field<PlayListItem, String> _f$etag =
      Field('etag', _$etag, opt: true);
  static String? _$kind(PlayListItem v) => v.kind;
  static const Field<PlayListItem, String> _f$kind =
      Field('kind', _$kind, opt: true);
  static String? _$nextPageToken(PlayListItem v) => v.nextPageToken;
  static const Field<PlayListItem, String> _f$nextPageToken =
      Field('nextPageToken', _$nextPageToken, opt: true);
  static String? _$prevPageToken(PlayListItem v) => v.prevPageToken;
  static const Field<PlayListItem, String> _f$prevPageToken =
      Field('prevPageToken', _$prevPageToken, opt: true);

  @override
  final MappableFields<PlayListItem> fields = const {
    #pageInfo: _f$pageInfo,
    #items: _f$items,
    #etag: _f$etag,
    #kind: _f$kind,
    #nextPageToken: _f$nextPageToken,
    #prevPageToken: _f$prevPageToken,
  };

  static PlayListItem _instantiate(DecodingData data) {
    return PlayListItem(
        pageInfo: data.dec(_f$pageInfo),
        items: data.dec(_f$items),
        etag: data.dec(_f$etag),
        kind: data.dec(_f$kind),
        nextPageToken: data.dec(_f$nextPageToken),
        prevPageToken: data.dec(_f$prevPageToken));
  }

  @override
  final Function instantiate = _instantiate;

  static PlayListItem fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PlayListItem>(map);
  }

  static PlayListItem fromJsonString(String json) {
    return ensureInitialized().decodeJson<PlayListItem>(json);
  }
}

mixin PlayListItemMappable {
  String toJsonString() {
    return PlayListItemMapper.ensureInitialized()
        .encodeJson<PlayListItem>(this as PlayListItem);
  }

  Map<String, dynamic> toJson() {
    return PlayListItemMapper.ensureInitialized()
        .encodeMap<PlayListItem>(this as PlayListItem);
  }

  PlayListItemCopyWith<PlayListItem, PlayListItem, PlayListItem> get copyWith =>
      _PlayListItemCopyWithImpl(this as PlayListItem, $identity, $identity);
  @override
  String toString() {
    return PlayListItemMapper.ensureInitialized()
        .stringifyValue(this as PlayListItem);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PlayListItemMapper.ensureInitialized()
                .isValueEqual(this as PlayListItem, other));
  }

  @override
  int get hashCode {
    return PlayListItemMapper.ensureInitialized()
        .hashValue(this as PlayListItem);
  }
}

extension PlayListItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PlayListItem, $Out> {
  PlayListItemCopyWith<$R, PlayListItem, $Out> get $asPlayListItem =>
      $base.as((v, t, t2) => _PlayListItemCopyWithImpl(v, t, t2));
}

abstract class PlayListItemCopyWith<$R, $In extends PlayListItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  YoutubePageInfoCopyWith<$R, YoutubePageInfo, YoutubePageInfo>? get pageInfo;
  ListCopyWith<
      $R,
      YoutubePageContent,
      YoutubePageContentCopyWith<$R, YoutubePageContent,
          YoutubePageContent>>? get items;
  $R call(
      {YoutubePageInfo? pageInfo,
      List<YoutubePageContent>? items,
      String? etag,
      String? kind,
      String? nextPageToken,
      String? prevPageToken});
  PlayListItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlayListItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlayListItem, $Out>
    implements PlayListItemCopyWith<$R, PlayListItem, $Out> {
  _PlayListItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlayListItem> $mapper =
      PlayListItemMapper.ensureInitialized();
  @override
  YoutubePageInfoCopyWith<$R, YoutubePageInfo, YoutubePageInfo>? get pageInfo =>
      $value.pageInfo?.copyWith.$chain((v) => call(pageInfo: v));
  @override
  ListCopyWith<
      $R,
      YoutubePageContent,
      YoutubePageContentCopyWith<$R, YoutubePageContent,
          YoutubePageContent>>? get items => $value.items != null
      ? ListCopyWith(
          $value.items!, (v, t) => v.copyWith.$chain(t), (v) => call(items: v))
      : null;
  @override
  $R call(
          {Object? pageInfo = $none,
          Object? items = $none,
          Object? etag = $none,
          Object? kind = $none,
          Object? nextPageToken = $none,
          Object? prevPageToken = $none}) =>
      $apply(FieldCopyWithData({
        if (pageInfo != $none) #pageInfo: pageInfo,
        if (items != $none) #items: items,
        if (etag != $none) #etag: etag,
        if (kind != $none) #kind: kind,
        if (nextPageToken != $none) #nextPageToken: nextPageToken,
        if (prevPageToken != $none) #prevPageToken: prevPageToken
      }));
  @override
  PlayListItem $make(CopyWithData data) => PlayListItem(
      pageInfo: data.get(#pageInfo, or: $value.pageInfo),
      items: data.get(#items, or: $value.items),
      etag: data.get(#etag, or: $value.etag),
      kind: data.get(#kind, or: $value.kind),
      nextPageToken: data.get(#nextPageToken, or: $value.nextPageToken),
      prevPageToken: data.get(#prevPageToken, or: $value.prevPageToken));

  @override
  PlayListItemCopyWith<$R2, PlayListItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlayListItemCopyWithImpl($value, $cast, t);
}

class YoutubePageInfoMapper extends ClassMapperBase<YoutubePageInfo> {
  YoutubePageInfoMapper._();

  static YoutubePageInfoMapper? _instance;
  static YoutubePageInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubePageInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubePageInfo';

  static int? _$resultsPerPage(YoutubePageInfo v) => v.resultsPerPage;
  static const Field<YoutubePageInfo, int> _f$resultsPerPage =
      Field('resultsPerPage', _$resultsPerPage, opt: true);
  static int? _$totalResults(YoutubePageInfo v) => v.totalResults;
  static const Field<YoutubePageInfo, int> _f$totalResults =
      Field('totalResults', _$totalResults, opt: true);

  @override
  final MappableFields<YoutubePageInfo> fields = const {
    #resultsPerPage: _f$resultsPerPage,
    #totalResults: _f$totalResults,
  };

  static YoutubePageInfo _instantiate(DecodingData data) {
    return YoutubePageInfo(
        resultsPerPage: data.dec(_f$resultsPerPage),
        totalResults: data.dec(_f$totalResults));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubePageInfo fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubePageInfo>(map);
  }

  static YoutubePageInfo fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubePageInfo>(json);
  }
}

mixin YoutubePageInfoMappable {
  String toJsonString() {
    return YoutubePageInfoMapper.ensureInitialized()
        .encodeJson<YoutubePageInfo>(this as YoutubePageInfo);
  }

  Map<String, dynamic> toJson() {
    return YoutubePageInfoMapper.ensureInitialized()
        .encodeMap<YoutubePageInfo>(this as YoutubePageInfo);
  }

  YoutubePageInfoCopyWith<YoutubePageInfo, YoutubePageInfo, YoutubePageInfo>
      get copyWith => _YoutubePageInfoCopyWithImpl(
          this as YoutubePageInfo, $identity, $identity);
  @override
  String toString() {
    return YoutubePageInfoMapper.ensureInitialized()
        .stringifyValue(this as YoutubePageInfo);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubePageInfoMapper.ensureInitialized()
                .isValueEqual(this as YoutubePageInfo, other));
  }

  @override
  int get hashCode {
    return YoutubePageInfoMapper.ensureInitialized()
        .hashValue(this as YoutubePageInfo);
  }
}

extension YoutubePageInfoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubePageInfo, $Out> {
  YoutubePageInfoCopyWith<$R, YoutubePageInfo, $Out> get $asYoutubePageInfo =>
      $base.as((v, t, t2) => _YoutubePageInfoCopyWithImpl(v, t, t2));
}

abstract class YoutubePageInfoCopyWith<$R, $In extends YoutubePageInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? resultsPerPage, int? totalResults});
  YoutubePageInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubePageInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubePageInfo, $Out>
    implements YoutubePageInfoCopyWith<$R, YoutubePageInfo, $Out> {
  _YoutubePageInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubePageInfo> $mapper =
      YoutubePageInfoMapper.ensureInitialized();
  @override
  $R call({Object? resultsPerPage = $none, Object? totalResults = $none}) =>
      $apply(FieldCopyWithData({
        if (resultsPerPage != $none) #resultsPerPage: resultsPerPage,
        if (totalResults != $none) #totalResults: totalResults
      }));
  @override
  YoutubePageInfo $make(CopyWithData data) => YoutubePageInfo(
      resultsPerPage: data.get(#resultsPerPage, or: $value.resultsPerPage),
      totalResults: data.get(#totalResults, or: $value.totalResults));

  @override
  YoutubePageInfoCopyWith<$R2, YoutubePageInfo, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YoutubePageInfoCopyWithImpl($value, $cast, t);
}

class YoutubePageContentMapper extends ClassMapperBase<YoutubePageContent> {
  YoutubePageContentMapper._();

  static YoutubePageContentMapper? _instance;
  static YoutubePageContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubePageContentMapper._());
      YoutubeSnippetMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubePageContent';

  static String? _$kind(YoutubePageContent v) => v.kind;
  static const Field<YoutubePageContent, String> _f$kind =
      Field('kind', _$kind, opt: true);
  static YoutubeSnippet? _$snippet(YoutubePageContent v) => v.snippet;
  static const Field<YoutubePageContent, YoutubeSnippet> _f$snippet =
      Field('snippet', _$snippet, opt: true);
  static String? _$id(YoutubePageContent v) => v.id;
  static const Field<YoutubePageContent, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$etag(YoutubePageContent v) => v.etag;
  static const Field<YoutubePageContent, String> _f$etag =
      Field('etag', _$etag, opt: true);

  @override
  final MappableFields<YoutubePageContent> fields = const {
    #kind: _f$kind,
    #snippet: _f$snippet,
    #id: _f$id,
    #etag: _f$etag,
  };

  static YoutubePageContent _instantiate(DecodingData data) {
    return YoutubePageContent(
        kind: data.dec(_f$kind),
        snippet: data.dec(_f$snippet),
        id: data.dec(_f$id),
        etag: data.dec(_f$etag));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubePageContent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubePageContent>(map);
  }

  static YoutubePageContent fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubePageContent>(json);
  }
}

mixin YoutubePageContentMappable {
  String toJsonString() {
    return YoutubePageContentMapper.ensureInitialized()
        .encodeJson<YoutubePageContent>(this as YoutubePageContent);
  }

  Map<String, dynamic> toJson() {
    return YoutubePageContentMapper.ensureInitialized()
        .encodeMap<YoutubePageContent>(this as YoutubePageContent);
  }

  YoutubePageContentCopyWith<YoutubePageContent, YoutubePageContent,
          YoutubePageContent>
      get copyWith => _YoutubePageContentCopyWithImpl(
          this as YoutubePageContent, $identity, $identity);
  @override
  String toString() {
    return YoutubePageContentMapper.ensureInitialized()
        .stringifyValue(this as YoutubePageContent);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubePageContentMapper.ensureInitialized()
                .isValueEqual(this as YoutubePageContent, other));
  }

  @override
  int get hashCode {
    return YoutubePageContentMapper.ensureInitialized()
        .hashValue(this as YoutubePageContent);
  }
}

extension YoutubePageContentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubePageContent, $Out> {
  YoutubePageContentCopyWith<$R, YoutubePageContent, $Out>
      get $asYoutubePageContent =>
          $base.as((v, t, t2) => _YoutubePageContentCopyWithImpl(v, t, t2));
}

abstract class YoutubePageContentCopyWith<$R, $In extends YoutubePageContent,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  YoutubeSnippetCopyWith<$R, YoutubeSnippet, YoutubeSnippet>? get snippet;
  $R call({String? kind, YoutubeSnippet? snippet, String? id, String? etag});
  YoutubePageContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubePageContentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubePageContent, $Out>
    implements YoutubePageContentCopyWith<$R, YoutubePageContent, $Out> {
  _YoutubePageContentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubePageContent> $mapper =
      YoutubePageContentMapper.ensureInitialized();
  @override
  YoutubeSnippetCopyWith<$R, YoutubeSnippet, YoutubeSnippet>? get snippet =>
      $value.snippet?.copyWith.$chain((v) => call(snippet: v));
  @override
  $R call(
          {Object? kind = $none,
          Object? snippet = $none,
          Object? id = $none,
          Object? etag = $none}) =>
      $apply(FieldCopyWithData({
        if (kind != $none) #kind: kind,
        if (snippet != $none) #snippet: snippet,
        if (id != $none) #id: id,
        if (etag != $none) #etag: etag
      }));
  @override
  YoutubePageContent $make(CopyWithData data) => YoutubePageContent(
      kind: data.get(#kind, or: $value.kind),
      snippet: data.get(#snippet, or: $value.snippet),
      id: data.get(#id, or: $value.id),
      etag: data.get(#etag, or: $value.etag));

  @override
  YoutubePageContentCopyWith<$R2, YoutubePageContent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YoutubePageContentCopyWithImpl($value, $cast, t);
}

class YoutubeSnippetMapper extends ClassMapperBase<YoutubeSnippet> {
  YoutubeSnippetMapper._();

  static YoutubeSnippetMapper? _instance;
  static YoutubeSnippetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubeSnippetMapper._());
      YoutubeResourceIdMapper.ensureInitialized();
      YoutubeThumbnailCollectionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubeSnippet';

  static YoutubeResourceId? _$resourceId(YoutubeSnippet v) => v.resourceId;
  static const Field<YoutubeSnippet, YoutubeResourceId> _f$resourceId =
      Field('resourceId', _$resourceId, opt: true);
  static String? _$title(YoutubeSnippet v) => v.title;
  static const Field<YoutubeSnippet, String> _f$title =
      Field('title', _$title, opt: true);
  static String? _$channelId(YoutubeSnippet v) => v.channelId;
  static const Field<YoutubeSnippet, String> _f$channelId =
      Field('channelId', _$channelId, opt: true);
  static String? _$channelTitle(YoutubeSnippet v) => v.channelTitle;
  static const Field<YoutubeSnippet, String> _f$channelTitle =
      Field('channelTitle', _$channelTitle, opt: true);
  static String? _$description(YoutubeSnippet v) => v.description;
  static const Field<YoutubeSnippet, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$playlistId(YoutubeSnippet v) => v.playlistId;
  static const Field<YoutubeSnippet, String> _f$playlistId =
      Field('playlistId', _$playlistId, opt: true);
  static int? _$position(YoutubeSnippet v) => v.position;
  static const Field<YoutubeSnippet, int> _f$position =
      Field('position', _$position, opt: true);
  static String? _$publishedAt(YoutubeSnippet v) => v.publishedAt;
  static const Field<YoutubeSnippet, String> _f$publishedAt =
      Field('publishedAt', _$publishedAt, opt: true);
  static YoutubeThumbnailCollection? _$thumbnails(YoutubeSnippet v) =>
      v.thumbnails;
  static const Field<YoutubeSnippet, YoutubeThumbnailCollection> _f$thumbnails =
      Field('thumbnails', _$thumbnails, opt: true);
  static String? _$videoOwnerChannelId(YoutubeSnippet v) =>
      v.videoOwnerChannelId;
  static const Field<YoutubeSnippet, String> _f$videoOwnerChannelId =
      Field('videoOwnerChannelId', _$videoOwnerChannelId, opt: true);
  static String? _$videoOwnerChannelTitle(YoutubeSnippet v) =>
      v.videoOwnerChannelTitle;
  static const Field<YoutubeSnippet, String> _f$videoOwnerChannelTitle =
      Field('videoOwnerChannelTitle', _$videoOwnerChannelTitle, opt: true);

  @override
  final MappableFields<YoutubeSnippet> fields = const {
    #resourceId: _f$resourceId,
    #title: _f$title,
    #channelId: _f$channelId,
    #channelTitle: _f$channelTitle,
    #description: _f$description,
    #playlistId: _f$playlistId,
    #position: _f$position,
    #publishedAt: _f$publishedAt,
    #thumbnails: _f$thumbnails,
    #videoOwnerChannelId: _f$videoOwnerChannelId,
    #videoOwnerChannelTitle: _f$videoOwnerChannelTitle,
  };

  static YoutubeSnippet _instantiate(DecodingData data) {
    return YoutubeSnippet(
        resourceId: data.dec(_f$resourceId),
        title: data.dec(_f$title),
        channelId: data.dec(_f$channelId),
        channelTitle: data.dec(_f$channelTitle),
        description: data.dec(_f$description),
        playlistId: data.dec(_f$playlistId),
        position: data.dec(_f$position),
        publishedAt: data.dec(_f$publishedAt),
        thumbnails: data.dec(_f$thumbnails),
        videoOwnerChannelId: data.dec(_f$videoOwnerChannelId),
        videoOwnerChannelTitle: data.dec(_f$videoOwnerChannelTitle));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubeSnippet fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubeSnippet>(map);
  }

  static YoutubeSnippet fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubeSnippet>(json);
  }
}

mixin YoutubeSnippetMappable {
  String toJsonString() {
    return YoutubeSnippetMapper.ensureInitialized()
        .encodeJson<YoutubeSnippet>(this as YoutubeSnippet);
  }

  Map<String, dynamic> toJson() {
    return YoutubeSnippetMapper.ensureInitialized()
        .encodeMap<YoutubeSnippet>(this as YoutubeSnippet);
  }

  YoutubeSnippetCopyWith<YoutubeSnippet, YoutubeSnippet, YoutubeSnippet>
      get copyWith => _YoutubeSnippetCopyWithImpl(
          this as YoutubeSnippet, $identity, $identity);
  @override
  String toString() {
    return YoutubeSnippetMapper.ensureInitialized()
        .stringifyValue(this as YoutubeSnippet);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubeSnippetMapper.ensureInitialized()
                .isValueEqual(this as YoutubeSnippet, other));
  }

  @override
  int get hashCode {
    return YoutubeSnippetMapper.ensureInitialized()
        .hashValue(this as YoutubeSnippet);
  }
}

extension YoutubeSnippetValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubeSnippet, $Out> {
  YoutubeSnippetCopyWith<$R, YoutubeSnippet, $Out> get $asYoutubeSnippet =>
      $base.as((v, t, t2) => _YoutubeSnippetCopyWithImpl(v, t, t2));
}

abstract class YoutubeSnippetCopyWith<$R, $In extends YoutubeSnippet, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  YoutubeResourceIdCopyWith<$R, YoutubeResourceId, YoutubeResourceId>?
      get resourceId;
  YoutubeThumbnailCollectionCopyWith<$R, YoutubeThumbnailCollection,
      YoutubeThumbnailCollection>? get thumbnails;
  $R call(
      {YoutubeResourceId? resourceId,
      String? title,
      String? channelId,
      String? channelTitle,
      String? description,
      String? playlistId,
      int? position,
      String? publishedAt,
      YoutubeThumbnailCollection? thumbnails,
      String? videoOwnerChannelId,
      String? videoOwnerChannelTitle});
  YoutubeSnippetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubeSnippetCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubeSnippet, $Out>
    implements YoutubeSnippetCopyWith<$R, YoutubeSnippet, $Out> {
  _YoutubeSnippetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubeSnippet> $mapper =
      YoutubeSnippetMapper.ensureInitialized();
  @override
  YoutubeResourceIdCopyWith<$R, YoutubeResourceId, YoutubeResourceId>?
      get resourceId =>
          $value.resourceId?.copyWith.$chain((v) => call(resourceId: v));
  @override
  YoutubeThumbnailCollectionCopyWith<$R, YoutubeThumbnailCollection,
          YoutubeThumbnailCollection>?
      get thumbnails =>
          $value.thumbnails?.copyWith.$chain((v) => call(thumbnails: v));
  @override
  $R call(
          {Object? resourceId = $none,
          Object? title = $none,
          Object? channelId = $none,
          Object? channelTitle = $none,
          Object? description = $none,
          Object? playlistId = $none,
          Object? position = $none,
          Object? publishedAt = $none,
          Object? thumbnails = $none,
          Object? videoOwnerChannelId = $none,
          Object? videoOwnerChannelTitle = $none}) =>
      $apply(FieldCopyWithData({
        if (resourceId != $none) #resourceId: resourceId,
        if (title != $none) #title: title,
        if (channelId != $none) #channelId: channelId,
        if (channelTitle != $none) #channelTitle: channelTitle,
        if (description != $none) #description: description,
        if (playlistId != $none) #playlistId: playlistId,
        if (position != $none) #position: position,
        if (publishedAt != $none) #publishedAt: publishedAt,
        if (thumbnails != $none) #thumbnails: thumbnails,
        if (videoOwnerChannelId != $none)
          #videoOwnerChannelId: videoOwnerChannelId,
        if (videoOwnerChannelTitle != $none)
          #videoOwnerChannelTitle: videoOwnerChannelTitle
      }));
  @override
  YoutubeSnippet $make(CopyWithData data) => YoutubeSnippet(
      resourceId: data.get(#resourceId, or: $value.resourceId),
      title: data.get(#title, or: $value.title),
      channelId: data.get(#channelId, or: $value.channelId),
      channelTitle: data.get(#channelTitle, or: $value.channelTitle),
      description: data.get(#description, or: $value.description),
      playlistId: data.get(#playlistId, or: $value.playlistId),
      position: data.get(#position, or: $value.position),
      publishedAt: data.get(#publishedAt, or: $value.publishedAt),
      thumbnails: data.get(#thumbnails, or: $value.thumbnails),
      videoOwnerChannelId:
          data.get(#videoOwnerChannelId, or: $value.videoOwnerChannelId),
      videoOwnerChannelTitle:
          data.get(#videoOwnerChannelTitle, or: $value.videoOwnerChannelTitle));

  @override
  YoutubeSnippetCopyWith<$R2, YoutubeSnippet, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YoutubeSnippetCopyWithImpl($value, $cast, t);
}

class YoutubeResourceIdMapper extends ClassMapperBase<YoutubeResourceId> {
  YoutubeResourceIdMapper._();

  static YoutubeResourceIdMapper? _instance;
  static YoutubeResourceIdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubeResourceIdMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubeResourceId';

  static String? _$kind(YoutubeResourceId v) => v.kind;
  static const Field<YoutubeResourceId, String> _f$kind =
      Field('kind', _$kind, opt: true);
  static String? _$videoId(YoutubeResourceId v) => v.videoId;
  static const Field<YoutubeResourceId, String> _f$videoId =
      Field('videoId', _$videoId, opt: true);

  @override
  final MappableFields<YoutubeResourceId> fields = const {
    #kind: _f$kind,
    #videoId: _f$videoId,
  };

  static YoutubeResourceId _instantiate(DecodingData data) {
    return YoutubeResourceId(
        kind: data.dec(_f$kind), videoId: data.dec(_f$videoId));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubeResourceId fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubeResourceId>(map);
  }

  static YoutubeResourceId fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubeResourceId>(json);
  }
}

mixin YoutubeResourceIdMappable {
  String toJsonString() {
    return YoutubeResourceIdMapper.ensureInitialized()
        .encodeJson<YoutubeResourceId>(this as YoutubeResourceId);
  }

  Map<String, dynamic> toJson() {
    return YoutubeResourceIdMapper.ensureInitialized()
        .encodeMap<YoutubeResourceId>(this as YoutubeResourceId);
  }

  YoutubeResourceIdCopyWith<YoutubeResourceId, YoutubeResourceId,
          YoutubeResourceId>
      get copyWith => _YoutubeResourceIdCopyWithImpl(
          this as YoutubeResourceId, $identity, $identity);
  @override
  String toString() {
    return YoutubeResourceIdMapper.ensureInitialized()
        .stringifyValue(this as YoutubeResourceId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubeResourceIdMapper.ensureInitialized()
                .isValueEqual(this as YoutubeResourceId, other));
  }

  @override
  int get hashCode {
    return YoutubeResourceIdMapper.ensureInitialized()
        .hashValue(this as YoutubeResourceId);
  }
}

extension YoutubeResourceIdValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubeResourceId, $Out> {
  YoutubeResourceIdCopyWith<$R, YoutubeResourceId, $Out>
      get $asYoutubeResourceId =>
          $base.as((v, t, t2) => _YoutubeResourceIdCopyWithImpl(v, t, t2));
}

abstract class YoutubeResourceIdCopyWith<$R, $In extends YoutubeResourceId,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? kind, String? videoId});
  YoutubeResourceIdCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubeResourceIdCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubeResourceId, $Out>
    implements YoutubeResourceIdCopyWith<$R, YoutubeResourceId, $Out> {
  _YoutubeResourceIdCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubeResourceId> $mapper =
      YoutubeResourceIdMapper.ensureInitialized();
  @override
  $R call({Object? kind = $none, Object? videoId = $none}) =>
      $apply(FieldCopyWithData({
        if (kind != $none) #kind: kind,
        if (videoId != $none) #videoId: videoId
      }));
  @override
  YoutubeResourceId $make(CopyWithData data) => YoutubeResourceId(
      kind: data.get(#kind, or: $value.kind),
      videoId: data.get(#videoId, or: $value.videoId));

  @override
  YoutubeResourceIdCopyWith<$R2, YoutubeResourceId, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YoutubeResourceIdCopyWithImpl($value, $cast, t);
}

class YoutubeThumbnailCollectionMapper
    extends ClassMapperBase<YoutubeThumbnailCollection> {
  YoutubeThumbnailCollectionMapper._();

  static YoutubeThumbnailCollectionMapper? _instance;
  static YoutubeThumbnailCollectionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = YoutubeThumbnailCollectionMapper._());
      YoutubeThumbnailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubeThumbnailCollection';

  static YoutubeThumbnail? _$defaultThumb(YoutubeThumbnailCollection v) =>
      v.defaultThumb;
  static const Field<YoutubeThumbnailCollection, YoutubeThumbnail>
      _f$defaultThumb =
      Field('defaultThumb', _$defaultThumb, key: 'default', opt: true);
  static YoutubeThumbnail? _$high(YoutubeThumbnailCollection v) => v.high;
  static const Field<YoutubeThumbnailCollection, YoutubeThumbnail> _f$high =
      Field('high', _$high, opt: true);
  static YoutubeThumbnail? _$maxres(YoutubeThumbnailCollection v) => v.maxres;
  static const Field<YoutubeThumbnailCollection, YoutubeThumbnail> _f$maxres =
      Field('maxres', _$maxres, opt: true);
  static YoutubeThumbnail? _$medium(YoutubeThumbnailCollection v) => v.medium;
  static const Field<YoutubeThumbnailCollection, YoutubeThumbnail> _f$medium =
      Field('medium', _$medium, opt: true);
  static YoutubeThumbnail? _$standard(YoutubeThumbnailCollection v) =>
      v.standard;
  static const Field<YoutubeThumbnailCollection, YoutubeThumbnail> _f$standard =
      Field('standard', _$standard, opt: true);

  @override
  final MappableFields<YoutubeThumbnailCollection> fields = const {
    #defaultThumb: _f$defaultThumb,
    #high: _f$high,
    #maxres: _f$maxres,
    #medium: _f$medium,
    #standard: _f$standard,
  };

  static YoutubeThumbnailCollection _instantiate(DecodingData data) {
    return YoutubeThumbnailCollection(
        defaultThumb: data.dec(_f$defaultThumb),
        high: data.dec(_f$high),
        maxres: data.dec(_f$maxres),
        medium: data.dec(_f$medium),
        standard: data.dec(_f$standard));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubeThumbnailCollection fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubeThumbnailCollection>(map);
  }

  static YoutubeThumbnailCollection fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubeThumbnailCollection>(json);
  }
}

mixin YoutubeThumbnailCollectionMappable {
  String toJsonString() {
    return YoutubeThumbnailCollectionMapper.ensureInitialized()
        .encodeJson<YoutubeThumbnailCollection>(
            this as YoutubeThumbnailCollection);
  }

  Map<String, dynamic> toJson() {
    return YoutubeThumbnailCollectionMapper.ensureInitialized()
        .encodeMap<YoutubeThumbnailCollection>(
            this as YoutubeThumbnailCollection);
  }

  YoutubeThumbnailCollectionCopyWith<YoutubeThumbnailCollection,
          YoutubeThumbnailCollection, YoutubeThumbnailCollection>
      get copyWith => _YoutubeThumbnailCollectionCopyWithImpl(
          this as YoutubeThumbnailCollection, $identity, $identity);
  @override
  String toString() {
    return YoutubeThumbnailCollectionMapper.ensureInitialized()
        .stringifyValue(this as YoutubeThumbnailCollection);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubeThumbnailCollectionMapper.ensureInitialized()
                .isValueEqual(this as YoutubeThumbnailCollection, other));
  }

  @override
  int get hashCode {
    return YoutubeThumbnailCollectionMapper.ensureInitialized()
        .hashValue(this as YoutubeThumbnailCollection);
  }
}

extension YoutubeThumbnailCollectionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubeThumbnailCollection, $Out> {
  YoutubeThumbnailCollectionCopyWith<$R, YoutubeThumbnailCollection, $Out>
      get $asYoutubeThumbnailCollection => $base
          .as((v, t, t2) => _YoutubeThumbnailCollectionCopyWithImpl(v, t, t2));
}

abstract class YoutubeThumbnailCollectionCopyWith<
    $R,
    $In extends YoutubeThumbnailCollection,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>?
      get defaultThumb;
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>? get high;
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>? get maxres;
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>? get medium;
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>?
      get standard;
  $R call(
      {YoutubeThumbnail? defaultThumb,
      YoutubeThumbnail? high,
      YoutubeThumbnail? maxres,
      YoutubeThumbnail? medium,
      YoutubeThumbnail? standard});
  YoutubeThumbnailCollectionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubeThumbnailCollectionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubeThumbnailCollection, $Out>
    implements
        YoutubeThumbnailCollectionCopyWith<$R, YoutubeThumbnailCollection,
            $Out> {
  _YoutubeThumbnailCollectionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubeThumbnailCollection> $mapper =
      YoutubeThumbnailCollectionMapper.ensureInitialized();
  @override
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>?
      get defaultThumb =>
          $value.defaultThumb?.copyWith.$chain((v) => call(defaultThumb: v));
  @override
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>? get high =>
      $value.high?.copyWith.$chain((v) => call(high: v));
  @override
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>?
      get maxres => $value.maxres?.copyWith.$chain((v) => call(maxres: v));
  @override
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>?
      get medium => $value.medium?.copyWith.$chain((v) => call(medium: v));
  @override
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, YoutubeThumbnail>?
      get standard =>
          $value.standard?.copyWith.$chain((v) => call(standard: v));
  @override
  $R call(
          {Object? defaultThumb = $none,
          Object? high = $none,
          Object? maxres = $none,
          Object? medium = $none,
          Object? standard = $none}) =>
      $apply(FieldCopyWithData({
        if (defaultThumb != $none) #defaultThumb: defaultThumb,
        if (high != $none) #high: high,
        if (maxres != $none) #maxres: maxres,
        if (medium != $none) #medium: medium,
        if (standard != $none) #standard: standard
      }));
  @override
  YoutubeThumbnailCollection $make(CopyWithData data) =>
      YoutubeThumbnailCollection(
          defaultThumb: data.get(#defaultThumb, or: $value.defaultThumb),
          high: data.get(#high, or: $value.high),
          maxres: data.get(#maxres, or: $value.maxres),
          medium: data.get(#medium, or: $value.medium),
          standard: data.get(#standard, or: $value.standard));

  @override
  YoutubeThumbnailCollectionCopyWith<$R2, YoutubeThumbnailCollection, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _YoutubeThumbnailCollectionCopyWithImpl($value, $cast, t);
}

class YoutubeThumbnailMapper extends ClassMapperBase<YoutubeThumbnail> {
  YoutubeThumbnailMapper._();

  static YoutubeThumbnailMapper? _instance;
  static YoutubeThumbnailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YoutubeThumbnailMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'YoutubeThumbnail';

  static int? _$height(YoutubeThumbnail v) => v.height;
  static const Field<YoutubeThumbnail, int> _f$height =
      Field('height', _$height, opt: true);
  static String? _$url(YoutubeThumbnail v) => v.url;
  static const Field<YoutubeThumbnail, String> _f$url =
      Field('url', _$url, opt: true);
  static int? _$width(YoutubeThumbnail v) => v.width;
  static const Field<YoutubeThumbnail, int> _f$width =
      Field('width', _$width, opt: true);

  @override
  final MappableFields<YoutubeThumbnail> fields = const {
    #height: _f$height,
    #url: _f$url,
    #width: _f$width,
  };

  static YoutubeThumbnail _instantiate(DecodingData data) {
    return YoutubeThumbnail(
        height: data.dec(_f$height),
        url: data.dec(_f$url),
        width: data.dec(_f$width));
  }

  @override
  final Function instantiate = _instantiate;

  static YoutubeThumbnail fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YoutubeThumbnail>(map);
  }

  static YoutubeThumbnail fromJsonString(String json) {
    return ensureInitialized().decodeJson<YoutubeThumbnail>(json);
  }
}

mixin YoutubeThumbnailMappable {
  String toJsonString() {
    return YoutubeThumbnailMapper.ensureInitialized()
        .encodeJson<YoutubeThumbnail>(this as YoutubeThumbnail);
  }

  Map<String, dynamic> toJson() {
    return YoutubeThumbnailMapper.ensureInitialized()
        .encodeMap<YoutubeThumbnail>(this as YoutubeThumbnail);
  }

  YoutubeThumbnailCopyWith<YoutubeThumbnail, YoutubeThumbnail, YoutubeThumbnail>
      get copyWith => _YoutubeThumbnailCopyWithImpl(
          this as YoutubeThumbnail, $identity, $identity);
  @override
  String toString() {
    return YoutubeThumbnailMapper.ensureInitialized()
        .stringifyValue(this as YoutubeThumbnail);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            YoutubeThumbnailMapper.ensureInitialized()
                .isValueEqual(this as YoutubeThumbnail, other));
  }

  @override
  int get hashCode {
    return YoutubeThumbnailMapper.ensureInitialized()
        .hashValue(this as YoutubeThumbnail);
  }
}

extension YoutubeThumbnailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, YoutubeThumbnail, $Out> {
  YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, $Out>
      get $asYoutubeThumbnail =>
          $base.as((v, t, t2) => _YoutubeThumbnailCopyWithImpl(v, t, t2));
}

abstract class YoutubeThumbnailCopyWith<$R, $In extends YoutubeThumbnail, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? height, String? url, int? width});
  YoutubeThumbnailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _YoutubeThumbnailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, YoutubeThumbnail, $Out>
    implements YoutubeThumbnailCopyWith<$R, YoutubeThumbnail, $Out> {
  _YoutubeThumbnailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YoutubeThumbnail> $mapper =
      YoutubeThumbnailMapper.ensureInitialized();
  @override
  $R call(
          {Object? height = $none,
          Object? url = $none,
          Object? width = $none}) =>
      $apply(FieldCopyWithData({
        if (height != $none) #height: height,
        if (url != $none) #url: url,
        if (width != $none) #width: width
      }));
  @override
  YoutubeThumbnail $make(CopyWithData data) => YoutubeThumbnail(
      height: data.get(#height, or: $value.height),
      url: data.get(#url, or: $value.url),
      width: data.get(#width, or: $value.width));

  @override
  YoutubeThumbnailCopyWith<$R2, YoutubeThumbnail, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _YoutubeThumbnailCopyWithImpl($value, $cast, t);
}
