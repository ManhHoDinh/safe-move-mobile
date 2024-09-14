import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utilities/failure/failure.dart';

abstract class HandlerState {
  const HandlerState();
}

class InitialHandlerState extends HandlerState {
  const InitialHandlerState();
}

class HandlerHandlingState extends HandlerState {
  const HandlerHandlingState({
    required this.value,
  });

  final Failure value;
}

class FailureHandlerManager extends Cubit<HandlerState> {
  FailureHandlerManager() : super(const InitialHandlerState());

  void handle(Failure value) {
    emit(HandlerHandlingState(value: value));
  }
}
