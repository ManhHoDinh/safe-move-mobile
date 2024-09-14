import 'package:dart_mappable/dart_mappable.dart';

part 'play_list_item_response.mapper.dart';

@MappableClass()
class PlayListItem with PlayListItemMappable {
  const PlayListItem({
    this.pageInfo,
    this.items,
    this.etag,
    this.kind,
    this.nextPageToken,
    this.prevPageToken,
  });

  factory PlayListItem.fromJson(Map<String, dynamic> json) =>
      PlayListItemMapper.fromJson(json);

  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final List<YoutubePageContent>? items;
  final YoutubePageInfo? pageInfo;
}

@MappableClass()
class YoutubePageContent with YoutubePageContentMappable {
  const YoutubePageContent({
    this.kind,
    this.snippet,
    this.id,
    this.etag,
  });

  factory YoutubePageContent.fromJson(Map<String, dynamic> json) =>
      YoutubePageContentMapper.fromJson(json);

  final String? kind;
  final String? id;
  final String? etag;
  final YoutubeSnippet? snippet;
}

@MappableClass()
class YoutubeSnippet with YoutubeSnippetMappable {
  const YoutubeSnippet({
    this.resourceId,
    this.title,
    this.channelId,
    this.channelTitle,
    this.description,
    this.playlistId,
    this.position,
    this.publishedAt,
    this.thumbnails,
    this.videoOwnerChannelId,
    this.videoOwnerChannelTitle,
  });
  factory YoutubeSnippet.fromJson(Map<String, dynamic> json) =>
      YoutubeSnippetMapper.fromJson(json);

  final String? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final YoutubeThumbnailCollection? thumbnails;
  final String? channelTitle;
  final String? playlistId;
  final int? position;
  final String? videoOwnerChannelTitle;
  final String? videoOwnerChannelId;
  final YoutubeResourceId? resourceId;
}

@MappableClass()
class YoutubeResourceId with YoutubeResourceIdMappable {
  const YoutubeResourceId({
    this.kind,
    this.videoId,
  });

  factory YoutubeResourceId.fromJson(Map<String, dynamic> json) =>
      YoutubeResourceIdMapper.fromJson(json);

  final String? kind;
  final String? videoId;
}

@MappableClass()
class YoutubeThumbnailCollection with YoutubeThumbnailCollectionMappable {
  const YoutubeThumbnailCollection({
    this.defaultThumb,
    this.high,
    this.maxres,
    this.medium,
    this.standard,
  });

  factory YoutubeThumbnailCollection.fromJson(Map<String, dynamic> json) =>
      YoutubeThumbnailCollectionMapper.fromJson(json);

  @MappableField(key: 'default')
  final YoutubeThumbnail? defaultThumb;
  final YoutubeThumbnail? medium;
  final YoutubeThumbnail? high;
  final YoutubeThumbnail? standard;
  final YoutubeThumbnail? maxres;
}

@MappableClass()
class YoutubeThumbnail with YoutubeThumbnailMappable {
  const YoutubeThumbnail({
    this.height,
    this.url,
    this.width,
  });

  factory YoutubeThumbnail.fromJson(Map<String, dynamic> json) =>
      YoutubeThumbnailMapper.fromJson(json);

  final String? url;
  final int? width;
  final int? height;
}

@MappableClass()
class YoutubePageInfo with YoutubePageInfoMappable {
  const YoutubePageInfo({
    this.resultsPerPage,
    this.totalResults,
  });

  factory YoutubePageInfo.fromJson(Map<String, dynamic> json) =>
      YoutubePageInfoMapper.fromJson(json);

  final int? totalResults;
  final int? resultsPerPage;
}
