import '../../../../application/services/category/category.dart';
import '../../../../application/services/user/controller/controller.dart';
import '../../../../application/services/user_favorite_category/user_favorite_category.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

class FavoriteCategoryState {
  const FavoriteCategoryState({
    this.apiStatus = ApiStatus.initial,
    this.favorited = const [],
  });

  final ApiStatus apiStatus;

  final List<CategoryDTO> favorited;

  FavoriteCategoryState copyWith({
    ApiStatus? apiStatus,
    List<CategoryDTO>? favorited,
  }) {
    return FavoriteCategoryState(
      apiStatus: apiStatus ?? this.apiStatus,
      favorited: favorited ?? this.favorited,
    );
  }
}

class FavoriteCategoryCubit extends SafeCubit<FavoriteCategoryState> {
  FavoriteCategoryCubit({
    required this.userController,
    required this.loadingManager,
    required this.failureHandlerManager,
    required this.favoriteCategoryController,
  }) : super(const FavoriteCategoryState()) {
    reload();
  }

  final UserController userController;
  final UserFavoriteCategoryController favoriteCategoryController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final favoritedCategoryResult =
        await userController.getMyFavoriteCategories();
    favoritedCategoryResult.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    favoritedCategoryResult.handleRight((value) {
      emit(state.copyWith(apiStatus: ApiStatus.success, favorited: value));
    });
  }

  void unFavorCategory(int index) async {
    final targetCategory = state.favorited[index];
    final unFavoritedResult = await loadingManager.startLoading(
        future: favoriteCategoryController.setCategoryIsFavorite(
      categoryId: targetCategory.id ?? 0,
      request: const FavoriteCategoryRequest(isFavorite: false),
    ));

    unFavoritedResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    unFavoritedResult.handleRight((value) {
      final currentCategories = List<CategoryDTO>.from(state.favorited);
      currentCategories.removeAt(index);
      emit(state.copyWith(
        favorited: currentCategories,
      ));
    });
  }
}
