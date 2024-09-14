import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../user/user.dart';

mixin SocialMediaController {
  Future<Result<Failure, List<SocialMediaResponse>>> getSocialMediasByUserId({
    required int userId,
  });
}
