import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../user/user.dart';

mixin ProfileUrlController {
  Future<Result<Failure, List<ProfileUrlResponse>>> getProfileUrlByUserId(
      {required int userId});
}
