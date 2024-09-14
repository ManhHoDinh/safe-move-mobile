import '../../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_community/controller/controller.dart';
import '../../../../application/services/post_curator/controller/controller.dart';
import '../../../../application/services/post_sgm_news/controller/controller.dart';
import '../../../../application/services/user_post_reaction/controller/controller.dart';
import '../../../../application/services/user_post_reaction/request/request.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends SafeCubit<PostsDetailsState> {
  PostDetailsCubit({
    required this.failureHandlerManager,
    required this.postType,
    required this.postSgmNewsController,
    required this.postCuratorController,
    required this.postCommunityController,
    required this.id,
    required this.userPostReactionController,
    required this.adminPostCuratorController,
    required this.adminPostSgmNewsController,
    required this.loadingManager,
  }) : super(const PostsDetailsState()) {
    reload();
  }

  final FailureHandlerManager failureHandlerManager;
  final PostType postType;
  final PostCommunityController postCommunityController;
  final PostCuratorController postCuratorController;
  final PostSgmNewsController postSgmNewsController;
  final UserPostReactionController userPostReactionController;
  final AdminPostCuratorController adminPostCuratorController;
  final AdminPostSgmNewsController adminPostSgmNewsController;
  final LoadingManager loadingManager;
  final int id;

  void reactToggle() {
    if (state.isReacted) {
      emit(state.copyWith(
          isReacted: false, reactionCount: state.reactionCount - 1));
      userPostReactionController.reactPost(
          postId: id, request: const PostReactionRequest(isReact: false));
    } else {
      emit(state.copyWith(
          isReacted: true, reactionCount: state.reactionCount + 1));
      userPostReactionController.reactPost(
          postId: id, request: const PostReactionRequest(isReact: true));
    }
  }

  void reload() async {
    if (state.apiStatus == ApiStatus.loading) {
      return;
    }
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    Result<Failure, PostResponse> postResponse;

    switch (postType) {
      case PostType.COMMUNITY:
        postResponse =
            await postCommunityController.getCommunityPostById(id: id);
        break;
      case PostType.CURATOR:
        postResponse = await postCuratorController.getCuratorPostById(id: id);
        break;
      case PostType.SGM_NEWS:
        postResponse = await postSgmNewsController.getPostSgmNewsById(id: id);
        break;
    }

    postResponse.handleLeft((value) {
      emit(state.copyWith(apiStatus: ApiStatus.fail));
      failureHandlerManager.handle(value);
    });
    postResponse.handleRight((value) {
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        postResponse: value,
        isReacted: value.isReacted,
        reactionCount: value.reactionCounter,
      ));
    });
  }

  void deletePost() async {
    Result<Failure, SuccessResponse> deletePostResult;
    switch (postType) {
      case PostType.COMMUNITY:
        deletePostResult = await loadingManager.startLoading(
            future: postCommunityController.deleteCommunityPost(id: id));

        break;
      case PostType.CURATOR:
        deletePostResult = await loadingManager.startLoading(
            future: adminPostCuratorController.deleteCuratorPost(id: id));

        break;
      case PostType.SGM_NEWS:
        deletePostResult = await loadingManager.startLoading(
            future: adminPostSgmNewsController.deleteSgmNewsPost(id: id));
        break;
    }

    deletePostResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    deletePostResult.handleRight((value) {
      emit(state.copyWith(postDeleted: true));
    });
  }

  void reportPost() async {
    Result<Failure, SuccessResponse> reportPostResult;
    reportPostResult = await loadingManager.startLoading(
        future: postCommunityController.reportCommunityPost(id: id));

    reportPostResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
  }
}
