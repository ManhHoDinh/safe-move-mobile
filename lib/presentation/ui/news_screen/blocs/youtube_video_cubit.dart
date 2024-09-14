import '../../../../application/services/youtube_client_service/play_list_item_response.dart';
import '../../../../application/services/youtube_client_service/youtube_client_service.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

class YoutubeVideoState extends InfiniteLoaderState<YoutubePageContent> {
  const YoutubeVideoState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
  });

  @override
  InfiniteLoaderState<YoutubePageContent> loadingManagementStateChanged({
    List<YoutubePageContent>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return YoutubeVideoState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
    );
  }
}

class YoutubeVideoCubit
    extends InfiniteLoaderCubit<YoutubeVideoState, YoutubePageContent> {
  YoutubeVideoCubit({
    required super.failureHandlerManager,
    required this.youtubeClientService,
  }) : super(initialState: const YoutubeVideoState());

  String? _nextPageToken;
  final YoutubeClientService youtubeClientService;

  @override
  void more() {
    if (state.infiniteLoadingStatus == ApiStatus.loading) {
      return;
    }
    if (_nextPageToken == null) {
      return;
    }
    super.more();
  }

  @override
  Future<Result<Failure, PageableData<YoutubePageContent>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await youtubeClientService.getPlayList(
      pageToken: _nextPageToken,
      maxResults: pageSize,
    );
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        _nextPageToken = value.nextPageToken;
        final totalPages = (value.pageInfo?.totalResults ?? 0) /
            (value.pageInfo?.resultsPerPage ?? pageSize);
        final data = value.items ?? [];
        return PageableData(
          totalPages: totalPages.floor(),
          data: data,
        );
      },
    );
  }
}
