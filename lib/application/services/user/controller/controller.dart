import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../category/category.dart';
import '../../common/common.dart';
import '../../common/dto/src/post_activity_type.dart';
import '../user.dart';

mixin UserController {
  Future<Result<Failure, UserDTO>> getUserInfo();

  Future<Result<Failure, UserDTO>> updateUserInfo(
      UpdateUserInfoRequest request);

  Future<Result<Failure, CheckAccountExistedResponse>> checkExistUsername(
      CheckExistUsernameRequest request);

  Future<Result<Failure, UserRegistrationStatusResponse>>
      getUserRegistrationStatus();

  Future<Result<Failure, CheckAccountExistedResponse>> checkExistPhoneNumber(
      CheckExistPhoneNumberRequest request);

  Future<Result<Failure, UserDTO>> updateUserAvatar(
      UpdateUserAvatarRequest request);

  Future<Result<Failure, UserDTO>> deleteUserAvatar();

  Future<Result<Failure, PagingResponse<PostResponse>>>
      getMyCommunityPostWithComment({int? page, required int size});

  Future<Result<Failure, PagingResponse<PostResponse>>>
      getMyLikedCommunityPosts({int? page, required int size});

  Future<Result<Failure, PagingResponse<PostResponse>>> getMyCommunityPosts(
      {int? page, required int size});

  Future<Result<Failure, PagingResponse<PostResponse>>>
      getMyCuratorPostWithComment({int? page, required int size});

  Future<Result<Failure, PagingResponse<PostResponse>>> getMyLikedCuratorPosts(
      {int? page, required int size});

  Future<Result<Failure, PagingResponse<PostResponse>>> getPostsByUserId({
    int? page,
    required int size,
    required int userId,
    required PostType postType,
    required PostActivityType postActivityType,
  });

  Future<Result<Failure, List<CategoryDTO>>> getMyFavoriteCategories();

  Future<Result<Failure, PagingResponse<UserDTO>>> getMyFollowings(
      {int? page, required int size});

  Future<Result<Failure, PagingResponse<UserDTO>>> getMyFollowers(
      {int? page, required int size});

  Future<Result<Failure, GetReferredUserResponse>> getReferredUsers();

  Future<Result<Failure, NotificationSettingResponse>>
      getMyNotificationSetting();

  Future<Result<Failure, NotificationSettingResponse>>
      upsertNotificationSetting(NotificationSettingRequest request);

  Future<Result<Failure, PagingResponse<NotificationResponse>>>
      getMyNotifications({int? page, required int size});

  Future<Result<Failure, NotificationResponse>> updateStatusNotification(
      {required int notificationId, required ReadNotificationRequest request});

  Future<Result<Failure, List<ProfileUrlResponse>>> getMyProfileUrl();

  Future<Result<Failure, List<ProfileUrlResponse>>> upsertMyProfileUrl(
      List<ProfileUrlRequest> request);

  Future<Result<Failure, List<SocialMediaResponse>>> getMySocialMedias();

  Future<Result<Failure, List<SocialMediaResponse>>> upsertMySocialMedias(
      List<SocialMediaRequest> request);

  Future<Result<Failure, UserDTO>> supplementUserInformation(
      SupplementUserInformationRequest request);

  Future<Result<Failure, UserDetailDTO>> getUserInfoById({required int userId});

  Future<Result<Failure, SuccessResponse>> deactivate();

  Future<Result<Failure, SuccessResponse>> reportUser({
    required int userId,
  });

  Future<Result<Failure, PagingResponse<UserDTO>>> getReportedUsers(
      {int? page, required int size});
}
