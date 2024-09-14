import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/post_sgm_news/post_sgm_news.dart';

part 'data_source.g.dart';

@RestApi()
abstract class PostSgmNewsDataSource {
  factory PostSgmNewsDataSource(Dio dio, {String baseUrl}) =
      _PostSgmNewsDataSource;

  @GET('/v1/posts/sgm-news')
  Future<PagingResponse<PostResponse>> getPostSgmNews({
    @Query('postLanguage') PostLanguage? postLanguage,
    @Query('filter') FilterSgmNewsType? filter,
    @Query('page') int? page,
    @Query('keyword') String? keyword,
    @Query('size') required int size,
  });

  @GET('/v1/posts/sgm-news/{id}')
  Future<PostResponse> getPostSgmNewsById({
    @Path('id') required int id,
  });
}
