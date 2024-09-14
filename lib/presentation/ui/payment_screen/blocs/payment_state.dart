class PaymentState {
  const PaymentState({
    this.paymentSuccess,
  });

  final bool? paymentSuccess;

  PaymentState copyWith({
    bool? paymentSuccess,
  }) {
    return PaymentState(
      paymentSuccess: paymentSuccess ?? this.paymentSuccess,
    );
  }
}
