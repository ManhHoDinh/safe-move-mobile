import 'package:equatable/equatable.dart';

import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';

enum DialogContent {
  phoneNumberExisted,
  verifyOTPSuccess,
}

class ChangePhoneNumberState extends OTPState with EquatableMixin {
  const ChangePhoneNumberState({
    super.phoneField = const PhoneField.pure(),
    super.otpField = const OTPField.pure(),
    this.changePhoneNumberFlowCompleted = false,
    super.verifyPhoneNumberFlowCompleted = false,
    super.expiredIn = 0,
    this.dialogContent,
    super.otpSessionId,
    super.sessionToken,
  });

  final bool changePhoneNumberFlowCompleted;
  final DialogContent? dialogContent;

  bool get canChangePassword {
    return verifyPhoneNumberFlowCompleted;
  }

  ChangePhoneNumberState copyWith({
    PhoneField? phoneField,
    OTPField? otpField,
    bool? changePhoneNumberFlowCompleted,
    int? expiredIn,
    String? otpSessionId,
    DialogContent? dialogContent,
    bool? verifyPhoneNumberFlowCompleted,
    String? sessionToken,
  }) {
    return ChangePhoneNumberState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      changePhoneNumberFlowCompleted:
          changePhoneNumberFlowCompleted ?? this.changePhoneNumberFlowCompleted,
      expiredIn: expiredIn ?? this.expiredIn,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      sessionToken: sessionToken ?? this.sessionToken,
      dialogContent: dialogContent ?? this.dialogContent,
    );
  }

  ChangePhoneNumberState dialogHandled() {
    return ChangePhoneNumberState(
      phoneField: phoneField,
      otpField: otpField,
      changePhoneNumberFlowCompleted: changePhoneNumberFlowCompleted,
      expiredIn: expiredIn,
      otpSessionId: otpSessionId,
      verifyPhoneNumberFlowCompleted: verifyPhoneNumberFlowCompleted,
      sessionToken: sessionToken,
    );
  }

  @override
  List<Object?> get props => [
        phoneField.value,
        phoneField.error,
        otpField.value,
        otpField.error,
        changePhoneNumberFlowCompleted,
        expiredIn,
        dialogContent,
        otpSessionId,
        verifyPhoneNumberFlowCompleted,
        sessionToken,
      ];

  @override
  OTPState sendOtpStateChanged(
      {PhoneField? phoneField,
      OTPField? otpField,
      bool? verifyPhoneNumberFlowCompleted,
      String? otpSessionId,
      int? expiredIn,
      String? sessionToken}) {
    return ChangePhoneNumberState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      changePhoneNumberFlowCompleted: changePhoneNumberFlowCompleted,
      expiredIn: expiredIn ?? this.expiredIn,
      dialogContent: dialogContent,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      sessionToken: sessionToken ?? this.sessionToken,
    );
  }
}
