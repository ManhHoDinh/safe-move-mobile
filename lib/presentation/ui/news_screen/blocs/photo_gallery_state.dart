part of 'photo_gallery_cubit.dart';

class PhotoGalleryState extends InfiniteLoaderState<PostResponse> {
  const PhotoGalleryState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    this.postLanguage,
    this.filterSgmNewsType,
  });

  final PostLanguage? postLanguage;
  final FilterSgmNewsType? filterSgmNewsType;

  @override
  InfiniteLoaderState<PostResponse> loadingManagementStateChanged({
    List<PostResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return PhotoGalleryState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      postLanguage: postLanguage,
      filterSgmNewsType: filterSgmNewsType,
    );
  }

  PhotoGalleryState unsetPostLanguage() {
    return PhotoGalleryState(
      data: data,
      isFirstLoad: isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      filterSgmNewsType: filterSgmNewsType,
    );
  }

  PhotoGalleryState unsetPostFilter() {
    return PhotoGalleryState(
      data: data,
      isFirstLoad: isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      postLanguage: postLanguage,
    );
  }

  PhotoGalleryState copyWith({
    FilterSgmNewsType? filterSgmNewsType,
    PostLanguage? postLanguage,
    List<PostResponse>? data,
  }) {
    return PhotoGalleryState(
      data: data ?? this.data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      postLanguage: postLanguage ?? this.postLanguage,
      filterSgmNewsType: filterSgmNewsType ?? this.filterSgmNewsType,
    );
  }
}
