import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../../post_community/post_community.dart';

mixin AdminPostCuratorController {
  Future<Result<Failure, PostResponse>> saveCuratorPost({
    required PostRequest request,
  });

  Future<Result<Failure, PostResponse>> updateCuratorPost({
    required int id,
    required PostRequest request,
  });

  Future<Result<Failure, SuccessResponse>> deleteCuratorPost({
    required int id,
  });
}
