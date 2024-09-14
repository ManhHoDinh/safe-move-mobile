import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/category/category.dart';
import '../../../application/services/common/common.dart';
import '../../../application/services/common/dto/src/post_activity_type.dart';
import '../../../application/services/user/user.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserDataSource {
  factory UserDataSource(Dio dio, {String baseUrl}) = _UserDataSource;

  @GET('/v1/user/user-info')
  Future<UserDTO> getUserInfo();

  @PUT('/v1/user/user-info')
  Future<UserDTO> updateUserInfo(@Body() UpdateUserInfoRequest request);

  @GET('/v1/user/get-user-registration-status')
  Future<UserRegistrationStatusResponse> getUserRegistrationStatus();

  @GET('/v1/user/check-exist-account/username/{username}')
  Future<CheckAccountExistedResponse> checkExistUsername(
      @Path('username') String username);

  @GET('/v1/user/check-exist-account/phone-number/{phoneNumber}')
  Future<CheckAccountExistedResponse> checkExistPhoneNumber(
      @Path('phoneNumber') String phoneNumber);

  @POST('/v1/user/avatar')
  Future<UserDTO> updateUserAvatar(@Body() UpdateUserAvatarRequest request);

  @DELETE('/v1/user/avatar')
  Future<UserDTO> deleteUserAvatar();

  @GET('/v1/user/community/comments')
  Future<PagingResponse<PostResponse>> getMyCommunityPostWithComment({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/community/liked')
  Future<PagingResponse<PostResponse>> getMyLikedCommunityPosts({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/community/posts')
  Future<PagingResponse<PostResponse>> getMyCommunityPosts({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/{userId}/posts/activities')
  Future<PagingResponse<PostResponse>> getPostsByUserId({
    @Query('page') int? page,
    @Query('size') required int size,
    @Path('userId') required int userId,
    @Query('postType') required PostType postType,
    @Query('postActivityType') required PostActivityType postActivityType,
  });

  @GET('/v1/user/curator/comments')
  Future<PagingResponse<PostResponse>> getMyCuratorPostWithComment({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/curator/liked')
  Future<PagingResponse<PostResponse>> getMyLikedCuratorPosts({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/favorite-categories')
  Future<List<CategoryDTO>> getMyFavoriteCategories();

  @GET('/v1/user/followings')
  Future<PagingResponse<UserDTO>> getMyFollowings({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/followers')
  Future<PagingResponse<UserDTO>> getMyFollowers({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @GET('/v1/user/get-referred-users')
  Future<GetReferredUserResponse> getReferredUsers();

  @GET('/v1/user/notification-settings')
  Future<NotificationSettingResponse> getMyNotificationSetting();

  @PATCH('/v1/user/notification-settings')
  Future<NotificationSettingResponse> upsertNotificationSetting(
      @Body() NotificationSettingRequest request);

  @GET('/v1/user/notifications')
  Future<PagingResponse<NotificationResponse>> getMyNotifications({
    @Query('page') int? page,
    @Query('size') required int size,
  });

  @PATCH('/v1/user/notifications/{notificationId}')
  Future<NotificationResponse> updateStatusNotification({
    @Path('notificationId') required int notificationId,
    @Body() required ReadNotificationRequest request,
  });

  @GET('/v1/user/profile-urls')
  Future<List<ProfileUrlResponse>> getMyProfileUrl();

  @POST('/v1/user/profile-urls')
  Future<List<ProfileUrlResponse>> upsertMyProfileUrl(
      @Body() List<ProfileUrlRequest> request);

  @GET('/v1/user/social-medias')
  Future<List<SocialMediaResponse>> getMySocialMedias();

  @POST('/v1/user/social-medias')
  Future<List<SocialMediaResponse>> upsertMySocialMedias(
      @Body() List<SocialMediaRequest> request);

  @POST('/v1/user/supplement-user-info')
  Future<UserDTO> supplementUserInformation(
      @Body() SupplementUserInformationRequest request);

  @GET('/v1/user/user-info/{userId}')
  Future<UserDetailDTO> getUserInfoById({
    @Path('userId') required int userId,
  });

  @PATCH('/v1/user/deactivate')
  Future<SuccessResponse> deactivate();

  @POST('/v1/user/{userId}/report')
  Future<SuccessResponse> reportUser({
    @Path('userId') required int userId,
  });

  @GET('/v1/admin/users/reported')
  Future<PagingResponse<UserDTO>> getReportedUsers({
    @Query('page') int? page,
    @Query('size') required int size,
  });
}
