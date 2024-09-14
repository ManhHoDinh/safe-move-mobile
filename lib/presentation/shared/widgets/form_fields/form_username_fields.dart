import 'package:flutter/cupertino.dart';

import '../../../bases/base_form_input/base_form_input.dart';
import '../../../gen/locale/app_localizations.dart';

enum UsernameFieldError {
  usernameInvalid,
}

class UsernameField extends BaseFormInput<String, UsernameFieldError> {
  const UsernameField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const UsernameField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  UsernameFieldError? selfValidate() {
    if (!RegExp(r'^(?!.*\s)[a-zA-Z0-9_]{6,}$').hasMatch(value)) {
      return UsernameFieldError.usernameInvalid;
    }

    return null;
  }
}

String? renderUsernameError(BuildContext context, UsernameFieldError? error) {
  if (error == null) {
    return null;
  }
  switch (error) {
    case UsernameFieldError.usernameInvalid:
      return S.of(context).usernameInvalid;
  }
}
