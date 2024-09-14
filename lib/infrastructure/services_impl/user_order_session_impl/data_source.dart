import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../application/services/user_order_session/user_order_session.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserOrderSessionDataSource {
  factory UserOrderSessionDataSource(Dio dio, {String baseUrl}) =
      _UserOrderSessionDataSource;

  @POST('/v1/user/order-session')
  Future<OrderSessionResponse> upsertOrderSession(
      @Body() OrderSessionCreateRequest request);

  @GET('/v1/user/order-session')
  Future<OrderSessionResponse> getOrderSession();
}
