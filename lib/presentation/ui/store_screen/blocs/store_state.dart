part of 'store_cubit.dart';

class StoreState extends InfiniteLoaderState<ProductResponse> {
  const StoreState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    this.category,
    this.categoryLoadingStatus = ApiStatus.initial,
    this.productCategories,
  });

  final CategoryDTO? category;
  final ApiStatus categoryLoadingStatus;
  final List<CategoryDTO>? productCategories;

  @override
  InfiniteLoaderState<ProductResponse> loadingManagementStateChanged({
    List<ProductResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return StoreState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      category: category,
      categoryLoadingStatus: categoryLoadingStatus,
      productCategories: productCategories,
    );
  }

  StoreState copyWith({
    ApiStatus? categoryLoadingStatus,
    CategoryDTO? category,
    List<CategoryDTO>? productCategories,
  }) {
    return StoreState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      totalItems: totalItems,
      categoryLoadingStatus:
          categoryLoadingStatus ?? this.categoryLoadingStatus,
      category: category ?? this.category,
      productCategories: productCategories ?? this.productCategories,
    );
  }
}
