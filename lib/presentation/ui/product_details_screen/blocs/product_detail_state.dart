import '../../../../application/services/product/product.dart';

class ProductDetailState {
  const ProductDetailState({
    this.productResponse = const ProductResponse(),
    this.loading = false,
  });

  final ProductResponse productResponse;
  final bool loading;

  ProductDetailState copyWith({
    ProductResponse? productResponse,
    bool? loading,
  }) {
    return ProductDetailState(
      productResponse: productResponse ?? this.productResponse,
      loading: loading ?? this.loading,
    );
  }
}
