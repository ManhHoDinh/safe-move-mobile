import 'package:flutter/cupertino.dart';

import '../../../bases/base_form_input/base_form_input.dart';
import '../../../gen/locale/app_localizations.dart';

enum PhoneFieldError {
  phoneInvalid,
}

enum OTPFieldError {
  otpInvalid,
}

class PhoneField extends BaseFormInput<String, PhoneFieldError> {
  const PhoneField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const PhoneField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  PhoneFieldError? selfValidate() {
    if (value.trim().isEmpty ||
        !RegExp(r'^(?:01[0-9]|07[0-8]|09[0-9])[0-9]{3,4}[0-9]{4}$')
            .hasMatch(value)) {
      return PhoneFieldError.phoneInvalid;
    }
    return null;
  }
}

class OTPField extends BaseFormInput<String, OTPFieldError> {
  const OTPField.pure({super.value = ''}) : super.pure(validateOnChanged: true);

  const OTPField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  OTPFieldError? selfValidate() {
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
      return OTPFieldError.otpInvalid;
    }
    return null;
  }
}

String? renderPhoneError(BuildContext context, PhoneFieldError? error) {
  if (error == null) {
    return null;
  }
  switch (error) {
    case PhoneFieldError.phoneInvalid:
      return S.of(context).phoneInvalid;
  }
}

String? renderOTPError(BuildContext context, OTPFieldError? error) {
  if (error == null) {
    return null;
  }
  switch (error) {
    case OTPFieldError.otpInvalid:
      return S.of(context).otpInvalid;
  }
}
