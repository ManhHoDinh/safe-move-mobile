import 'package:equatable/equatable.dart';

import '../../../shared/base_send_otp/send_otp_cubit.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';

enum DialogContent {
  phoneNumberNotExisted,
  verifyOTPSuccess,
}

class FindIdState extends OTPState with EquatableMixin {
  const FindIdState({
    super.phoneField = const PhoneField.pure(),
    super.otpField = const OTPField.pure(),
    this.findIdFlowCompleted = false,
    super.verifyPhoneNumberFlowCompleted = false,
    super.expiredIn = 0,
    this.dialogContent,
    super.otpSessionId,
    super.sessionToken,
    this.username = '',
  });

  final bool findIdFlowCompleted;
  final DialogContent? dialogContent;
  final String username;

  bool get canFindId {
    return verifyPhoneNumberFlowCompleted;
  }

  FindIdState copyWith({
    PhoneField? phoneField,
    OTPField? otpField,
    bool? findIdFlowCompleted,
    int? expiredIn,
    String? otpSessionId,
    DialogContent? dialogContent,
    bool? verifyPhoneNumberFlowCompleted,
    String? sessionToken,
    String? username,
  }) {
    return FindIdState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      findIdFlowCompleted: findIdFlowCompleted ?? this.findIdFlowCompleted,
      expiredIn: expiredIn ?? this.expiredIn,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      sessionToken: sessionToken ?? this.sessionToken,
      dialogContent: dialogContent ?? this.dialogContent,
      username: username ?? this.username,
    );
  }

  FindIdState dialogHandled() {
    return FindIdState(
      phoneField: phoneField,
      otpField: otpField,
      findIdFlowCompleted: findIdFlowCompleted,
      expiredIn: expiredIn,
      otpSessionId: otpSessionId,
      verifyPhoneNumberFlowCompleted: verifyPhoneNumberFlowCompleted,
      sessionToken: sessionToken,
      username: username,
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
    return FindIdState(
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      findIdFlowCompleted: findIdFlowCompleted,
      expiredIn: expiredIn ?? this.expiredIn,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      sessionToken: sessionToken ?? this.sessionToken,
      dialogContent: dialogContent,
      username: username,
    );
  }

  @override
  List<Object?> get props => [
        phoneField.value,
        phoneField.error,
        otpField.value,
        otpField.error,
        findIdFlowCompleted,
        expiredIn,
        dialogContent,
        otpSessionId,
        verifyPhoneNumberFlowCompleted,
        sessionToken,
        username
      ];
}
