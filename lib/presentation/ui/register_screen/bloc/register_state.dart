import 'package:equatable/equatable.dart';

import '../../../bases/base_form_input/base_form_input.dart';
import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../../shared/widgets/form_fields/form_username_fields.dart';

enum RegisterNameFieldError {
  empty,
}

enum DialogContent {
  usernameExisted,
  phoneNumberExisted,
  verifyOTPSuccess,
}

class RegisterNameField extends BaseFormInput<String, RegisterNameFieldError> {
  const RegisterNameField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const RegisterNameField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  RegisterNameFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return RegisterNameFieldError.empty;
    }
    return null;
  }
}

class ReferrerPhoneNumberField extends PhoneField {
  const ReferrerPhoneNumberField.pure({super.value = ''}) : super.pure();

  const ReferrerPhoneNumberField.dirty({required super.value}) : super.dirty();

  @override
  PhoneFieldError? selfValidate() {
    if (value.isEmpty) {
      return null;
    }
    return super.selfValidate();
  }
}

class RegisterState extends OTPState with EquatableMixin {
  const RegisterState({
    super.phoneField,
    super.otpField,
    super.verifyPhoneNumberFlowCompleted = false,
    super.otpSessionId,
    super.expiredIn = 0,
    super.sessionToken,
    this.usernameField = const UsernameField.pure(),
    this.passwordField = const PasswordField.pure(),
    this.confirmPasswordField = const ConfirmPasswordField.pure(),
    this.nameField = const RegisterNameField.pure(),
    this.referrerPhoneNumberField = const ReferrerPhoneNumberField.pure(),
    this.registerFlowCompleted = false,
    this.checkExistUsernameCompleted = false,
    this.isSubmitted = false,
    this.dialogContent,
  });

  final UsernameField usernameField;
  final PasswordField passwordField;
  final ConfirmPasswordField confirmPasswordField;
  final RegisterNameField nameField;
  final ReferrerPhoneNumberField referrerPhoneNumberField;

  final bool checkExistUsernameCompleted;
  final bool registerFlowCompleted;
  final bool isSubmitted;

  final DialogContent? dialogContent;

  bool get canCheckExistUsername {
    return usernameField.isValid;
  }

  bool get canRegister {
    return checkExistUsernameCompleted &&
        passwordField.isValid &&
        confirmPasswordField.isValid &&
        nameField.isValid &&
        verifyPhoneNumberFlowCompleted &&
        referrerPhoneNumberField.isValid;
  }

  RegisterState copyWith({
    UsernameField? usernameField,
    PasswordField? passwordField,
    ConfirmPasswordField? confirmPasswordField,
    RegisterNameField? nameField,
    PhoneField? phoneField,
    OTPField? otpField,
    ReferrerPhoneNumberField? referrerPhoneNumberField,
    bool? registerFlowCompleted,
    bool? verifyPhoneNumberFlowCompleted,
    bool? checkExistUsernameCompleted,
    bool? isSubmitted,
    DialogContent? dialogContent,
    String? otpSessionId,
    int? expiredIn,
    String? sessionToken,
  }) {
    return RegisterState(
      usernameField: usernameField ?? this.usernameField,
      passwordField: passwordField ?? this.passwordField,
      confirmPasswordField: confirmPasswordField ?? this.confirmPasswordField,
      nameField: nameField ?? this.nameField,
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      referrerPhoneNumberField:
          referrerPhoneNumberField ?? this.referrerPhoneNumberField,
      registerFlowCompleted:
          registerFlowCompleted ?? this.registerFlowCompleted,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      checkExistUsernameCompleted:
          checkExistUsernameCompleted ?? this.checkExistUsernameCompleted,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      expiredIn: expiredIn ?? this.expiredIn,
      sessionToken: sessionToken ?? this.sessionToken,
      dialogContent: dialogContent ?? this.dialogContent,
    );
  }

  RegisterState dialogContentHandled() {
    return RegisterState(
      usernameField: usernameField,
      passwordField: passwordField,
      confirmPasswordField: confirmPasswordField,
      nameField: nameField,
      phoneField: phoneField,
      otpField: otpField,
      referrerPhoneNumberField: referrerPhoneNumberField,
      registerFlowCompleted: registerFlowCompleted,
      verifyPhoneNumberFlowCompleted: verifyPhoneNumberFlowCompleted,
      checkExistUsernameCompleted: checkExistUsernameCompleted,
      otpSessionId: otpSessionId,
      expiredIn: expiredIn,
      sessionToken: sessionToken,
    );
  }

  @override
  OTPState sendOtpStateChanged(
      {PhoneField? phoneField,
      OTPField? otpField,
      bool? verifyPhoneNumberFlowCompleted,
      String? otpSessionId,
      int? expiredIn,
      String? sessionToken}) {
    return RegisterState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      expiredIn: expiredIn ?? this.expiredIn,
      sessionToken: sessionToken ?? this.sessionToken,
      usernameField: usernameField,
      passwordField: passwordField,
      confirmPasswordField: confirmPasswordField,
      nameField: nameField,
      referrerPhoneNumberField: referrerPhoneNumberField,
      registerFlowCompleted: registerFlowCompleted,
      checkExistUsernameCompleted: checkExistUsernameCompleted,
      dialogContent: dialogContent,
    );
  }

  @override
  List<Object?> get props => [
        usernameField.value,
        usernameField.error,
        passwordField.value,
        passwordField.error,
        confirmPasswordField.value,
        confirmPasswordField.error,
        nameField.value,
        nameField.error,
        phoneField.value,
        phoneField.error,
        otpField.value,
        otpField.error,
        referrerPhoneNumberField.value,
        referrerPhoneNumberField.error,
        canCheckExistUsername,
        registerFlowCompleted,
        checkExistUsernameCompleted,
        isSubmitted,
        verifyPhoneNumberFlowCompleted,
        dialogContent,
        otpSessionId,
        expiredIn,
        sessionToken,
      ];
}
