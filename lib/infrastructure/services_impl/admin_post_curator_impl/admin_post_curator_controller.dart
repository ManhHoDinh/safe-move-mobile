import '../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../application/services/common/common.dart';
import '../../../application/services/post_community/request/src/post_create_request.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class AdminPostCuratorControllerImpl
    with AdminPostCuratorController, DataSourceErrorHandler {
  const AdminPostCuratorControllerImpl({
    required this.adminPostCuratorDataSource,
  });

  final AdminPostCuratorDataSource adminPostCuratorDataSource;

  @override
  Future<Result<Failure, PostResponse>> saveCuratorPost(
      {required PostRequest request}) {
    return handleApiResult(
      future: () =>
          adminPostCuratorDataSource.saveCuratorPost(request: request),
    );
  }

  @override
  Future<Result<Failure, PostResponse>> updateCuratorPost(
      {required int id, required PostRequest request}) {
    return handleApiResult(
      future: () => adminPostCuratorDataSource.updateCuratorPost(
          id: id, request: request),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteCuratorPost(
      {required int id}) {
    return handleApiResult(
      future: () => adminPostCuratorDataSource.deleteCuratorPost(id: id),
    );
  }
}
