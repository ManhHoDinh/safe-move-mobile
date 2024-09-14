import 'package:logger/logger.dart';

import 'loggable.dart';

class ConsoleLogger implements Loggable {
  const ConsoleLogger(this.logger);

  final Logger logger;

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    return logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    return logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    return logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    return logger.w(message, error: error, stackTrace: stackTrace);
  }
}
