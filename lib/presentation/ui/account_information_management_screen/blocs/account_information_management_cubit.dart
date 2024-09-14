import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';

class AccountInformationManagementState {
  const AccountInformationManagementState({
    this.apiStatus = ApiStatus.initial,
    this.userDTO,
    this.accountDeactivated = false,
  });

  final ApiStatus apiStatus;
  final UserDTO? userDTO;
  final bool accountDeactivated;

  AccountInformationManagementState copyWith({
    ApiStatus? apiStatus,
    UserDTO? userDTO,
    bool? accountDeactivated,
  }) {
    return AccountInformationManagementState(
      apiStatus: apiStatus ?? this.apiStatus,
      userDTO: userDTO ?? this.userDTO,
      accountDeactivated: accountDeactivated ?? this.accountDeactivated,
    );
  }
}

class AccountInformationManagementCubit
    extends SafeCubit<AccountInformationManagementState> {
  AccountInformationManagementCubit({
    required this.userController,
    required this.handlerManager,
    required this.loadingManager,
    required this.authCubit,
  }) : super(const AccountInformationManagementState()) {
    reload();
  }

  final UserController userController;
  final FailureHandlerManager handlerManager;
  final LoadingManager loadingManager;
  final AuthCubit authCubit;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final profileResult = await userController.getUserInfo();

    profileResult.handleLeft((value) {
      handlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    profileResult.handleRight((value) {
      emit(state.copyWith(apiStatus: ApiStatus.success, userDTO: value));
    });
  }

  Future<Failure?> _deactivate() async {
    final deactivateResult = await userController.deactivate();
    await authCubit.logout();
    return deactivateResult.map<Failure?>(
        onLeft: (failure) => failure, onRight: (value) => null);
  }

  void deactivateAccount() async {
    final failure = await loadingManager.startLoading(future: _deactivate());
    if (failure != null) {
      handlerManager.handle(failure);
      return;
    }
    emit(state.copyWith(accountDeactivated: true));
  }
}
