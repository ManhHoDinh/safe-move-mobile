import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/response/response.dart';
import '../post_comment.dart';

mixin PostCommentController {
  Future<Result<Failure, PagingResponse<CommentResponse>>> getComments({
    required int postId,
    int? page,
    required int size,
  });

  Future<Result<Failure, CommentResponse>> saveComment({
    required int postId,
    required CommentCreationRequest request,
  });

  Future<Result<Failure, CommentResponse>> editComment({
    required int postId,
    required int commentId,
    required CommentUpdateRequest request,
  });

  Future<Result<Failure, SuccessResponse>> deleteComment({
    required int postId,
    required int commentId,
  });

  Future<Result<Failure, SuccessResponse>> reportComment({
    required int postId,
    required int commentId,
  });

  Future<Result<Failure, PagingResponse<CommentResponse>>> getReportedComments({
    int? page,
    required int size,
  });
}
