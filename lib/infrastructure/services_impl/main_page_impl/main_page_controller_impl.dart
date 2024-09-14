import '../../../application/services/common/response/src/post_response.dart';
import '../../../application/services/main_page/dto/src/main_page_type.dart';
import '../../../application/services/main_page/main_page.dart';
import '../../../application/services/main_page/response/src/main_page_title_response.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class MainPageControllerImpl with MainPageController, DataSourceErrorHandler {
  const MainPageControllerImpl({
    required this.mainPageDataSource,
  });

  final MainPageDataSource mainPageDataSource;

  @override
  Future<Result<Failure, List<PostResponse>>> getPostsInMainPage(
      {required MainPageType mainPageType}) {
    return handleApiResult(
        future: () =>
            mainPageDataSource.getPostsInMainPage(mainPageType: mainPageType));
  }

  @override
  Future<Result<Failure, MainPageTitleResponse>> getMainPageTitles() {
    return handleApiResult(future: () => mainPageDataSource.getMainPageTitle());
  }
}
