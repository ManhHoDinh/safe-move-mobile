import '../../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'youtube_video_internal_state.dart';

class YoutubeVideoInternalCubit
    extends InfiniteLoaderCubit<YoutubeVideoInternalState, YoutubeResponse> {
  YoutubeVideoInternalCubit({
    required super.failureHandlerManager,
    required this.loadingManager,
    required this.youtubeVideoController,
  }) : super(initialState: const YoutubeVideoInternalState());

  final YoutubeVideoController youtubeVideoController;
  final LoadingManager loadingManager;

  void changeVideoTypeFilter(YoutubeVideoType videoType) {
    YoutubeVideoInternalState currentState = state;
    if (videoType == currentState.youtubeVideoType) {
      currentState = currentState.unsetTypeFilter();
    } else {
      currentState = currentState.copyWith(youtubeVideoType: videoType);
    }
    emit(currentState);
    reload();
  }

  void changeSortOrderFilter(YoutubeVideoSort youtubeVideoSort) {
    YoutubeVideoInternalState currentState = state;
    if (youtubeVideoSort == currentState.youtubeVideoSort) {
      return;
    } else {
      currentState = currentState.copyWith(youtubeVideoSort: youtubeVideoSort);
    }
    emit(currentState);
    reload();
  }

  @override
  Future<Result<Failure, PageableData<YoutubeResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await youtubeVideoController.getPlayList(
      size: pageSize,
      page: page,
      keyword: searchText,
      youtubeVideoType: state.youtubeVideoType,
      sort: state.youtubeVideoSort,
    );
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        return PageableData(
          totalItems: value.totalElements ?? 0,
          totalPages: totalPages,
          data: data,
        );
      },
    );
  }
}
