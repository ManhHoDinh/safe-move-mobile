import '../../../../application/services/user_cart/user_cart.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'product_detail_state.dart';

class ProductDetailCubit extends SafeCubit<ProductDetailState> {
  ProductDetailCubit({
    required this.userCartController,
    required this.failureHandlerManager,
    required this.productId,
  }) : super(const ProductDetailState());

  final UserCartController userCartController;
  final FailureHandlerManager failureHandlerManager;
  final String productId;
}
