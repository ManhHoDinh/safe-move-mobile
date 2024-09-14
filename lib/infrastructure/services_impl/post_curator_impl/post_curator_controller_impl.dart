import '../../../application/services/common/dto/src/language_type.dart';
import '../../../application/services/common/response/src/paging_response.dart';
import '../../../application/services/common/response/src/post_response.dart';
import '../../../application/services/post_curator/controller/controller.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class PostCuratorControllerImpl
    with PostCuratorController, DataSourceErrorHandler {
  const PostCuratorControllerImpl({
    required this.postCuratorDataSource,
  });

  final PostCuratorDataSource postCuratorDataSource;

  @override
  Future<Result<Failure, PostResponse>> getCuratorPostById({required int id}) {
    return handleApiResult(
      future: () => postCuratorDataSource.getCuratorPostById(id: id),
    );
  }

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getCuratorPosts({
    PostLanguage? postLanguage,
    int? parentCategoryId,
    List<int>? childCategoryIds,
    int? page,
    required int size,
    String? keyword,
  }) {
    return handleApiResult(
      future: () => postCuratorDataSource.getCuratorPosts(
        postLanguage: postLanguage,
        parentCategoryId: parentCategoryId,
        childCategoryIds: childCategoryIds,
        page: page,
        size: size,
        keyword: keyword,
      ),
    );
  }
}
