import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../user_post_reaction.dart';

mixin UserPostReactionController {
  Future<Result<Failure, SuccessResponse>> reactPost(
      {required int postId, required PostReactionRequest request});
}
