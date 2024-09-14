import '../../../../application/services/category/category.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';

class CuratorCategoryState {
  const CuratorCategoryState({
    this.apiStatus = ApiStatus.initial,
    this.categories = const [],
  });

  final List<CategoryDTO> categories;
  final ApiStatus apiStatus;

  CuratorCategoryState copyWith({
    List<CategoryDTO>? categories,
    ApiStatus? apiStatus,
  }) {
    return CuratorCategoryState(
      categories: categories ?? this.categories,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}

class CuratorCategoryCubit extends SafeCubit<CuratorCategoryState> {
  CuratorCategoryCubit({
    required this.categoryController,
    required this.failureHandlerManager,
  }) : super(const CuratorCategoryState()) {
    _fetchData();
  }

  final FailureHandlerManager failureHandlerManager;
  final CategoryController categoryController;

  void _fetchData() {
    reload();
  }

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    final categoryResponse = await categoryController.getAllCategory(
      const GetAllCategoryRequest(
        include: [CategoryType.curator],
      ),
    );
    categoryResponse.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    categoryResponse.handleRight((value) {
      emit(state.copyWith(apiStatus: ApiStatus.success, categories: value));
    });
  }
}
