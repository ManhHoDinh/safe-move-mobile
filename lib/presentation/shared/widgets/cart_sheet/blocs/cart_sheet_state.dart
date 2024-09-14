class CartSheetState {
  const CartSheetState({
    this.quantity = 1,
    this.price = 0,
    this.isSuccess = false,
  });

  final int quantity;
  final double price;
  final bool isSuccess;

  CartSheetState copyWith({
    int? quantity,
    double? price,
    bool? isSuccess,
  }) {
    return CartSheetState(
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
