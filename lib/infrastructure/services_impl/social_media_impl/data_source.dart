import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/user/user.dart';

part 'data_source.g.dart';

@RestApi()
abstract class SocialMediaDataSource {
  factory SocialMediaDataSource(Dio dio, {String baseUrl}) =
      _SocialMediaDataSource;

  @GET('/v1/social-medias/users/{userId}')
  Future<List<SocialMediaResponse>> getSocialMediasByUserId({
    @Path('userId') required int userId,
  });
}
