import 'loggable.dart';

class NullLogger implements Loggable {
  @override
  void d(message, [error, StackTrace? stackTrace]) {}

  @override
  void e(message, [error, StackTrace? stackTrace]) {}

  @override
  void i(message, [error, StackTrace? stackTrace]) {}

  @override
  void w(message, [error, StackTrace? stackTrace]) {}
}
