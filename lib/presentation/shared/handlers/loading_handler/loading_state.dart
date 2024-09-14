import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class InitialLoadingState extends LoadingState {
  const InitialLoadingState();
}

class EventDrivenLoadingState extends LoadingState {
  const EventDrivenLoadingState({
    this.showing = false,
    required this.operationId,
  });

  final bool showing;
  final int operationId;

  @override
  List<Object?> get props => [
        showing,
        operationId,
      ];
}
