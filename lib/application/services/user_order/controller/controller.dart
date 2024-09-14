import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../user_order.dart';

mixin UserOrderController {
  Future<Result<Failure, PagingResponse<OrderResponse>>> getOrders({
    int? page,
    required int size,
    OrderStatusType? status,
  });

  Future<Result<Failure, OrderResponse>> getOrderById({
    required int id,
  });

  Future<Result<Failure, SuccessResponse>> cancelOrder({
    required CancelOrderRequest request,
  });

  Future<Result<Failure, SuccessResponse>> confirmOrder({
    required ConfirmOrderRequest request,
  });
}
