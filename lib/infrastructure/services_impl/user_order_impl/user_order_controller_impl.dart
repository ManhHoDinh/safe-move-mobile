import '../../../application/services/common/common.dart';
import '../../../application/services/user_order/user_order.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserOrderControllerImpl with UserOrderController, DataSourceErrorHandler {
  UserOrderControllerImpl({
    required this.userOrderDataSource,
  });

  final UserOrderDataSource userOrderDataSource;

  @override
  Future<Result<Failure, PagingResponse<OrderResponse>>> getOrders(
      {int? page, required int size, OrderStatusType? status}) {
    return handleApiResult(
      future: () => userOrderDataSource.getOrders(
          page: page, size: size, status: encodeOrderStatusType(status)),
    );
  }

  @override
  Future<Result<Failure, OrderResponse>> getOrderById({required int id}) {
    return handleApiResult(
        future: () => userOrderDataSource.getOrderById(id: id));
  }

  @override
  Future<Result<Failure, SuccessResponse>> cancelOrder(
      {required CancelOrderRequest request}) {
    return handleApiResult(
        future: () => userOrderDataSource.cancelOrder(request: request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> confirmOrder(
      {required ConfirmOrderRequest request}) {
    return handleApiResult(
        future: () => userOrderDataSource.confirmOrder(request: request));
  }
}
