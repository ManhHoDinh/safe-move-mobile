import 'package:equatable/equatable.dart';

import '../../../bases/base_form_input/base_form_input.dart';

enum LoginFieldError {
  empty,
}

class UsernameField extends BaseFormInput<String, LoginFieldError> {
  const UsernameField.pure({super.value = ''}) : super.pure();

  const UsernameField.dirty({required super.value}) : super.dirty();

  @override
  LoginFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return LoginFieldError.empty;
    }
    return null;
  }
}

class PasswordField extends BaseFormInput<String, LoginFieldError> {
  const PasswordField.pure({super.value = ''}) : super.pure();

  const PasswordField.dirty({required super.value}) : super.dirty();

  @override
  LoginFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return LoginFieldError.empty;
    }
    return null;
  }
}

class LoginState extends Equatable {
  const LoginState({
    this.usernameField = const UsernameField.pure(),
    this.passwordField = const PasswordField.pure(),
    this.loginFlowCompleted = false,
  });

  final UsernameField usernameField;
  final PasswordField passwordField;
  final bool loginFlowCompleted;

  bool get canSubmit {
    return usernameField.isValid && passwordField.isValid;
  }

  LoginState copyWith({
    UsernameField? usernameField,
    PasswordField? passwordField,
    bool? loginFlowCompleted,
  }) {
    return LoginState(
      usernameField: usernameField ?? this.usernameField,
      passwordField: passwordField ?? this.passwordField,
      loginFlowCompleted: loginFlowCompleted ?? this.loginFlowCompleted,
    );
  }

  @override
  List<Object?> get props => [
        usernameField.value,
        usernameField.error,
        passwordField.value,
        passwordField.error,
        canSubmit,
        loginFlowCompleted,
      ];
}
