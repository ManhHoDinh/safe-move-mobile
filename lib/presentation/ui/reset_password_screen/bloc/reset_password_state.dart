import 'package:equatable/equatable.dart';

import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../../shared/widgets/form_fields/form_username_fields.dart';

enum DialogContent {
  phoneNumberNotExisted,
  verifyOTPSuccess,
  verifyAccountFailed,
}

class ResetPasswordState extends OTPState with EquatableMixin {
  const ResetPasswordState({
    super.phoneField = const PhoneField.pure(),
    super.otpField = const OTPField.pure(),
    this.usernameField = const UsernameField.pure(),
    this.passwordField = const PasswordField.pure(),
    this.confirmPasswordField = const ConfirmPasswordField.pure(),
    this.verifyAccountFlowCompleted = false,
    super.verifyPhoneNumberFlowCompleted = false,
    this.changePasswordFlowCompleted = false,
    super.expiredIn = 0,
    super.sessionToken = '',
    this.dialogContent,
    super.otpSessionId,
  });

  final UsernameField usernameField;
  final PasswordField passwordField;
  final ConfirmPasswordField confirmPasswordField;

  final bool verifyAccountFlowCompleted;
  final bool changePasswordFlowCompleted;
  final DialogContent? dialogContent;

  bool get canVerifyAccount {
    return usernameField.isValid && verifyPhoneNumberFlowCompleted;
  }

  bool get canResetPassword {
    return passwordField.isValid && confirmPasswordField.isValid;
  }

  ResetPasswordState copyWith({
    PhoneField? phoneField,
    OTPField? otpField,
    UsernameField? usernameField,
    PasswordField? passwordField,
    ConfirmPasswordField? confirmPasswordField,
    bool? verifyAccountFlowCompleted,
    int? expiredIn,
    String? otpSessionId,
    String? sessionToken,
    DialogContent? dialogContent,
    bool? verifyPhoneNumberFlowCompleted,
    bool? changePasswordFlowCompleted,
  }) {
    return ResetPasswordState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      usernameField: usernameField ?? this.usernameField,
      passwordField: passwordField ?? this.passwordField,
      confirmPasswordField: confirmPasswordField ?? this.confirmPasswordField,
      verifyAccountFlowCompleted:
          verifyAccountFlowCompleted ?? this.verifyAccountFlowCompleted,
      expiredIn: expiredIn ?? this.expiredIn,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      sessionToken: sessionToken ?? this.sessionToken,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      dialogContent: dialogContent ?? this.dialogContent,
      changePasswordFlowCompleted:
          changePasswordFlowCompleted ?? this.changePasswordFlowCompleted,
    );
  }

  ResetPasswordState dialogHandled() {
    return ResetPasswordState(
      phoneField: phoneField,
      otpField: otpField,
      usernameField: usernameField,
      passwordField: passwordField,
      confirmPasswordField: confirmPasswordField,
      verifyAccountFlowCompleted: verifyAccountFlowCompleted,
      expiredIn: expiredIn,
      sessionToken: sessionToken,
      otpSessionId: otpSessionId,
      verifyPhoneNumberFlowCompleted: verifyPhoneNumberFlowCompleted,
      changePasswordFlowCompleted: changePasswordFlowCompleted,
    );
  }

  @override
  List<Object?> get props => [
        usernameField.value,
        usernameField.error,
        phoneField.value,
        phoneField.error,
        otpField.value,
        otpField.error,
        passwordField.value,
        passwordField.error,
        confirmPasswordField.value,
        confirmPasswordField.error,
        verifyAccountFlowCompleted,
        expiredIn,
        sessionToken,
        dialogContent,
        otpSessionId,
        verifyPhoneNumberFlowCompleted,
        changePasswordFlowCompleted
      ];

  @override
  OTPState sendOtpStateChanged(
      {PhoneField? phoneField,
      OTPField? otpField,
      bool? verifyPhoneNumberFlowCompleted,
      String? otpSessionId,
      int? expiredIn,
      String? sessionToken}) {
    return ResetPasswordState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      usernameField: usernameField,
      passwordField: passwordField,
      confirmPasswordField: confirmPasswordField,
      verifyAccountFlowCompleted: verifyAccountFlowCompleted,
      expiredIn: expiredIn ?? this.expiredIn,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      sessionToken: sessionToken ?? this.sessionToken,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      dialogContent: dialogContent,
      changePasswordFlowCompleted: changePasswordFlowCompleted,
    );
  }
}
