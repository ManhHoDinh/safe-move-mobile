import '../../../bases/base_form_input/base_form_input.dart';

enum EmailFieldError { emailInvalid, empty }

class EmailField extends BaseFormInput<String, EmailFieldError> {
  const EmailField.dirty({required super.value, this.allowEmpty = true})
      : super.dirty(validateOnChanged: true);

  const EmailField.pure({super.value = '', this.allowEmpty = true})
      : super.pure(validateOnChanged: true);

  final bool allowEmpty;

  @override
  EmailFieldError? selfValidate() {
    if (value.isEmpty) {
      if (allowEmpty) {
        return null;
      }
      return EmailFieldError.empty;
    }
    if (!RegExp(
            r'^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return EmailFieldError.emailInvalid;
    }
    return null;
  }
}
