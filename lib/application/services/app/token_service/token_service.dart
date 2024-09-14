import 'package:flutter/foundation.dart';

import '../../auth/auth.dart';
import 'refresh_token_manager.dart';

typedef ExpiredTokenCallback = void Function();

class RefreshTokenResult {
  const RefreshTokenResult({
    required this.success,
    required this.jwtResponse,
  });

  final bool success;
  final JwtResponse? jwtResponse;
}

class TokenService extends ChangeNotifier {
  TokenService({required this.refreshTokenManager});

  final RefreshTokenManager refreshTokenManager;

  @override
  @protected
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  @protected
  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
  }

  /// add listener for expired tokens
  void addTokenExpiredCallback(ExpiredTokenCallback callback) {
    addListener(callback);
  }

  /// remove listener for expired tokens
  void removeTokenExpiredCallback(ExpiredTokenCallback callback) {
    removeListener(callback);
  }

  @protected
  void performCallback() {
    notifyListeners();
  }

  /// manually call all registered expired callback
  @mustCallSuper
  void triggerExpired() {
    performCallback();
  }

  String? _accessToken;

  String? get accessToken => _accessToken;

  @mustCallSuper
  @protected
  void setTokenInternal(covariant JwtResponse token) {
    _accessToken = token.token;
  }

  /// save refresh token and set/ save current token information
  Future<void> setToken(covariant JwtResponse token) async {
    setTokenInternal(token);
    if (token.refreshToken != null) {
      await refreshTokenManager.saveRefreshToken(token.refreshToken!);
    }
  }

  /// call refresh token and set current info
  Future<RefreshTokenResult> refreshTokens(
      {bool shouldTriggerExpired = true}) async {
    final oldRefreshToken = await refreshTokenManager.loadRefreshToken();
    if (oldRefreshToken == null) {
      if (shouldTriggerExpired) {
        triggerExpired();
      }
      return const RefreshTokenResult(success: false, jwtResponse: null);
    }

    final tokenResponse =
        await refreshTokenManager.performRefreshToken(oldRefreshToken);
    if (tokenResponse.isLeft) {
      if (shouldTriggerExpired) {
        triggerExpired();
      }
      return const RefreshTokenResult(success: false, jwtResponse: null);
    }
    await setToken(tokenResponse.right);
    return RefreshTokenResult(success: true, jwtResponse: tokenResponse.right);
  }

  /// clear runtime tokens data
  @mustCallSuper
  void clearRuntimeTokens() {
    _accessToken = null;
  }
}
