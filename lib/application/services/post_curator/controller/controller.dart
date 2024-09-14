import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';

mixin PostCuratorController {
  Future<Result<Failure, PagingResponse<PostResponse>>> getCuratorPosts({
    PostLanguage? postLanguage,
    int? parentCategoryId,
    List<int>? childCategoryIds,
    int? page,
    required int size,
    String? keyword,
  });

  Future<Result<Failure, PostResponse>> getCuratorPostById({
    required int id,
  });
}
