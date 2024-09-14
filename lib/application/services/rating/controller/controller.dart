import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../request/src/rating_request.dart';
import '../response/response.dart';

mixin RatingController {
  Future<Result<Failure, PagingResponse<RatingResponse>>> getRatings(
      {int? page, required int size, required int productId});

  Future<Result<Failure, RatingResponse>> addRating(RatingRequest request);

  Future<Result<Failure, SuccessResponse>> deleteRatingById(
      {required int id, required int productId});
}
