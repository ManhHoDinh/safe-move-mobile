import '../../../application/services/common/common.dart';
import '../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class PostSgmNewsControllerImpl
    with PostSgmNewsController, DataSourceErrorHandler {
  const PostSgmNewsControllerImpl({
    required this.postSgmNewsDataSource,
  });

  final PostSgmNewsDataSource postSgmNewsDataSource;

  @override
  Future<Result<Failure, PagingResponse<PostResponse>>> getPostSgmNews({
    FilterSgmNewsType? filter,
    int? page,
    required int size,
    String? keyword,
    PostLanguage? postLanguage,
  }) {
    return handleApiResult(
      future: () => postSgmNewsDataSource.getPostSgmNews(
        postLanguage: postLanguage,
        filter: filter,
        page: page,
        size: size,
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<Failure, PostResponse>> getPostSgmNewsById({required int id}) {
    return handleApiResult(
      future: () => postSgmNewsDataSource.getPostSgmNewsById(id: id),
    );
  }
}
