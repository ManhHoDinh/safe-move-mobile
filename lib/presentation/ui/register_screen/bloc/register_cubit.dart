import '../../../../application/services/auth/auth.dart';
import '../../../../application/services/user/request/request.dart';
import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';
import '../../../shared/widgets/form_fields/form_username_fields.dart';
import 'register_state.dart';

class RegisterCubit extends OTPCubit<RegisterState> {
  RegisterCubit({
    required this.loadingManager,
    required this.failureHandlerManager,
    required super.userController,
    required super.authController,
    required super.initialState,
  });

  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void onUsernameChanged(String value) {
    emit(
      state.copyWith(
          usernameField: UsernameField.dirty(value: value),
          checkExistUsernameCompleted: false,
          isSubmitted: false),
    );
  }

  void onPasswordChanged(String value) {
    emit(
      state.copyWith(
        passwordField: PasswordField.dirty(value: value),
        confirmPasswordField: ConfirmPasswordField.dirty(
          value: state.confirmPasswordField.value,
          password: value,
        ),
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

  void onNameChanged(String value) {
    emit(
      state.copyWith(
        nameField: RegisterNameField.dirty(
          value: value,
        ),
      ),
    );
  }

  void onReferrerPhoneNumberChanged(String value) {
    emit(
      state.copyWith(
        referrerPhoneNumberField: ReferrerPhoneNumberField.dirty(
          value: value,
        ),
      ),
    );
  }

  void dialogHandled() {
    emit(state.dialogContentHandled());
  }

  void onCheckExistUsername() async {
    final existedUserNameResult = await loadingManager.startLoading(
        future: userController.checkExistUsername(
      CheckExistUsernameRequest(
        username: state.usernameField.value,
      ),
    ));
    if (existedUserNameResult.isLeft) {
      failureHandlerManager.handle(existedUserNameResult.left);
      return;
    }
    emit(state.copyWith(isSubmitted: true));
    final usernameExisted = existedUserNameResult.right.existed;
    if (usernameExisted != null && usernameExisted == true) {
      emit(state.copyWith(
        checkExistUsernameCompleted: false,
      ));
      emit(state.copyWith(dialogContent: DialogContent.usernameExisted));
      return;
    }
    if (usernameExisted != null && usernameExisted == false) {
      emit(state.copyWith(checkExistUsernameCompleted: true));
      return;
    }
  }

  void onSendOTP() async {
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
    final registerFuture = authController.register(
      RegisterWithPhoneNumberRequest(
        username: state.usernameField.value,
        password: state.passwordField.value,
        name: state.nameField.value,
        phoneNumber: state.phoneField.value,
        sessionToken: state.sessionToken ?? '',
        referrerPhoneNumber: state.referrerPhoneNumberField.value.isEmpty
            ? null
            : state.referrerPhoneNumberField.value,
      ),
    );
    final registerResult =
        await loadingManager.startLoading(future: registerFuture);

    registerResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    registerResult.handleRight((value) {
      emit(state.copyWith(registerFlowCompleted: true));
    });
  }
}
