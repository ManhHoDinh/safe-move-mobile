import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/user_post_reaction/user_post_reaction.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserPostReactionDataSource {
  factory UserPostReactionDataSource(Dio dio, {String baseUrl}) =
      _UserPostReactionDataSource;

  @PATCH('/v1/user/posts/{postId}/reaction')
  Future<SuccessResponse> reactPost(
      {@Body() required PostReactionRequest request,
      @Path('postId') required int postId});
}
