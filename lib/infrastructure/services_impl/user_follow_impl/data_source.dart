import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../application/services/common/common.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserFollowDataSource {
  factory UserFollowDataSource(Dio dio, {String baseUrl}) =
      _UserFollowDataSource;

  @POST('/v1/user/follows/{followerUserId}/follow')
  Future<SuccessResponse> followUser({
    @Path('followerUserId') required int followerUserId,
  });

  @POST('/v1/user/follows/{followerUserId}/unfollow')
  Future<SuccessResponse> unfollowUser({
    @Path('followerUserId') required int followerUserId,
  });
}
