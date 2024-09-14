import '../../../application/services/category/category.dart';
import '../../../application/services/common/common.dart';
import '../../../application/services/common/dto/src/post_activity_type.dart';
import '../../../application/services/user/user.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserControllerImpl with UserController, DataSourceErrorHandler {
  const UserControllerImpl({
    required this.userDataSource,
  });

  final UserDataSource userDataSource;

  @override
  Future<Result<Failure, UserDTO>> getUserInfo() {
    return handleApiResult(future: () => userDataSource.getUserInfo());
  }

  @override
  Future<Result<Failure, UserRegistrationStatusResponse>>
      getUserRegistrationStatus() {
    return handleApiResult(
        future: () => userDataSource.getUserRegistrationStatus());
  }

  @override
  Future<Result<Failure, CheckAccountExistedResponse>> checkExistUsername(
      CheckExistUsernameRequest request) {
    return handleApiResult(
        future: () => userDataSource.checkExistUsername(request.username));
  }

  @override
  Future<Result<Failure, CheckAccountExistedResponse>> checkExistPhoneNumber(
      CheckExistPhoneNumberRequest request) {
    return handleApiResult(
        future: () =>
            userDataSource.checkExistPhoneNumber(request.phoneNumber));
  }

  @override
  Future<Result<Failure, UserDTO>> updateUserAvatar(
      UpdateUserAvatarRequest request) {
    return handleApiResult(
        future: () => userDataSource.updateUserAvatar(request));
  }

  @override
  Future<Result<Failure, UserDTO>> deleteUserAvatar() {
    return handleApiResult(future: () => userDataSource.deleteUserAvatar());
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>>
      getMyCommunityPostWithComment({int? page, required int size}) {
    return handleApiResult(
        future: () => userDataSource.getMyCommunityPostWithComment(
            page: page, size: size));
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>>
      getMyLikedCommunityPosts({int? page, required int size}) {
    return handleApiResult(
        future: () =>
            userDataSource.getMyLikedCommunityPosts(page: page, size: size));
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getMyCommunityPosts(
      {int? page, required int size}) {
    return handleApiResult(
        future: () =>
            userDataSource.getMyCommunityPosts(page: page, size: size));
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>>
      getMyCuratorPostWithComment({int? page, required int size}) {
    return handleApiResult(
        future: () =>
            userDataSource.getMyCuratorPostWithComment(page: page, size: size));
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getMyLikedCuratorPosts(
      {int? page, required int size}) {
    return handleApiResult(
        future: () =>
            userDataSource.getMyLikedCuratorPosts(page: page, size: size));
  }

  @override
  Future<Result<Failure, List<CategoryDTO>>> getMyFavoriteCategories() {
    return handleApiResult(
        future: () => userDataSource.getMyFavoriteCategories());
  }

  @override
  Future<Result<Failure, PagingResponse<UserDTO>>> getMyFollowings(
      {int? page, required int size}) {
    return handleApiResult(
        future: () => userDataSource.getMyFollowings(page: page, size: size));
  }

  @override
  Future<Result<Failure, PagingResponse<UserDTO>>> getMyFollowers(
      {int? page, required int size}) {
    return handleApiResult(
        future: () => userDataSource.getMyFollowers(page: page, size: size));
  }

  @override
  Future<Result<Failure, GetReferredUserResponse>> getReferredUsers() {
    return handleApiResult(future: () => userDataSource.getReferredUsers());
  }

  @override
  Future<Result<Failure, NotificationSettingResponse>>
      getMyNotificationSetting() {
    return handleApiResult(
        future: () => userDataSource.getMyNotificationSetting());
  }

  @override
  Future<Result<Failure, NotificationSettingResponse>>
      upsertNotificationSetting(NotificationSettingRequest request) {
    return handleApiResult(
        future: () => userDataSource.upsertNotificationSetting(request));
  }

  @override
  Future<Result<Failure, List<ProfileUrlResponse>>> getMyProfileUrl() {
    return handleApiResult(future: () => userDataSource.getMyProfileUrl());
  }

  @override
  Future<Result<Failure, PagingResponse<NotificationResponse>>>
      getMyNotifications({int? page, required int size}) {
    return handleApiResult(
        future: () =>
            userDataSource.getMyNotifications(page: page, size: size));
  }

  @override
  Future<Result<Failure, List<ProfileUrlResponse>>> upsertMyProfileUrl(
      List<ProfileUrlRequest> request) {
    return handleApiResult(
        future: () => userDataSource.upsertMyProfileUrl(request));
  }

  @override
  Future<Result<Failure, List<SocialMediaResponse>>> getMySocialMedias() {
    return handleApiResult(future: () => userDataSource.getMySocialMedias());
  }

  @override
  Future<Result<Failure, List<SocialMediaResponse>>> upsertMySocialMedias(
      List<SocialMediaRequest> request) {
    return handleApiResult(
        future: () => userDataSource.upsertMySocialMedias(request));
  }

  @override
  Future<Result<Failure, UserDTO>> supplementUserInformation(
      SupplementUserInformationRequest request) {
    return handleApiResult(
        future: () => userDataSource.supplementUserInformation(request));
  }

  @override
  Future<Result<Failure, UserDTO>> updateUserInfo(
      UpdateUserInfoRequest request) {
    return handleApiResult(
        future: () => userDataSource.updateUserInfo(request));
  }

  @override
  Future<Result<Failure, UserDetailDTO>> getUserInfoById(
      {required int userId}) {
    return handleApiResult(
        future: () => userDataSource.getUserInfoById(userId: userId));
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getPostsByUserId({
    int? page,
    required int size,
    required int userId,
    required PostType postType,
    required PostActivityType postActivityType,
  }) {
    return handleApiResult(
      future: () => userDataSource.getPostsByUserId(
        userId: userId,
        page: page,
        size: size,
        postType: postType,
        postActivityType: postActivityType,
      ),
    );
  }

  @override
  Future<Result<Failure, NotificationResponse>> updateStatusNotification(
      {required int notificationId, required ReadNotificationRequest request}) {
    return handleApiResult(
        future: () => userDataSource.updateStatusNotification(
            notificationId: notificationId, request: request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> deactivate() {
    return handleApiResult(future: () => userDataSource.deactivate());
  }

  @override
  Future<Result<Failure, SuccessResponse>> reportUser({required int userId}) {
    return handleApiResult(
      future: () => userDataSource.reportUser(userId: userId),
    );
  }

  
  @override
  Future<Result<Failure, PagingResponse<UserDTO>>> getReportedUsers({
    int? page,
    required int size
  }) {
    return handleApiResult(
      future: () => userDataSource.getReportedUsers(
        page: page,
        size: size,
        ),
    );
  }
  

}
