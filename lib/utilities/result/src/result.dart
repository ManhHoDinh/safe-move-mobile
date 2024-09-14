abstract class Result<L, R> {
  const Result();

  bool get isRight;

  bool get isLeft;

  R get right;

  L get left;

  static bool hasFailure(List<Result<dynamic, dynamic>> results) {
    for (final result in results) {
      if (result.isLeft) {
        return true;
      }
    }
    return false;
  }

  void handle(
      {void Function(L value)? onLeft, void Function(R value)? onRight});

  void handleLeft(void Function(L value) onLeft);

  void handleRight(void Function(R value) onRight);

  T map<T>({
    required T Function(L value) onLeft,
    required T Function(R value) onRight,
  });

  Result<nL, nR> mapResult<nL, nR>({
    required nL Function(L value) onLeft,
    required nR Function(R value) onRight,
  });
}
