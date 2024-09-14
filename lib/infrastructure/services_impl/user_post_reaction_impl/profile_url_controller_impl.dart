import '../../../application/services/common/response/src/success_response.dart';
import '../../../application/services/user_post_reaction/controller/controller.dart';
import '../../../application/services/user_post_reaction/request/src/post_reaction_request.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserPostReactionControllerImpl
    with UserPostReactionController, DataSourceErrorHandler {
  const UserPostReactionControllerImpl({
    required this.userPostReactionDataSource,
  });

  final UserPostReactionDataSource userPostReactionDataSource;

  @override
  Future<Result<Failure, SuccessResponse>> reactPost(
      {required int postId, required PostReactionRequest request}) {
    return handleApiResult(
        future: () => userPostReactionDataSource.reactPost(
            postId: postId, request: request));
  }
}
