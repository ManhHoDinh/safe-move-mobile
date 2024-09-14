import '../../../application/services/common/common.dart';
import '../../../application/services/post_community/controller/controller.dart';
import '../../../application/services/post_community/dto/src/filter_community_post.dart';
import '../../../application/services/post_community/request/src/post_create_request.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class PostCommunityControllerImpl
    with PostCommunityController, DataSourceErrorHandler {
  const PostCommunityControllerImpl({
    required this.postCommunityDataSource,
  });

  final PostCommunityDataSource postCommunityDataSource;

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getCommunityPosts({
    int? categoryId,
    int? page,
    required int size,
    FilterCommunityPost? filter,
    PostLanguage? language,
    String? keyword,
  }) {
    return handleApiResult(
      future: () => postCommunityDataSource.getCommunityPosts(
        categoryId: categoryId,
        postLanguage: language,
        page: page,
        size: size,
        filter: filter,
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<Failure, PostResponse>> getCommunityPostById(
      {required int id}) {
    return handleApiResult(
      future: () => postCommunityDataSource.getCommunityPostById(id: id),
    );
  }

  @override
  Future<Result<Failure, PostResponse>> saveCommunityPost(
      {required PostRequest request}) {
    return handleApiResult(
      future: () => postCommunityDataSource.saveCommunityPost(request: request),
    );
  }

  @override
  Future<Result<Failure, PostResponse>> updateCommunityPost(
      {required PostRequest request, required int id}) {
    return handleApiResult(
      future: () =>
          postCommunityDataSource.updateCommunityPost(request: request, id: id),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteCommunityPost(
      {required int id}) {
    return handleApiResult(
      future: () => postCommunityDataSource.deleteCommunityPost(id: id),
    );
  }

  @override
  Future<Result<Failure, SuccessResponse>> reportCommunityPost(
      {required int id}) {
    return handleApiResult(
      future: () => postCommunityDataSource.reportCommunityPost(id: id),
    );
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getReportedCommunityPosts({
    int? categoryId,
    int? page,
    required int size,
    FilterCommunityPost? filter,
    PostLanguage? language,
    String? keyword,
  }) {
    return handleApiResult(
      future: () => postCommunityDataSource.getReportedCommunityPosts(
        postLanguage: language,
        page: page,
        size: size,
        keyword: keyword,
      ),
    );
  }

}
