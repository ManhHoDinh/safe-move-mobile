import '../../../application/services/social_media/social_media.dart';
import '../../../application/services/user/user.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class SocialMediaControllerImpl
    with SocialMediaController, DataSourceErrorHandler {
  SocialMediaControllerImpl({
    required this.socialMediaDataSource,
  });

  final SocialMediaDataSource socialMediaDataSource;

  @override
  Future<Result<Failure, List<SocialMediaResponse>>> getSocialMediasByUserId(
      {required int userId}) {
    return handleApiResult(
        future: () =>
            socialMediaDataSource.getSocialMediasByUserId(userId: userId));
  }
}
