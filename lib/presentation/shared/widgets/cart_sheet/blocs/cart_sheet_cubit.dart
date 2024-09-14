import '../../../../../application/services/user_cart/user_cart.dart';
import '../../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../handlers/failure_handler/failure_handler_manager.dart';
import '../../../handlers/loading_handler/loading_manager.dart';
import 'cart_sheet_state.dart';

class CartSheetCubit extends SafeCubit<CartSheetState> {
  CartSheetCubit({
    required this.userCartController,
    required this.failureHandlerManager,
    required this.productId,
    required this.initialPrice,
    required this.loadingManager,
  }) : super(CartSheetState(price: initialPrice));

  final UserCartController userCartController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final int productId;
  final double initialPrice;

  void onAddQuantity() {
    emit(state.copyWith(
      quantity: state.quantity + 1,
      price: state.price + initialPrice,
    ));
  }

  void onSubtractQuantity() {
    if (state.quantity < 2) {
      return;
    }
    emit(state.copyWith(
      quantity: state.quantity - 1,
      price: state.price + initialPrice,
    ));
  }

  void onAddToCart() async {
    final addCartLoading = userCartController.addCart(CartCreateRequest(
      productId: productId,
      quantity: state.quantity,
    ));
    final resultAddCart =
        await loadingManager.startLoading(future: addCartLoading);

    resultAddCart.handleLeft((value) {
      failureHandlerManager.handle(value);
    });

    emit(state.copyWith(isSuccess: true));
  }
}
