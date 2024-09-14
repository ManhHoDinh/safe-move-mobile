import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../post_sgm_news.dart';

mixin PostSgmNewsController {
  Future<Result<Failure, PagingResponse<PostResponse>>> getPostSgmNews({
    FilterSgmNewsType? filter,
    int? page,
    required int size,
    String? keyword,
    PostLanguage? postLanguage,
  });

  Future<Result<Failure, PostResponse>> getPostSgmNewsById({
    required int id,
  });
}
