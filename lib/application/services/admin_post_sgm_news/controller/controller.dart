import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../../post_community/post_community.dart';

mixin AdminPostSgmNewsController {
  Future<Result<Failure, PostResponse>> saveSgmNewsPost({
    required PostRequest request,
  });

  Future<Result<Failure, PostResponse>> updateSgmNewsPost({
    required int id,
    required PostRequest request,
  });

  Future<Result<Failure, SuccessResponse>> deleteSgmNewsPost({
    required int id,
  });
}
