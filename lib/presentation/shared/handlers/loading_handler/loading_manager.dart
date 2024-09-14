import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'loading_state.dart';

class LoadingManager extends Cubit<LoadingState> {
  LoadingManager() : super(const InitialLoadingState());

  int _nextOperationId = 0;

  @protected
  int getNextOperationId() {
    return _nextOperationId++;
  }

  // stack
  final _freeLoadingCompleter = Queue<Completer<dynamic>>();

  bool get _freeLoadingInProgress => _freeLoadingCompleter.isNotEmpty;

  void startFreeLoading() {
    if (_freeLoadingInProgress) {
      return;
    }
    final freeLoaderCompleter = Completer<dynamic>();
    final freeLoadingFuture = freeLoaderCompleter.future;
    _freeLoadingCompleter.addLast(freeLoaderCompleter);
    startLoading(
      future: freeLoadingFuture,
    );
  }

  void endFreeLoading() {
    if (!_freeLoadingInProgress) {
      return;
    }
    final freeLoadingCompleter = _freeLoadingCompleter.removeLast();
    freeLoadingCompleter.complete(null);
  }

  Future<T> startLoading<T>({
    required Future<T> future,
  }) async {
    final resolvedOperationId = getNextOperationId();
    handleLoadingWithFuture(
      future: future,
      operationId: resolvedOperationId,
    );
    return future;
  }

  @protected
  void handleLoadingWithFuture({
    required Future<dynamic> future,
    required int operationId,
  }) async {
    emit(EventDrivenLoadingState(
      showing: true,
      operationId: operationId,
    ));
    return future.whenComplete(() {
      emit(EventDrivenLoadingState(
        operationId: operationId,
      ));
    });
  }
}
