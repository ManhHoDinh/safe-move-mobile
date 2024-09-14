import 'package:formz/formz.dart';

abstract class BaseFormInput<T, E> extends FormzInput<T, E> {
  const BaseFormInput.dirty(
      {required T value, E? error, this.validateOnChanged = false})
      : _fieldError = error,
        super.dirty(value);

  const BaseFormInput.pure(
      {required T value, E? error, this.validateOnChanged = false})
      : _fieldError = error,
        super.pure(value);

  final bool validateOnChanged;
  final E? _fieldError;

  E? selfValidate();

  @override
  bool get isValid {
    return selfValidate() == null;
  }

  @override
  E? validator(T value) {
    final currentError = validateOnChanged ? selfValidate() : null;
    return currentError ?? _fieldError;
  }
}

class FormInputValidation {
  const FormInputValidation._();

  static bool validate({required List<BaseFormInput<dynamic, dynamic>> forms}) {
    var valid = true;
    for (final form in forms) {
      if (form.selfValidate() != null) {
        valid = false;
        break;
      }
    }
    return valid;
  }
}
