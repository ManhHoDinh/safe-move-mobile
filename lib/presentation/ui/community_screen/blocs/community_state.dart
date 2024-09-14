part of 'community_cubit.dart';

class CommunityState extends InfiniteLoaderState<PostResponse> {
  const CommunityState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    this.parentCategory,
    this.childCategory,
    this.categoryLoadingStatus = ApiStatus.initial,
    this.filterCommunityPost = FilterCommunityPost.ALL,
    this.communityCategories,
    this.postLanguage,
  });

  final CategoryDTO? parentCategory;
  final SubCategoryDTO? childCategory;
  final ApiStatus categoryLoadingStatus;
  final FilterCommunityPost filterCommunityPost;
  final List<CategoryDTO>? communityCategories;
  final PostLanguage? postLanguage;

  @override
  InfiniteLoaderState<PostResponse> loadingManagementStateChanged({
    List<PostResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return CommunityState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      parentCategory: parentCategory,
      childCategory: childCategory,
      categoryLoadingStatus: categoryLoadingStatus,
      filterCommunityPost: filterCommunityPost,
      communityCategories: communityCategories,
      postLanguage: postLanguage,
    );
  }

  CommunityState unSetParentCategory() {
    return CommunityState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      categoryLoadingStatus: categoryLoadingStatus,
      filterCommunityPost: filterCommunityPost,
      childCategory: childCategory,
      communityCategories: communityCategories,
      totalItems: totalItems,
      postLanguage: postLanguage,
    );
  }

  CommunityState unSetChildCategory() {
    return CommunityState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      categoryLoadingStatus: categoryLoadingStatus,
      filterCommunityPost: filterCommunityPost,
      parentCategory: parentCategory,
      communityCategories: communityCategories,
      totalItems: totalItems,
      postLanguage: postLanguage,
    );
  }

  CommunityState unsetPostLanguage() {
    return CommunityState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      categoryLoadingStatus: categoryLoadingStatus,
      filterCommunityPost: filterCommunityPost,
      parentCategory: parentCategory,
      childCategory: childCategory,
      communityCategories: communityCategories,
      totalItems: totalItems,
    );
  }

  CommunityState copyWith({
    ApiStatus? categoryLoadingStatus,
    FilterCommunityPost? filterCommunityPost,
    CategoryDTO? parentCategory,
    SubCategoryDTO? childCategory,
    List<CategoryDTO>? communityCategories,
    PostLanguage? postLanguage,
    List<PostResponse>? data,
  }) {
    return CommunityState(
      data: data ?? this.data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      totalItems: totalItems,
      categoryLoadingStatus:
          categoryLoadingStatus ?? this.categoryLoadingStatus,
      filterCommunityPost: filterCommunityPost ?? this.filterCommunityPost,
      parentCategory: parentCategory ?? this.parentCategory,
      childCategory: childCategory ?? this.childCategory,
      communityCategories: communityCategories ?? this.communityCategories,
      postLanguage: postLanguage ?? this.postLanguage,
    );
  }
}
