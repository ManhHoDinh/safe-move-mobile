import '../../../../application/services/category/category.dart';
import '../../../../application/services/product/product.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

part 'store_state.dart';

class StoreCubit extends InfiniteLoaderCubit<StoreState, ProductResponse> {
  StoreCubit({
    required super.failureHandlerManager,
    required this.productController,
    required this.categoryController,
  }) : super(initialState: const StoreState()) {
    loadCategory();
  }

  final ProductController productController;
  final CategoryController categoryController;

  void loadCategory() async {
    emit(state.copyWith(categoryLoadingStatus: ApiStatus.loading));
    final categoryResult = await categoryController.getAllCategory(
      const GetAllCategoryRequest(
        include: [CategoryType.store],
      ),
    );
    categoryResult.handleLeft((value) {
      emit(state.copyWith(categoryLoadingStatus: ApiStatus.fail));
      handleError(value);
    });
    categoryResult.handleRight((value) {
      emit(state.copyWith(
          categoryLoadingStatus: ApiStatus.success, productCategories: value));
    });
  }

  void changeCategory(CategoryDTO? category) {
    if (category?.id == state.category?.id) {
      return;
    }
    final currentState = state.copyWith(category: category);
    emit(currentState);
    reload();
  }

  @override
  Future<Result<Failure, PageableData<ProductResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await productController.getProducts(
      page: page,
      size: pageSize,
      categoryIds: state.category?.id != null ? [state.category!.id!] : [],
      keyword: searchText,
    );
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        final totalItems = value.totalElements ?? 0;
        return PageableData(
          totalPages: totalPages,
          totalItems: totalItems,
          data: data,
        );
      },
    );
  }
}
