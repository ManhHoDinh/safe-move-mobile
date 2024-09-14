import '../../../../application/services/user_order/user_order.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'order_detail_state.dart';

class OrderDetailCubit extends SafeCubit<OrderDetailState> {
  OrderDetailCubit({
    required this.orderController,
    required this.failureHandlerManager,
    required this.id,
  }) : super(const OrderDetailState()) {
    _fetchData();
  }

  final UserOrderController orderController;
  final FailureHandlerManager failureHandlerManager;
  final int id;

  Future<void> _fetchData() async {
    emit(state.copyWith(loading: true));
    final result = await orderController.getOrderById(
      id: id,
    );

    result.handleLeft((failure) {
      emit(state.copyWith(loading: false));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(
        orderResponse: value,
        loading: false,
      ));
    });
  }

  void reload() {
    _fetchData();
  }
}
