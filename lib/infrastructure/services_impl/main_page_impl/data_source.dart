import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/main_page/dto/dto.dart';
import '../../../application/services/main_page/response/src/main_page_title_response.dart';

part 'data_source.g.dart';

@RestApi()
abstract class MainPageDataSource {
  factory MainPageDataSource(Dio dio, {String baseUrl}) = _MainPageDataSource;

  @GET('/v1/main-pages/{mainPageType}/posts')
  Future<List<PostResponse>> getPostsInMainPage({
    @Path('mainPageType') required MainPageType mainPageType,
  });

  @GET('/v1/main-pages/titles')
  Future<MainPageTitleResponse> getMainPageTitle();
}
