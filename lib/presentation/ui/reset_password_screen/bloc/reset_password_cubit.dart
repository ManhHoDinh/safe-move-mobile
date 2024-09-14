import '../../../../../application/services/auth/auth.dart';
import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';
import '../../../shared/widgets/form_fields/form_username_fields.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends OTPCubit<ResetPasswordState> {
  ResetPasswordCubit({
    required super.userController,
    required super.authController,
    required this.loadingManager,
    required this.failureHandlerManager,
    required super.initialState,
  });

  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void onUsernameChanged(String value) {
    emit(state.copyWith(
      usernameField: UsernameField.dirty(value: value),
    ));
  }

  void onPasswordChanged(String value) {
    emit(
      state.copyWith(
        passwordField: PasswordField.dirty(value: value),
        confirmPasswordField: ConfirmPasswordField.dirty(
            value: state.confirmPasswordField.value, password: value),
      ),
    );
  }

  void onConfirmPasswordChanged(String password, String confirmPassword) {
    emit(
      state.copyWith(
        confirmPasswordField: ConfirmPasswordField.dirty(
          password: state.passwordField.value,
          value: confirmPassword,
        ),
      ),
    );
  }

  void dialogHandled() {
    emit(state.dialogHandled());
  }

  void onSendOTP() async {
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

  void onVerifyAccount() async {
    final findIdResponse = await loadingManager.startLoading(
        future: authController.matchUserPhoneNumber(
      MatchUserPhoneNumberRequest(
        phoneNumber: state.phoneField.value,
        username: state.usernameField.value,
      ),
    ));
    if (findIdResponse.isLeft) {
      failureHandlerManager.handle(findIdResponse.left);
      return;
    }
    final matched = findIdResponse.right.matched;
    if (matched ?? false) {
      emit(state.copyWith(verifyAccountFlowCompleted: true));
      return;
    }
    emit(state.copyWith(dialogContent: DialogContent.verifyAccountFailed));
  }

  void onSubmit() async {
    final changePasswordResult = await loadingManager.startLoading(
      future: authController.changePassword(
        ChangePasswordRequest(
          sessionToken: state.sessionToken ?? '',
          username: state.usernameField.value,
          newPassword: state.passwordField.value,
        ),
      ),
    );
    changePasswordResult.handleRight((value) {
      emit(state.copyWith(changePasswordFlowCompleted: true));
    });
    changePasswordResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
  }
}
