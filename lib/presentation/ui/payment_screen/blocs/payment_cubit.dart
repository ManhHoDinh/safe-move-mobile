import 'dart:async';

import '../../../../application/services/user_order/user_order.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'payment_state.dart';

class PaymentCubit extends SafeCubit<PaymentState> {
  PaymentCubit({
    required this.userOrderController,
    required this.failureHandlerManager,
    required this.amount,
    required this.orderSessionId,
  }) : super(const PaymentState());

  final UserOrderController userOrderController;
  final FailureHandlerManager failureHandlerManager;
  final double amount;
  final int orderSessionId;

  Future<void> confirmPayment(String paymentKey, String orderId) async {
    final result = await userOrderController.confirmOrder(
        request: ConfirmOrderRequest(
            orderId: orderId,
            paymentKey: paymentKey,
            amount: amount.toString(),
            orderSessionId: orderSessionId));

    result.handleLeft((failure) {
      emit(state.copyWith(paymentSuccess: false));
      return;
    });

    result.handleRight((failure) {
      emit(state.copyWith(paymentSuccess: true));
      return;
    });
  }
}
