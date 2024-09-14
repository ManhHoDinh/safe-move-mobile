import 'package:flutter/cupertino.dart';

import '../../../bases/base_form_input/base_form_input.dart';
import '../../../gen/locale/app_localizations.dart';

enum PasswordFieldError { passwordInvalid, confirmPasswordNotMatch, empty }

class PasswordField extends BaseFormInput<String, PasswordFieldError> {
  const PasswordField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const PasswordField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  PasswordFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return PasswordFieldError.empty;
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[1-9])(?!.*\s)(?=.*[!@#$%^&*()\-_+=]).{8,}$')
        .hasMatch(value)) {
      return PasswordFieldError.passwordInvalid;
    }
    return null;
  }
}

class ConfirmPasswordField extends BaseFormInput<String, PasswordFieldError> {
  const ConfirmPasswordField.pure({super.value = '', this.password = ''})
      : super.pure(validateOnChanged: true);

  const ConfirmPasswordField.dirty({required super.value, this.password = ''})
      : super.dirty(validateOnChanged: true);
  final String password;

  @override
  PasswordFieldError? selfValidate() {
    if (value != password) {
      return PasswordFieldError.confirmPasswordNotMatch;
    }
    return null;
  }
}

String? renderPasswordError(BuildContext context, PasswordFieldError? error) {
  if (error == null) {
    return null;
  }
  switch (error) {
    case PasswordFieldError.passwordInvalid:
      return S.of(context).passwordInvalid;
    case PasswordFieldError.confirmPasswordNotMatch:
      return S.of(context).confirmPasswordNotMatch;
    case PasswordFieldError.empty:
      return S.of(context).empty;
  }
}
