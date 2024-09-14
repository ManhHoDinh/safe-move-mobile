import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../application/services/app/token_service/refresh_token_manager.dart';
import '../../../application/services/app/token_service/token_service.dart';
import '../../../application/services/auth/auth.dart';
import '../../../application/services/user/controller/controller.dart';
import '../../../utilities/failure/failure.dart';
import '../bloc_utils/safe_cubit/safe_cubit.dart';
import '../session_cubit/session_cubit.dart';
import '../user_cubit/user_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends SafeCubit<AuthStatusState> {
  AuthCubit({
    required this.sessionCubit,
    required this.userCubit,
    required this.authController,
    required this.userController,
    required this.tokenService,
    required this.refreshTokenManager,
  }) : super(
          const AuthStatusLoggedOutState(logoutReason: LogoutReason.killApp),
        ) {
    _sessionSubs = sessionCubit.stream.listen((event) {
      if (event.status == SessionStatus.expired) {
        _logoutWithReason(LogoutReason.sessionExpired);
      }
    });
  }

  StreamSubscription<SessionState>? _sessionSubs;
  final AuthController authController;
  final UserController userController;
  final UserCubit userCubit;
  final SessionCubit sessionCubit;
  final TokenService tokenService;
  final RefreshTokenManager refreshTokenManager;

  void _loggedInSuccess({
    String? redirectUrl,
    required int? userId,
  }) async {
    sessionCubit.sessionStarted();
    bool isUserReady = true;
    final userInfoResult = await userController.getUserRegistrationStatus();
    userInfoResult.handleRight((value) {
      isUserReady = value.registrationCompleted ?? true;
    });

    if (userId != null) {
      OneSignal.login(userId.toString());
    }

    emit(AuthStatusLoggedInState(
      redirectUrl: redirectUrl,
      userNeedVerify: !isUserReady,
    ));
  }

  Future<Failure?> loginWithUserInfo({
    required String userName,
    required String password,
    String? redirectUrl,
  }) async {
    final loginResponse = await authController.login(
      LoginRequest(
        username: userName,
        password: password,
      ),
    );
    if (loginResponse.isLeft) {
      return loginResponse.left;
    }
    await tokenService.setToken(
      loginResponse.right.tokenInfo ?? const JwtResponse(),
    );
    _loggedInSuccess(
        redirectUrl: redirectUrl, userId: loginResponse.right.userId);
    return null;
  }

  Future<bool> loginByRefreshToken({
    String? redirectUrl,
    Duration timeOut = const Duration(seconds: 3),
  }) async {
    try {
      final oldSessionExisted = await refreshTokenManager.oldSessionExisted();
      if (!oldSessionExisted) {
        _logoutWithReason(LogoutReason.killApp, url: redirectUrl);
        return false;
      }
      final refreshTokenSuccess = await tokenService
          .refreshTokens(shouldTriggerExpired: false)
          .timeout(timeOut);
      if (refreshTokenSuccess.success) {
        _loggedInSuccess(
          redirectUrl: redirectUrl,
          userId: refreshTokenSuccess.jwtResponse?.userId,
        );
        return true;
      }
      _logoutWithReason(LogoutReason.sessionExpired, url: redirectUrl);
      return false;
    } on TimeoutException {
      _logoutWithReason(LogoutReason.sessionExpired, url: redirectUrl);
      return false;
    }
  }

  Future<Failure?> loginWithKakao({
    required String accessToken,
    String? redirectUrl,
  }) async {
    final loginWithKakaoResponse = await authController.loginWithKakao(
      LoginWithKakaoRequest(
        accessToken: accessToken,
      ),
    );
    if (loginWithKakaoResponse.isLeft) {
      return loginWithKakaoResponse.left;
    }
    await tokenService.setToken(
      loginWithKakaoResponse.right.tokenInfo ?? const JwtResponse(),
    );
    _loggedInSuccess(
        redirectUrl: redirectUrl, userId: loginWithKakaoResponse.right.userId);
    return null;
  }

  Future<Failure?> loginWithApple({
    required String idToken,
    String? redirectUrl,
  }) async {
    final loginWithKakaoResponse = await authController.loginWithApple(
      LoginWithAppleRequest(
        idToken: idToken,
      ),
    );
    if (loginWithKakaoResponse.isLeft) {
      return loginWithKakaoResponse.left;
    }
    await tokenService.setToken(
      loginWithKakaoResponse.right.tokenInfo ?? const JwtResponse(),
    );
    _loggedInSuccess(
        redirectUrl: redirectUrl, userId: loginWithKakaoResponse.right.userId);
    return null;
  }

  Future<Failure?> loginWithNaver({
    required String accessToken,
    String? redirectUrl,
  }) async {
    final loginWithNaverResponse = await authController.loginWithNaver(
      LoginWithNaverRequest(
        accessToken: accessToken,
      ),
    );
    if (loginWithNaverResponse.isLeft) {
      return loginWithNaverResponse.left;
    }
    await tokenService.setToken(
      loginWithNaverResponse.right.tokenInfo ?? const JwtResponse(),
    );
    _loggedInSuccess(
        redirectUrl: redirectUrl, userId: loginWithNaverResponse.right.userId);
    return null;
  }

  Future<Failure?> loginWithGoogle({
    required String idToken,
    String? redirectUrl,
  }) async {
    final loginWithGoogleResponse = await authController.loginWithGoogle(
      LoginWithGoogleRequest(
        idToken: idToken,
      ),
    );
    if (loginWithGoogleResponse.isLeft) {
      return loginWithGoogleResponse.left;
    }
    await tokenService.setToken(
      loginWithGoogleResponse.right.tokenInfo ?? const JwtResponse(),
    );
    _loggedInSuccess(
        redirectUrl: redirectUrl, userId: loginWithGoogleResponse.right.userId);
    return null;
  }

  Future<void> logout() async {
    final refreshToken = await refreshTokenManager.loadRefreshToken();
    await authController
        .logout(LogoutRequest(refreshToken: refreshToken ?? ''));
    await refreshTokenManager.removeRefreshToken();
    _logoutWithReason(LogoutReason.userLogout);
    sessionCubit.sessionExpired();
  }

  void _logoutWithReason(LogoutReason reason, {String? url}) {
    if (reason == LogoutReason.userLogout ||
        reason == LogoutReason.sessionExpired) {
      OneSignal.logout();
    }
    emit(AuthStatusLoggedOutState(
      logoutReason: reason,
      url: url,
    ));
  }

  @override
  Future<void> close() async {
    await _sessionSubs?.cancel();
    return super.close();
  }
}
