import '../../../../../application/services/auth/auth.dart';
import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'find_id_state.dart';

class FindIdCubit extends OTPCubit<FindIdState> {
  FindIdCubit({
    required super.userController,
    required super.authController,
    required this.loadingManager,
    required this.failureHandlerManager,
    required super.initialState,
  });
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void dialogHandled() {
    emit(state.dialogHandled());
  }

  void onSendOTPToDevice() async {
    final sendOTPResult =
        await loadingManager.startLoading(future: performSendOTP(true));
    if (sendOTPResult != null) {
      if (sendOTPResult.failure != null) {
        failureHandlerManager.handle(sendOTPResult.failure!);
        return;
      }
      if (sendOTPResult.isExistPhoneNumber != null) {
        if (!sendOTPResult.isExistPhoneNumber!) {
          emit(state.copyWith(
              dialogContent: DialogContent.phoneNumberNotExisted));
        }
        return;
      }
    }
    return;
  }

  void onSubmit() async {
    final findUsernameFuture = authController.findUsername(
      FindUsernameRequest(
        phoneNumber: state.phoneField.value,
        sessionToken: state.sessionToken ?? '',
      ),
    );
    final findUsernameResult =
        await loadingManager.startLoading(future: findUsernameFuture);
    findUsernameResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    findUsernameResult.handleRight((value) {
      emit(state.copyWith(username: value.username, findIdFlowCompleted: true));
    });
  }
}
