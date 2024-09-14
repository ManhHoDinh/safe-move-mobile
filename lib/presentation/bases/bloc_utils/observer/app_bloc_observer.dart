import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

/// Black: \x1B[30m
/// !Red: \x1B[31m
/// *Green: \x1B[32m
/// Yellow: \x1B[33m
/// ?Blue: \u001b[34m
/// Magenta: \x1B[35m
/// Cyan: \x1B[36m
/// White: \x1B[37m
/// Reset: \x1B[0m

class AppBlocObserver extends BlocObserver {
  final String blocObserverStr = 'BLOC';

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    if (kDebugMode) {
      debugPrint('\x1B[33mInit ${bloc.runtimeType}');
    }
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    if (kDebugMode) {
      debugPrint('\x1B[31mClose ${bloc.runtimeType}');
    }
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    if (kDebugMode) {
      debugPrint(
          '\x1B[33m[${bloc.runtimeType}]\x1B[0m[Change]: \x1B[36m${change.currentState}\x1B[0m => \x1B[32m${change.nextState}\x1B[0m');
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint(
          '\x1B[33m[${bloc.runtimeType}]\x1B[0m\x1B[31m[Error]\x1B[0m: \x1B[31m$error\x1B[0m => stackTrace: $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  // Only on Bloc (not cubit)
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    if (kDebugMode) {
      debugPrint(
          '\x1B[33m[${bloc.runtimeType}]\x1B[0m\x1B[35m[Event]\x1B[0m: $event');
    }
    super.onEvent(bloc, event);
  }

  @override
  // Only on Bloc (not cubit)
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    if (kDebugMode) {
      debugPrint(
          '\x1B[33m[${bloc.runtimeType}]\x1B[0m\x1B[37m[Transition]\x1B[0m : \x1B[36m${transition.currentState}\x1B[0m -> ${transition.event} => \x1B[32m${transition.nextState}\x1B[0m');
    }
    super.onTransition(bloc, transition);
  }
}
