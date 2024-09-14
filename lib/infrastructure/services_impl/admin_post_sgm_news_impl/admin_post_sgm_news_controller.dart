import '../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../application/services/common/common.dart';
import '../../../application/services/post_community/request/src/post_create_request.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class AdminPostSgmNewsControllerImpl
    with AdminPostSgmNewsController, DataSourceErrorHandler {
  const AdminPostSgmNewsControllerImpl({
    required this.adminPostSgmNewsDataSource,
  });

  final AdminPostSgmNewsDataSource adminPostSgmNewsDataSource;

  @override
  Future<Result<Failure, PostResponse>> saveSgmNewsPost(
      {required PostRequest request}) {
    return handleApiResult(
      future: () =>
          adminPostSgmNewsDataSource.saveSgmNewsPost(request: request),
    );
  }

  @override
  Future<Result<Failure, PostResponse>> updateSgmNewsPost(
      {required int id, required PostRequest request}) {
    return handleApiResult(
      future: () => adminPostSgmNewsDataSource.updateSgmNewsPost(
          id: id, request: request),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteSgmNewsPost(
      {required int id}) {
    return handleApiResult(
      future: () => adminPostSgmNewsDataSource.deleteSgmNewsPost(id: id),
    );
  }
}
