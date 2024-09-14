import '../../../../application/services/category/category.dart';
import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_community/post_community.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

part 'community_state.dart';

class CommunityPostCubit
    extends InfiniteLoaderCubit<CommunityState, PostResponse> {
  CommunityPostCubit({
    required super.failureHandlerManager,
    required this.postCommunityController,
    required this.categoryController,
    required this.loadingManager,
    this.preSelectedParentId,
    this.preSelectedChildId,
    this.isReported,
  }) : super(initialState: const CommunityState());

  @override
  void onInit() {
    loadCategory();
    super.onInit();
  }

  final PostCommunityController postCommunityController;
  final CategoryController categoryController;
  final LoadingManager loadingManager;
  final int? preSelectedParentId;
  final int? preSelectedChildId;
  final bool? isReported;
  bool _firstLoadingCategory = true;

  Future<void> loadCategory() async {
    emit(state.copyWith(categoryLoadingStatus: ApiStatus.loading));
    final categoryResult = await categoryController.getAllCategory(
      const GetAllCategoryRequest(
        include: [CategoryType.community],
      ),
    );
    categoryResult.handleLeft((value) {
      emit(state.copyWith(categoryLoadingStatus: ApiStatus.fail));
      handleError(value);
    });

    categoryResult.handleRight((value) {
      CategoryDTO? parentCategory;
      SubCategoryDTO? childCategory;
      if (_firstLoadingCategory) {
        parentCategory = value
            .where((element) => element.id == preSelectedParentId)
            .firstOrNull;

        final List<SubCategoryDTO> allChild = [];
        for (final element in value) {
          allChild.addAll(element.children ?? []);
        }
        childCategory = allChild
            .where((element) => element.id == preSelectedChildId)
            .firstOrNull;
      }
      emit(
        state.copyWith(
          categoryLoadingStatus: ApiStatus.success,
          communityCategories: value,
          parentCategory: parentCategory,
          childCategory: childCategory,
          filterCommunityPost:
              parentCategory != null ? FilterCommunityPost.LATEST : null,
        ),
      );
    });
    _firstLoadingCategory = false;
  }

  void changeParentCategory(CategoryDTO? parentCategory) {
    if (parentCategory?.id == state.parentCategory?.id) {
      return;
    }
    CommunityState currentState = state;
    currentState = currentState.unSetChildCategory();
    if (parentCategory == null) {
      currentState = currentState.unSetParentCategory();
    } else {
      currentState = currentState.copyWith(
        parentCategory: parentCategory,
        filterCommunityPost: FilterCommunityPost.LATEST,
      );
    }
    emit(currentState);
    reload();
  }

  void changePostsLanguage(PostLanguage postLanguage) {
    CommunityState currentState = state;
    if (postLanguage == currentState.postLanguage) {
      currentState = currentState.unsetPostLanguage();
    } else {
      currentState = currentState.copyWith(postLanguage: postLanguage);
    }
    emit(currentState);
    reload();
  }

  void changeChildCategory(SubCategoryDTO? childCategory) {
    if (childCategory?.id == state.childCategory?.id) {
      return;
    }
    CommunityState currentState = state;
    if (childCategory == null) {
      currentState = currentState.unSetChildCategory();
    } else {
      currentState = currentState.copyWith(childCategory: childCategory);
    }
    emit(currentState);
    reload();
  }

  void changePostFilter(FilterCommunityPost filterCommunityPost) {
    if (filterCommunityPost == state.filterCommunityPost) {
      return;
    }
    emit(state.copyWith(filterCommunityPost: filterCommunityPost));
    reload();
  }

  void deletePost(int index) async {
    final int postId = state.data[index].id ?? 0;
    final deletePostResult = await loadingManager.startLoading(
        future: postCommunityController.deleteCommunityPost(id: postId));

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
    int? resolvedCategoryId;
    FilterCommunityPost filterCommunityPost = state.filterCommunityPost;
    if (_firstLoadingCategory) {
      resolvedCategoryId ??= preSelectedChildId;
      resolvedCategoryId ??= preSelectedParentId;
      if (preSelectedParentId != null) {
        filterCommunityPost = FilterCommunityPost.LATEST;
      }
    } else {
      resolvedCategoryId ??=
          state.childCategory?.id ?? state.parentCategory?.id;
    }

    Result<Failure, PagingResponse<PostResponse>> result;
    if (isReported != null && isReported! == true) {
      result = await postCommunityController.getReportedCommunityPosts(
          size: pageSize,
          language: state.postLanguage,
          page: page,
          keyword: searchText);
    } else {
      result = await postCommunityController.getCommunityPosts(
        size: pageSize,
        filter: filterCommunityPost,
        categoryId: resolvedCategoryId,
        language: state.postLanguage,
        page: page,
        keyword: searchText,
      );
    }
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
