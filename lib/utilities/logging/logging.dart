import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'src/console_logger.dart';
import 'src/loggable.dart';
import 'src/null_logger.dart';

ConsoleLogger _initConsoleLogger() {
  final logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 2,
      methodCount: 4,
      errorMethodCount: 10,
    ),
  );
  return ConsoleLogger(logger);
}

Loggable _setupLogger() {
  final Loggable loggable;
  if (kDebugMode) {
    final logger = CompositeLogger();
    final consoleLogger = _initConsoleLogger();
    logger.addLoggable(consoleLogger);
    loggable = logger;
  } else {
    loggable = NullLogger();
  }

  return loggable;
}

Loggable? _logger;

Loggable get logging {
  _logger ??= _setupLogger();
  return _logger!;
}
