int calculateDiscount(double? currentPrice, double? originalPrice) {
  if (currentPrice == null ||
      originalPrice == null ||
      currentPrice > originalPrice) {
    return 0;
  }
  return ((1 - currentPrice / originalPrice) * 100).toInt();
}
