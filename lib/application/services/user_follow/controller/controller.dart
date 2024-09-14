import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';

mixin UserFollowController {
  Future<Result<Failure, SuccessResponse>> followUser(
      {required int followerUserId});

  Future<Result<Failure, SuccessResponse>> unfollowUser(
      {required int followerUserId});
}
