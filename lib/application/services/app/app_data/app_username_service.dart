import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';

mixin AppUsernameService {
  Future<Result<Failure, String?>> loadUsername();

  Future<Result<Failure, void>> saveUsernameService(String username);

  Future<Result<Failure, void>> deleteUsernameService();
}
