import '../../../application/services/profile_url/controller/controller.dart';
import '../../../application/services/user/response/src/profile_url_response.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class ProfileUrlControllerImpl
    with ProfileUrlController, DataSourceErrorHandler {
  const ProfileUrlControllerImpl({
    required this.profileUrlDataSource,
  });

  final ProfileUrlDataSource profileUrlDataSource;

  @override
  Future<Result<Failure, List<ProfileUrlResponse>>> getProfileUrlByUserId(
      {required int userId}) {
    return handleApiResult(
        future: () =>
            profileUrlDataSource.getProfileUrlByUserId(userId: userId));
  }
}
