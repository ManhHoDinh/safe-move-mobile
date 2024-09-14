import '../../../application/services/common/response/src/paging_response.dart';
import '../../../application/services/common/response/src/success_response.dart';
import '../../../application/services/rating/controller/controller.dart';
import '../../../application/services/rating/request/src/rating_request.dart';
import '../../../application/services/rating/response/src/rating_response.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class RatingControllerImpl with RatingController, DataSourceErrorHandler {
  const RatingControllerImpl({
    required this.ratingDataSource,
  });

  final RatingDataSource ratingDataSource;

  @override
  Future<Result<Failure, PagingResponse<RatingResponse>>> getRatings(
      {int? page, required int size, required int productId}) {
    return handleApiResult(
        future: () => ratingDataSource.getRatings(
            page: page, size: size, productId: productId));
  }

  @override
  Future<Result<Failure, RatingResponse>> addRating(RatingRequest request) {
    return handleApiResult(future: () => ratingDataSource.addRating(request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteRatingById(
      {required int id, required int productId}) {
    return handleApiResult(
        future: () =>
            ratingDataSource.deleteRatingById(id: id, productId: productId));
  }
}
