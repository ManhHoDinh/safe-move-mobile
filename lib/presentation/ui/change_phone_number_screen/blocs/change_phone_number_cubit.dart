import '../../../../../application/services/auth/auth.dart';
import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'change_phone_number_state.dart';

class ChangePhoneNumberCubit extends OTPCubit<ChangePhoneNumberState> {
  ChangePhoneNumberCubit({
    required this.loadingManager,
    required this.failureHandlerManager,
    required super.initialState,
    required super.userController,
    required super.authController,
  });

  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void dialogHandled() {
    emit(state.dialogHandled());
  }

  void onSendOTPToDevice() async {
    final sendOTPResult =
        await loadingManager.startLoading(future: performSendOTP(false));
    if (sendOTPResult != null) {
      if (sendOTPResult.failure != null) {
        failureHandlerManager.handle(sendOTPResult.failure!);
        return;
      }
      if (sendOTPResult.isExistPhoneNumber != null) {
        if (sendOTPResult.isExistPhoneNumber!) {
          emit(state.copyWith(dialogContent: DialogContent.phoneNumberExisted));
        }
        return;
      }
    }
    return;
  }

  void onSubmit() async {
    final changePhoneNumberFuture = authController.changePhoneNumber(
      ChangePhoneNumberRequest(
        phoneNumber: state.phoneField.value,
        sessionToken: state.sessionToken ?? '',
      ),
    );
    final changePhoneNumberResult =
        await loadingManager.startLoading(future: changePhoneNumberFuture);
    changePhoneNumberResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    changePhoneNumberResult.handleRight((value) {
      emit(state.copyWith(changePhoneNumberFlowCompleted: true));
    });
  }
}
