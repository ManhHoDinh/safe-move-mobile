import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/failures/persistent/persistent.dart';
import '../../../application/services/app/app_data/app_username_service.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

class AppUsernameServiceImpl with AppUsernameService {
  const AppUsernameServiceImpl({
    required this.preferences,
  });

  final SharedPreferences preferences;

  static const _appUsernameKey = 'SM-username';

  @override
  Future<Result<Failure, void>> deleteUsernameService() async {
    try {
      await preferences.remove(_appUsernameKey);
      return const Right(null);
    } catch (error) {
      return const Left(PersistentDeleteFailure());
    }
  }

  @override
  Future<Result<Failure, String?>> loadUsername() async {
    try {
      final String? savedUsername = preferences.getString(_appUsernameKey);
      return Right(savedUsername);
    } catch (error) {
      return const Left(PersistentReadFailure());
    }
  }

  @override
  Future<Result<Failure, void>> saveUsernameService(String username) async {
    try {
      await preferences.setString(_appUsernameKey, username);
      return const Right(null);
    } catch (error) {
      return const Left(PersistentWriteFailure());
    }
  }
}
