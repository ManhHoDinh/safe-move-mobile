import '../../../../application/services/user_order/user_order.dart';

class OrderDetailState {
  const OrderDetailState({
    this.orderResponse,
    this.loading = false,
  });
  final OrderResponse? orderResponse;
  final bool loading;

  OrderDetailState copyWith({
    OrderResponse? orderResponse,
    bool? loading,
  }) {
    return OrderDetailState(
      orderResponse: orderResponse ?? this.orderResponse,
      loading: loading ?? this.loading,
    );
  }
}
