import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/auth/auth.dart';
import '../../../application/services/common/common.dart';

part 'data_source.g.dart';

@RestApi()
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio, {String baseUrl}) = _AuthDataSource;

  @POST('/v1/auth/login')
  Future<AuthenticatedResponse> login(@Body() LoginRequest request);

  @POST('/v1/auth/login/kakao')
  Future<AuthenticatedResponse> loginWithKakao(
      @Body() LoginWithKakaoRequest request);

  @POST('/v1/auth/login/google')
  Future<AuthenticatedResponse> loginWithGoogle(
      @Body() LoginWithGoogleRequest request);

  @POST('/v1/auth/login/naver')
  Future<AuthenticatedResponse> loginWithNaver(
      @Body() LoginWithNaverRequest request);

  @POST('/v1/auth/login/apple')
  Future<AuthenticatedResponse> loginWithApple(
      @Body() LoginWithAppleRequest request);

  @POST('/v1/auth/refresh-token')
  Future<AuthenticatedResponse> refreshToken(
      @Body() RefreshTokenRequest request);

  @DELETE('/v1/auth/logout')
  Future<SuccessResponse> logout(@Body() LogoutRequest request);

  @POST('/v1/auth/otp/phone-number/send')
  Future<SendOTPResponse> sendOtp(@Body() SendOTPRequest request);

  @POST('/v1/auth/otp/verify')
  Future<SessionTokenResponse> verifyOtp(@Body() VerifyOTPRequest request);

  @POST('/v1/auth/verify-password')
  Future<SessionTokenResponse> verifyPassword(
      @Body() VerifyPasswordRequest request);

  @POST('/v1/auth/register/phone-number')
  Future<AuthenticatedResponse> register(
      @Body() RegisterWithPhoneNumberRequest request);
  @POST('/v1/auth/locate-username/phone-number')
  Future<FindUsernameResponse> findUsername(
      @Body() FindUsernameRequest request);
  @POST('/v1/auth/match-user/phone-number')
  Future<MatchUserPhoneNumberResponse> matchUserPhoneNumber(
      @Body() MatchUserPhoneNumberRequest request);
  @POST('/v1/auth/change-password')
  Future<SuccessResponse> changePassword(@Body() ChangePasswordRequest request);

  @POST('/v1/auth/change-my-password')
  Future<SuccessResponse> changeMyPassword(
      @Body() ChangeMyPasswordRequest request);

  @POST('/v1/auth/change-phone-number')
  Future<SuccessResponse> changePhoneNumber(
      @Body() ChangePhoneNumberRequest request);
}
