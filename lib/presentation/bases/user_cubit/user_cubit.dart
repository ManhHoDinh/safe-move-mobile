import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../application/services/user/user.dart';
import '../../../utilities/api_status/api_status.dart';
import '../bloc_utils/safe_cubit/safe_cubit.dart';
import '../session_cubit/session_cubit.dart';

part 'user_state.dart';

class UserCubit extends SafeCubit<UserState> {
  UserCubit({
    required this.userController,
    required this.sessionCubit,
  }) : super(const UserState()) {
    _sessionSubscription = sessionCubit.stream.listen((state) {
      switch (state.status) {
        case SessionStatus.started:
          fetchUserData();
          break;
        case SessionStatus.expired:
          break;
      }
    });
  }

  StreamSubscription<SessionState>? _sessionSubscription;
  final SessionCubit sessionCubit;
  final UserController userController;

  Future<void> fetchUserData() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final getUserInfoResult = await userController.getUserInfo();

    getUserInfoResult.handleRight((value) {
      emit(state.copyWith(
        detail: value,
        apiStatus: ApiStatus.success,
      ));
    });

    getUserInfoResult.handleLeft((value) {
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
  }

  void setUserData(UserDTO userDetail) {
    emit(state.copyWith(apiStatus: ApiStatus.success, detail: userDetail));
  }

  @override
  Future<void> close() async {
    await _sessionSubscription?.cancel();
    return super.close();
  }
}
