part of 'youtube_video_internal_cubit.dart';

class YoutubeVideoInternalState extends InfiniteLoaderState<YoutubeResponse> {
  const YoutubeVideoInternalState({
    super.data,
    super.isFirstLoad,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    this.youtubeVideoType,
    this.youtubeVideoSort = YoutubeVideoSort.LATEST,
  });

  final YoutubeVideoType? youtubeVideoType;
  final YoutubeVideoSort youtubeVideoSort;

  @override
  InfiniteLoaderState<YoutubeResponse> loadingManagementStateChanged({
    List<YoutubeResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return YoutubeVideoInternalState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      youtubeVideoType: youtubeVideoType,
      youtubeVideoSort: youtubeVideoSort,
    );
  }

  YoutubeVideoInternalState unsetTypeFilter() {
    return YoutubeVideoInternalState(
      data: data,
      isFirstLoad: isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      youtubeVideoSort: youtubeVideoSort,
    );
  }

  YoutubeVideoInternalState copyWith({
    YoutubeVideoType? youtubeVideoType,
    YoutubeVideoSort? youtubeVideoSort,
  }) {
    return YoutubeVideoInternalState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      youtubeVideoSort: youtubeVideoSort ?? this.youtubeVideoSort,
      youtubeVideoType: youtubeVideoType ?? this.youtubeVideoType,
    );
  }
}
