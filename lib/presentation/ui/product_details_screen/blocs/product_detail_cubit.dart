import '../../../../application/services/product/product.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'product_detail_state.dart';

class ProductDetailCubit extends SafeCubit<ProductDetailState> {
  ProductDetailCubit({
    required this.productController,
    required this.failureHandlerManager,
    required this.id,
  }) : super(const ProductDetailState()) {
    _fetchData();
  }

  final ProductController productController;
  final FailureHandlerManager failureHandlerManager;
  final int id;

  Future<void> _fetchData() async {
    emit(state.copyWith(loading: true));
    final result = await productController.getProductById(id: id);

    result.handleLeft((failure) {
      emit(state.copyWith(loading: false));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(productResponse: value, loading: false));
    });
  }

  void reload() {
    _fetchData();
  }
}
