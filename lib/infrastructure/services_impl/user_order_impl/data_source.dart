import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/common/response/response.dart';
import '../../../application/services/user_order/user_order.dart';

part 'data_source.g.dart';

@RestApi()
abstract class UserOrderDataSource {
  factory UserOrderDataSource(Dio dio, {String baseUrl}) = _UserOrderDataSource;

  @GET('/v1/user/orders')
  Future<PagingResponse<OrderResponse>> getOrders({
    @Query('page') int? page,
    @Query('size') required int size,
    @Query('status') String? status,
  });

  @GET('/v1/user/orders/{id}')
  Future<OrderResponse> getOrderById({
    @Path('id') required int id,
  });

  @POST('/v1/user/orders/cancel')
  Future<SuccessResponse> cancelOrder({
    @Body() required CancelOrderRequest request,
  });

  @POST('/v1/user/orders/confirm')
  Future<SuccessResponse> confirmOrder({
    @Body() required ConfirmOrderRequest request,
  });
}
