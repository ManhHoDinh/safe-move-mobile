import '../../../application/services/common/common.dart';
import '../../../application/services/user_follow/user_follow.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserFollowControllerImpl
    with UserFollowController, DataSourceErrorHandler {
  const UserFollowControllerImpl({
    required this.userFollowDataSource,
  });

  final UserFollowDataSource userFollowDataSource;

  @override
  Future<Result<Failure, SuccessResponse>> followUser(
      {required int followerUserId}) {
    return handleApiResult(
        future: () =>
            userFollowDataSource.followUser(followerUserId: followerUserId));
  }

  @override
  Future<Result<Failure, SuccessResponse>> unfollowUser(
      {required int followerUserId}) {
    return handleApiResult(
        future: () =>
            userFollowDataSource.unfollowUser(followerUserId: followerUserId));
  }
}
