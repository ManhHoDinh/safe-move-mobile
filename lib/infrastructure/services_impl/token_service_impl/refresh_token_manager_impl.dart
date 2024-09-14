import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/services/app/token_service/refresh_token_manager.dart';
import '../../../application/services/auth/auth.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

class RefreshTokenManagerImpl implements RefreshTokenManager {
  const RefreshTokenManagerImpl({
    required this.authController,
    required this.prefs,
  });

  final AuthController authController;
  final SharedPreferences prefs;

  static const _refreshTokenKey = 'SM-refreshToken';

  @override
  Future<String?> loadRefreshToken() async {
    return prefs.getString(_refreshTokenKey);
  }

  @override
  Future<Result<Failure, JwtResponse>> performRefreshToken(
      String oldTokens) async {
    final refreshTokenResult = await authController
        .refreshToken(RefreshTokenRequest(refreshToken: oldTokens));
    return refreshTokenResult.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) => value.tokenInfo ?? const JwtResponse(),
    );
  }

  @override
  Future<void> removeRefreshToken() {
    return prefs.remove(_refreshTokenKey);
  }

  @override
  Future<void> saveRefreshToken(String token) {
    return prefs.setString(_refreshTokenKey, token);
  }

  @override
  Future<bool> oldSessionExisted() async {
    final oldToken = await loadRefreshToken();
    return oldToken != null && oldToken.isNotEmpty;
  }
}
