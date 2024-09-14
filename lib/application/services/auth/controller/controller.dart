import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../auth.dart';

mixin AuthController {
  Future<Result<Failure, AuthenticatedResponse>> login(LoginRequest request);
  Future<Result<Failure, AuthenticatedResponse>> refreshToken(
      RefreshTokenRequest request);
  Future<Result<Failure, SuccessResponse>> logout(LogoutRequest request);
  Future<Result<Failure, SendOTPResponse>> sendOtp(SendOTPRequest request);
  Future<Result<Failure, SessionTokenResponse>> verifyOtp(
      VerifyOTPRequest request);
  Future<Result<Failure, AuthenticatedResponse>> register(
      RegisterWithPhoneNumberRequest request);
  Future<Result<Failure, FindUsernameResponse>> findUsername(
      FindUsernameRequest request);
  Future<Result<Failure, MatchUserPhoneNumberResponse>> matchUserPhoneNumber(
      MatchUserPhoneNumberRequest request);
  Future<Result<Failure, SuccessResponse>> changePassword(
      ChangePasswordRequest request);
  Future<Result<Failure, AuthenticatedResponse>> loginWithKakao(
      LoginWithKakaoRequest request);
  Future<Result<Failure, AuthenticatedResponse>> loginWithApple(
      LoginWithAppleRequest request);
  Future<Result<Failure, AuthenticatedResponse>> loginWithGoogle(
      LoginWithGoogleRequest request);
  Future<Result<Failure, AuthenticatedResponse>> loginWithNaver(
      LoginWithNaverRequest request);
  Future<Result<Failure, SessionTokenResponse>> verifyPassword(
      VerifyPasswordRequest request);
  Future<Result<Failure, SuccessResponse>> changeMyPassword(
      ChangeMyPasswordRequest request);
  Future<Result<Failure, SuccessResponse>> changePhoneNumber(
      ChangePhoneNumberRequest request);
}
