import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../application/services/user/response/response.dart';

part 'data_source.g.dart';

@RestApi()
abstract class ProfileUrlDataSource {
  factory ProfileUrlDataSource(Dio dio, {String baseUrl}) =
      _ProfileUrlDataSource;

  @GET('/v1/profile-urls/users/{userId}')
  Future<List<ProfileUrlResponse>> getProfileUrlByUserId({
    @Path('userId') int? userId,
  });
}
