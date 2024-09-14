import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../dto/dto.dart';
import '../response/src/main_page_title_response.dart';

mixin MainPageController {
  Future<Result<Failure, List<PostResponse>>> getPostsInMainPage(
      {required MainPageType mainPageType});
  Future<Result<Failure, MainPageTitleResponse>> getMainPageTitles();
}
