part of 'curator_cubit.dart';

class CuratorState extends InfiniteLoaderState<PostResponse> {
  const CuratorState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    required this.parentCategory,
    this.selectedChildCategory = const {},
    this.postLanguage,
    this.availableChildCategory = const [],
  });

  final CategoryDTO parentCategory;
  final Set<int> selectedChildCategory;
  final List<SubCategoryDTO> availableChildCategory;
  final PostLanguage? postLanguage;

  @override
  InfiniteLoaderState<PostResponse> loadingManagementStateChanged({
    List<PostResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return CuratorState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      parentCategory: parentCategory,
      selectedChildCategory: selectedChildCategory,
      availableChildCategory: availableChildCategory,
      postLanguage: postLanguage,
    );
  }

  CuratorState unsetPostLanguage() {
    return CuratorState(
      data: data,
      isFirstLoad: isFirstLoad,
      infiniteLoadingFailure: infiniteLoadingFailure,
      infiniteLoadingStatus: infiniteLoadingStatus,
      parentCategory: parentCategory,
      selectedChildCategory: selectedChildCategory,
      availableChildCategory: availableChildCategory,
    );
  }

  CuratorState copyWith({
    CategoryDTO? parentCategory,
    Set<int>? selectedChildCategory,
    List<SubCategoryDTO>? availableChildCategory,
    PostLanguage? postLanguage,
    List<PostResponse>? data,
  }) {
    return CuratorState(
      data: data ?? this.data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      parentCategory: parentCategory ?? this.parentCategory,
      selectedChildCategory:
          selectedChildCategory ?? this.selectedChildCategory,
      availableChildCategory:
          availableChildCategory ?? this.availableChildCategory,
      postLanguage: postLanguage ?? this.postLanguage,
    );
  }
}
