class CartState {
  const CartState({
    this.quantity = 1,
  });

  final int quantity;

  CartState copyWith({
    int? quantity,
  }) {
    return CartState(
      quantity: quantity ?? this.quantity,
    );
  }
}
