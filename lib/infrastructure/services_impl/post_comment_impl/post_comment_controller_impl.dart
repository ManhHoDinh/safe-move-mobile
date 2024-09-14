import 'package:meta/meta.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_comment/post_comment.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class PostCommentControllerImpl
    with PostCommentController, DataSourceErrorHandler {
  const PostCommentControllerImpl({
    required this.postCommentDataSource,
  });

  final PostCommentDataSource postCommentDataSource;

  @override
  Future<Result<Failure, PagingResponse<CommentResponse>>> getComments({
    required int postId,
    int? page,
    required int size,
  }) {
    return handleApiResult(
      future: () => postCommentDataSource.getComments(
        postId: postId,
        page: page,
        size: size,
      ),
    );
  }

  @override
  Future<Result<Failure, CommentResponse>> saveComment(
      {required int postId, required CommentCreationRequest request}) {
    return handleApiResult(
      future: () => postCommentDataSource.saveComment(
        postId: postId,
        request: request,
      ),
    );
  }

  @override
  Future<Result<Failure, CommentResponse>> editComment(
      {required int postId,
      required int commentId,
      required CommentUpdateRequest request}) {
    return handleApiResult(
      future: () => postCommentDataSource.editComment(
        postId: postId,
        commentId: commentId,
        request: request,
      ),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteComment(
      {required int postId, required int commentId}) {
    return handleApiResult(
      future: () => postCommentDataSource.deleteComment(
        postId: postId,
        commentId: commentId,
      ),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> reportComment(
      {required int postId, required int commentId}) {
    return handleApiResult(
      future: () => postCommentDataSource.reportComment(
        postId: postId,
        commentId: commentId,
      ),
    );
  }

  @override
  Future<Result<Failure, PagingResponse<CommentResponse>>> getReportedComments({
    int? page,
    required int size,
  }) {
    return handleApiResult(
      future: () =>
          postCommentDataSource.getReportedComments(size: size, page: page),
    );
  }
}
