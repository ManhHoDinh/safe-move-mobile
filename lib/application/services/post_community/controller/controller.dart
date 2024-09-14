import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../post_community.dart';

mixin PostCommunityController {
  Future<Result<Failure, PagingResponse<PostResponse>>> getCommunityPosts({
    int? categoryId,
    int? page,
    required int size,
    FilterCommunityPost? filter,
    PostLanguage? language,
    String? keyword,
  });

  Future<Result<Failure, PostResponse>> getCommunityPostById({
    required int id,
  });

  Future<Result<Failure, PostResponse>> saveCommunityPost({
    required PostRequest request,
  });

  Future<Result<Failure, PostResponse>> updateCommunityPost({
    required PostRequest request,
    required int id,
  });

  Future<Result<Failure, SuccessResponse>> deleteCommunityPost({
    required int id,
  });

  Future<Result<Failure, SuccessResponse>> reportCommunityPost({
    required int id,
  });

  Future<Result<Failure, PagingResponse<PostResponse>>>
      getReportedCommunityPosts({
    int? page,
    required int size,
    PostLanguage? language,
    String? keyword,
  });
}
