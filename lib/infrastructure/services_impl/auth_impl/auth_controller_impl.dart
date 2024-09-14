import '../../../application/services/auth/auth.dart';
import '../../../application/services/common/response/src/success_response.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class AuthControllerImpl with AuthController, DataSourceErrorHandler {
  const AuthControllerImpl({
    required this.authDataSource,
  });

  final AuthDataSource authDataSource;

  @override
  Future<Result<Failure, AuthenticatedResponse>> login(LoginRequest request) {
    return handleApiResult(future: () => authDataSource.login(request));
  }

  @override
  Future<Result<Failure, AuthenticatedResponse>> refreshToken(
      RefreshTokenRequest request) {
    return handleApiResult(future: () => authDataSource.refreshToken(request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> logout(LogoutRequest request) {
    return handleApiResult(future: () => authDataSource.logout(request));
  }

  @override
  Future<Result<Failure, SendOTPResponse>> sendOtp(SendOTPRequest request) {
    return handleApiResult(future: () => authDataSource.sendOtp(request));
  }

  @override
  Future<Result<Failure, SessionTokenResponse>> verifyOtp(
      VerifyOTPRequest request) {
    return handleApiResult(future: () => authDataSource.verifyOtp(request));
  }

  @override
  Future<Result<Failure, AuthenticatedResponse>> register(
      RegisterWithPhoneNumberRequest request) {
    return handleApiResult(future: () => authDataSource.register(request));
  }

  @override
  Future<Result<Failure, FindUsernameResponse>> findUsername(
      FindUsernameRequest request) {
    return handleApiResult(future: () => authDataSource.findUsername(request));
  }

  @override
  Future<Result<Failure, MatchUserPhoneNumberResponse>> matchUserPhoneNumber(
      MatchUserPhoneNumberRequest request) {
    return handleApiResult(
        future: () => authDataSource.matchUserPhoneNumber(request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> changePassword(
      ChangePasswordRequest request) {
    return handleApiResult(
        future: () => authDataSource.changePassword(request));
  }

  @override
  Future<Result<Failure, AuthenticatedResponse>> loginWithKakao(
      LoginWithKakaoRequest request) {
    return handleApiResult(
        future: () => authDataSource.loginWithKakao(request));
  }

  @override
  Future<Result<Failure, AuthenticatedResponse>> loginWithGoogle(
      LoginWithGoogleRequest request) {
    return handleApiResult(
        future: () => authDataSource.loginWithGoogle(request));
  }

  @override
  Future<Result<Failure, AuthenticatedResponse>> loginWithNaver(
      LoginWithNaverRequest request) {
    return handleApiResult(
        future: () => authDataSource.loginWithNaver(request));
  }

  @override
  Future<Result<Failure, AuthenticatedResponse>> loginWithApple(
      LoginWithAppleRequest request) {
    return handleApiResult(
        future: () => authDataSource.loginWithApple(request));
  }

  @override
  Future<Result<Failure, SessionTokenResponse>> verifyPassword(
      VerifyPasswordRequest request) {
    return handleApiResult(
        future: () => authDataSource.verifyPassword(request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> changeMyPassword(
      ChangeMyPasswordRequest request) {
    return handleApiResult(
        future: () => authDataSource.changeMyPassword(request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> changePhoneNumber(
      ChangePhoneNumberRequest request) {
    return handleApiResult(
        future: () => authDataSource.changePhoneNumber(request));
  }
}
