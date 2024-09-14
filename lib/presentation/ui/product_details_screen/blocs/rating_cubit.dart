import '../../../../application/services/rating/rating.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'rating_state.dart';

class RatingCubit extends InfiniteLoaderCubit<RatingState, RatingResponse> {
  RatingCubit({
    required super.failureHandlerManager,
    required this.ratingController,
    required this.loadingManager,
    required this.productId,
  }) : super(initialState: const RatingState());

  final RatingController ratingController;
  final LoadingManager loadingManager;
  final int productId;

  @override
  Future<Result<Failure, PageableData<RatingResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await ratingController.getRatings(
      size: pageSize,
      page: page,
      productId: productId,
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

  void deleteRating(int index) async {
    final int ratingId = state.data[index].id ?? 0;
    final deleteRatingResult = await loadingManager.startLoading(
        future: ratingController.deleteRatingById(
            id: ratingId, productId: productId));

    deleteRatingResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });

    deleteRatingResult.handleRight((value) {
      final currentRatings = List<RatingResponse>.from(state.data);
      currentRatings.removeAt(index);
      emit(state.copyWith(data: currentRatings));
    });
  }
}
