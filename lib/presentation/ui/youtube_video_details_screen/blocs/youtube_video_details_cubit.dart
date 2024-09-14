import '../../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'youtube_video_details_state.dart';

class YoutubeVideoDetailsCubit extends SafeCubit<YoutubeVideoDetailsState> {
  YoutubeVideoDetailsCubit({
    required this.failureHandlerManager,
    required this.id,
    required this.loadingManager,
    required this.youtubeVideoController,
  }) : super(const YoutubeVideoDetailsState()) {
    reload();
  }

  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final YoutubeVideoController youtubeVideoController;
  final int id;

  void reactToggle() {
    if (state.isReacted) {
      emit(state.copyWith(
          isReacted: false, reactionCount: state.reactionCount - 1));
      youtubeVideoController.reactYoutubeVideo(
          id: id, request: const ReactionRequest(isReact: false));
    } else {
      emit(state.copyWith(
          isReacted: true, reactionCount: state.reactionCount + 1));
      youtubeVideoController.reactYoutubeVideo(
          id: id, request: const ReactionRequest(isReact: true));
    }
  }

  void reload() async {
    if (state.apiStatus == ApiStatus.loading) {
      return;
    }
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final Result<Failure, YoutubeResponse> youtubeResponse =
        await youtubeVideoController.getYoutubeVideoById(id: id);

    youtubeResponse.handleLeft((value) {
      emit(state.copyWith(apiStatus: ApiStatus.fail));
      failureHandlerManager.handle(value);
    });
    youtubeResponse.handleRight((value) {
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        youtubeResponse: value,
        isReacted: value.isReacted,
        reactionCount: value.reactionCounter,
      ));
    });
  }
}
