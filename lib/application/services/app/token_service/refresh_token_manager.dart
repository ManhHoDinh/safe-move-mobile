import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../auth/auth.dart';

abstract interface class RefreshTokenManager {
  Future<String?> loadRefreshToken();

  Future<bool> oldSessionExisted();

  Future<void> removeRefreshToken();

  Future<void> saveRefreshToken(String token);

  Future<Result<Failure, JwtResponse>> performRefreshToken(String oldTokens);
}
