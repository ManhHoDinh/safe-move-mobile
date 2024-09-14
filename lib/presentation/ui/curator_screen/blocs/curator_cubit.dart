import '../../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../../application/services/category/category.dart';
import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_curator/post_curator.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'curator_state.dart';

class CuratorPostCubit extends InfiniteLoaderCubit<CuratorState, PostResponse> {
  CuratorPostCubit({
    required super.failureHandlerManager,
    required super.initialState,
    required this.postCuratorController,
    required this.adminPostCuratorController,
    required this.loadingManager,
  });

  final PostCuratorController postCuratorController;
  final AdminPostCuratorController adminPostCuratorController;
  final LoadingManager loadingManager;

  void selectChildCategory(SubCategoryDTO? childCategory) {
    if (childCategory == null) {
      return;
    }
    CuratorState currentState = state;
    final selected = Set<int>.from(state.selectedChildCategory);
    if (selected.contains(childCategory.id)) {
      selected.remove(childCategory.id);
    } else if (childCategory.id != null) {
      selected.add(childCategory.id!);
    }
    currentState = currentState.copyWith(selectedChildCategory: selected);
    emit(currentState);
    reload();
  }

  void changePostsLanguage(PostLanguage postLanguage) {
    CuratorState currentState = state;
    if (postLanguage == currentState.postLanguage) {
      currentState = currentState.unsetPostLanguage();
    } else {
      currentState = currentState.copyWith(postLanguage: postLanguage);
    }
    emit(currentState);
    reload();
  }

  void deletePost(int index) async {
    final int postId = state.data[index].id ?? 0;
    final deletePostResult = await loadingManager.startLoading(
        future: adminPostCuratorController.deleteCuratorPost(id: postId));

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
    final result = await postCuratorController.getCuratorPosts(
      size: pageSize,
      parentCategoryId: state.parentCategory.id,
      childCategoryIds: state.selectedChildCategory.toList(),
      postLanguage: state.postLanguage,
      page: page,
      keyword: searchText,
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
