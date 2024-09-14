import '../../../../application/services/user_order_session/user_order_session.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'order_session_detail_state.dart';

class OrderSessionCubit extends SafeCubit<OrderSessionState> {
  OrderSessionCubit({
    required this.orderSessionController,
    required this.failureHandlerManager,
    required this.loadingManager,
    this.isFetching = true,
  }) : super(const OrderSessionState()) {
    if (isFetching) {
      _fetchData();
    }
  }

  final UserOrderSessionController orderSessionController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final bool isFetching;

  void resetApiPostStatus() {
    emit(state.copyWith(apiPostStatus: ApiStatus.initial));
  }

  void setCheckboxValue(bool value) {
    emit(state.copyWith(checkBoxValue: value));
  }

  void setDiscountPrice(String price) {
    if (state.orderSessionResponse?.discountPrice == null) {
      return;
    }

    emit(state.copyWith(
        discountField: DiscountField.dirty(
            value: price,
            maxDiscount:
                state.orderSessionResponse!.maxDiscountPrice!.truncate())));
    return;
  }

  Future<void> _fetchData() async {
    emit(state.copyWith(loading: true));
    final result = await orderSessionController.getOrderSession();

    result.handleLeft((failure) {
      emit(state.copyWith(loading: false));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(
        orderSessionResponse: value,
        discountField: DiscountField.dirty(
            value: value.discountPrice?.truncate().toString() ?? '',
            maxDiscount: value.maxDiscountPrice?.truncate() ?? 0),
        loading: false,
      ));
    });
  }

  Future<void> createOrderSession({
    int? addressId,
    double? discountPrice,
    required List<OrderDetailsSessionCreateRequest>
        orderDetailsSessionCreateRequests,
  }) async {
    resetApiPostStatus();
    final futureLoadingOrder = orderSessionController.upsertOrderSession(
      OrderSessionCreateRequest(
        addressId: addressId,
        discountPrice: discountPrice,
        orderDetailSessionCreateRequests: orderDetailsSessionCreateRequests,
      ),
    );

    final result =
        await loadingManager.startLoading(future: futureLoadingOrder);

    result.handleLeft((value) {
      emit(state.copyWith(apiPostStatus: ApiStatus.loading));
      failureHandlerManager.handle(value);
    });
    result.handleRight((value) {
      emit(state.copyWith(
        orderSessionResponse: value,
        discountField: DiscountField.dirty(
            value: value.discountPrice?.truncate().toString() ?? '',
            maxDiscount: value.maxDiscountPrice?.truncate() ?? 0),
        apiPostStatus: ApiStatus.success,
      ));
    });
  }

  void reload() {
    _fetchData();
  }
}
