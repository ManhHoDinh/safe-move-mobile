import 'exceptions.dart';
import 'result.dart';

class Right<L, R> extends Result<L, R> {
  const Right(this.value);

  final R value;

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  void handle(
      {void Function(L value)? onLeft, void Function(R value)? onRight}) {
    return onRight?.call(value);
  }

  @override
  T map<T>(
      {required T Function(L value) onLeft,
      required T Function(R value) onRight}) {
    return onRight.call(value);
  }

  @override
  L get left => throw NoValueError();

  @override
  R get right => value;

  @override
  void handleLeft(void Function(L value) onLeft) {}

  @override
  void handleRight(void Function(R value) onRight) {
    onRight.call(value);
  }

  @override
  Result<nL, nR> mapResult<nL, nR>({
    required nL Function(L value) onLeft,
    required nR Function(R value) onRight,
  }) {
    return Right(onRight.call(value));
  }
}
