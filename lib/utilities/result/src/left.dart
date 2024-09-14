import '../result.dart';

class Left<L, R> extends Result<L, R> {
  const Left(this.value);

  final L value;

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  void handle(
      {void Function(L value)? onLeft, void Function(R value)? onRight}) {
    return onLeft?.call(value);
  }

  @override
  T map<T>(
      {required T Function(L value) onLeft,
      required T Function(R value) onRight}) {
    return onLeft.call(value);
  }

  @override
  L get left => value;

  @override
  R get right => throw NoValueError();

  @override
  void handleLeft(void Function(L value) onLeft) {
    onLeft.call(value);
  }

  @override
  void handleRight(void Function(R value) onRight) {}

  @override
  Result<nL, nR> mapResult<nL, nR>({
    required nL Function(L value) onLeft,
    required nR Function(R value) onRight,
  }) {
    return Left(onLeft.call(value));
  }
}
