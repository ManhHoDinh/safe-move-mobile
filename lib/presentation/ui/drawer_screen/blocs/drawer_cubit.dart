import '../../../../application/services/category/category.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';

class DrawerState {
  const DrawerState({
    this.apiStatus = ApiStatus.initial,
    this.communityCategory = const [],
    this.curatorCategory = const [],
  });

  final ApiStatus apiStatus;
  final List<CategoryDTO> communityCategory;
  final List<CategoryDTO> curatorCategory;

  DrawerState copyWith({
    ApiStatus? apiStatus,
    List<CategoryDTO>? communityCategory,
    List<CategoryDTO>? curatorCategory,
  }) {
    return DrawerState(
      apiStatus: apiStatus ?? this.apiStatus,
      communityCategory: communityCategory ?? this.communityCategory,
      curatorCategory: curatorCategory ?? this.curatorCategory,
    );
  }
}

class DrawerCubit extends SafeCubit<DrawerState> {
  DrawerCubit({
    required this.failureHandlerManager,
    required this.categoryController,
  }) : super(const DrawerState()) {
    reload();
  }

  final FailureHandlerManager failureHandlerManager;
  final CategoryController categoryController;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final getAllCateResult = await categoryController
        .getAllCategory(const GetAllCategoryRequest(include: []));
    getAllCateResult.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    getAllCateResult.handleRight((value) {
      final communityCategory = value
          .where((element) => element.categoryType == CategoryType.community)
          .toList();
      final curatorCategory = value
          .where((element) => element.categoryType == CategoryType.curator)
          .toList();
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        curatorCategory: curatorCategory,
        communityCategory: communityCategory,
      ));
    });
  }
}
