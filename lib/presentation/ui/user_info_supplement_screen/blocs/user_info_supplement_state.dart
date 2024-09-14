import 'package:equatable/equatable.dart';

import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/base_form_input/base_form_input.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';

enum UserInfoSupplementNameFieldError {
  empty,
}

enum DialogContent {
  phoneNumberExisted,
  verifyOTPSuccess,
}

class UserInfoSupplementNameField
    extends BaseFormInput<String, UserInfoSupplementNameFieldError> {
  const UserInfoSupplementNameField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const UserInfoSupplementNameField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  UserInfoSupplementNameFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return UserInfoSupplementNameFieldError.empty;
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

class UserInfoSupplementState extends Equatable {
  const UserInfoSupplementState({
    this.apiStatus = ApiStatus.initial,
    this.nameField = const UserInfoSupplementNameField.pure(),
    this.phoneField = const PhoneField.pure(),
    this.referrerPhoneNumberField = const ReferrerPhoneNumberField.pure(),
    this.otpField = const OTPField.pure(),
    this.verifyPhoneNumberFlowCompleted = false,
    this.updateInfoFlowCompleted = false,
    this.dialogContent,
    this.otpSessionId,
    this.expiredIn = 0,
    this.sessionToken,
  });

  final UserInfoSupplementNameField nameField;
  final PhoneField phoneField;
  final OTPField otpField;
  final ReferrerPhoneNumberField referrerPhoneNumberField;

  final bool verifyPhoneNumberFlowCompleted;
  final bool updateInfoFlowCompleted;
  final DialogContent? dialogContent;
  final String? otpSessionId;
  final int expiredIn;
  final String? sessionToken;
  final ApiStatus apiStatus;

  bool get canSentOTP {
    return phoneField.isValid && expiredIn == 0;
  }

  bool get canEnterOTP {
    return expiredIn > 0;
  }

  bool get canVerifyOTP {
    return otpField.isValid && expiredIn > 0;
  }

  bool get canUpdateInformation {
    return nameField.isValid &&
        verifyPhoneNumberFlowCompleted &&
        referrerPhoneNumberField.isValid;
  }

  UserInfoSupplementState copyWith({
    UserInfoSupplementNameField? nameField,
    PhoneField? phoneField,
    OTPField? otpField,
    ReferrerPhoneNumberField? referrerPhoneNumberField,
    bool? updateInfoFlowCompleted,
    bool? verifyPhoneNumberFlowCompleted,
    DialogContent? dialogContent,
    String? otpSessionId,
    int? expiredIn,
    String? sessionToken,
    ApiStatus? apiStatus,
  }) {
    return UserInfoSupplementState(
      nameField: nameField ?? this.nameField,
      phoneField: phoneField ?? this.phoneField,
      otpField: otpField ?? this.otpField,
      referrerPhoneNumberField:
          referrerPhoneNumberField ?? this.referrerPhoneNumberField,
      updateInfoFlowCompleted:
          updateInfoFlowCompleted ?? this.updateInfoFlowCompleted,
      verifyPhoneNumberFlowCompleted:
          verifyPhoneNumberFlowCompleted ?? this.verifyPhoneNumberFlowCompleted,
      otpSessionId: otpSessionId ?? this.otpSessionId,
      expiredIn: expiredIn ?? this.expiredIn,
      sessionToken: sessionToken ?? this.sessionToken,
      dialogContent: dialogContent ?? this.dialogContent,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  UserInfoSupplementState dialogContentHandled() {
    return UserInfoSupplementState(
      nameField: nameField,
      phoneField: phoneField,
      otpField: otpField,
      referrerPhoneNumberField: referrerPhoneNumberField,
      updateInfoFlowCompleted: updateInfoFlowCompleted,
      verifyPhoneNumberFlowCompleted: verifyPhoneNumberFlowCompleted,
      otpSessionId: otpSessionId,
      expiredIn: expiredIn,
      sessionToken: sessionToken,
      apiStatus: apiStatus,
    );
  }

  @override
  List<Object?> get props => [
        nameField.value,
        nameField.error,
        phoneField.value,
        phoneField.error,
        otpField.value,
        otpField.error,
        referrerPhoneNumberField.value,
        referrerPhoneNumberField.error,
        updateInfoFlowCompleted,
        verifyPhoneNumberFlowCompleted,
        dialogContent,
        otpSessionId,
        expiredIn,
        sessionToken,
        apiStatus,
      ];
}
