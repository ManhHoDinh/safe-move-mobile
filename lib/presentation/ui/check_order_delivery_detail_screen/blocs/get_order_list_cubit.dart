import '../../../../application/services/user_order/user_order.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import 'get_order_list_state.dart';

class GetOrderListCubit
    extends InfiniteLoaderCubit<GetOrderListState, OrderResponse> {
  GetOrderListCubit({
    required super.failureHandlerManager,
    required this.orderController,
  }) : super(initialState: const GetOrderListState());

  final UserOrderController orderController;

  void onChangeFilterOrderStatus(OrderStatusType? filterOrderStatus) {
    emit(state.copyWithFilterOrderStatus(filterOrderStatus: filterOrderStatus));
    reload();
  }

  void cancelOrder(int orderId) async {
    final result = await orderController.cancelOrder(
      request: CancelOrderRequest(orderId: orderId),
    );
    result.handleLeft((failure) {
      failureHandlerManager.handle(failure);
    });
    if (result.isRight) {
      reload();
    }
  }

  @override
  Future<Result<Failure, PageableData<OrderResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await orderController.getOrders(
      size: pageSize,
      page: page,
      status: state.filterOrderStatus,
    );
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        return PageableData(
          totalItems: value.totalElements ?? 0,
          totalPages: totalPages,
          data: data,
        );
      },
    );
  }
}
