import 'package:equatable/equatable.dart';

import '../../../application/services/app/token_service/token_service.dart';
import '../bloc_utils/safe_cubit/safe_cubit.dart';

part 'session_state.dart';

class SessionCubit extends SafeCubit<SessionState> {
  SessionCubit({
    required this.tokenService,
  }) : super(const SessionState(status: SessionStatus.expired)) {
    tokenService.addTokenExpiredCallback(sessionExpired);
  }

  final TokenService tokenService;

  void sessionStarted() {
    emit(state.copyWith(
      status: SessionStatus.started,
    ));
  }

  void sessionExpired() {
    tokenService.clearRuntimeTokens();
    emit(state.copyWith(status: SessionStatus.expired));
  }

  @override
  Future<void> close() {
    tokenService.removeTokenExpiredCallback(sessionExpired);
    return super.close();
  }
}
