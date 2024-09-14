import '../../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'photo_gallery_state.dart';

class PhotoGalleryCubit
    extends InfiniteLoaderCubit<PhotoGalleryState, PostResponse> {
  PhotoGalleryCubit({
    required super.failureHandlerManager,
    required this.postSgmNewsController,
    required this.loadingManager,
    required this.adminPostCuratorController,
  }) : super(initialState: const PhotoGalleryState());

  final PostSgmNewsController postSgmNewsController;
  final LoadingManager loadingManager;
  final AdminPostSgmNewsController adminPostCuratorController;

  void changePostsLanguage(PostLanguage postLanguage) {
    PhotoGalleryState currentState = state;
    if (postLanguage == currentState.postLanguage) {
      currentState = currentState.unsetPostLanguage();
    } else {
      currentState = currentState.copyWith(postLanguage: postLanguage);
    }
    emit(currentState);
    reload();
  }

  void changePostsFilter(FilterSgmNewsType filterSgmNewsType) {
    PhotoGalleryState currentState = state;
    if (filterSgmNewsType == currentState.filterSgmNewsType) {
      currentState = currentState.unsetPostFilter();
    } else {
      currentState =
          currentState.copyWith(filterSgmNewsType: filterSgmNewsType);
    }
    emit(currentState);
    reload();
  }

  void deletePost(int index) async {
    final int postId = state.data[index].id ?? 0;
    final deletePostResult = await loadingManager.startLoading(
        future: adminPostCuratorController.deleteSgmNewsPost(id: postId));

    deletePostResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });

    deletePostResult.handleRight((value) {
      final currentPosts = List<PostResponse>.from(state.data);
      currentPosts.removeAt(index);
      emit(state.copyWith(data: currentPosts));
    });
  }

  @override
  Future<Result<Failure, PageableData<PostResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await postSgmNewsController.getPostSgmNews(
      size: pageSize,
      page: page,
      keyword: searchText,
      postLanguage: state.postLanguage,
      filter: state.filterSgmNewsType,
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
