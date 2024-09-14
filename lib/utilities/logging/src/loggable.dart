abstract class Loggable {
  const Loggable();

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]);
}

class CompositeLogger implements Loggable {
  final List<Loggable> _loggable = [];

  void addLoggable(Loggable loggable) {
    _loggable.add(loggable);
  }

  void removeLoggable(Loggable loggable) {
    _loggable.remove(loggable);
  }

  @override
  void d(message, [error, StackTrace? stackTrace]) {
    for (final loggable in _loggable) {
      loggable.d(message, error, stackTrace);
    }
  }

  @override
  void e(message, [error, StackTrace? stackTrace]) {
    for (final loggable in _loggable) {
      loggable.e(message, error, stackTrace);
    }
  }

  @override
  void i(message, [error, StackTrace? stackTrace]) {
    for (final loggable in _loggable) {
      loggable.i(message, error, stackTrace);
    }
  }

  @override
  void w(message, [error, StackTrace? stackTrace]) {
    for (final loggable in _loggable) {
      loggable.w(message, error, stackTrace);
    }
  }
}
