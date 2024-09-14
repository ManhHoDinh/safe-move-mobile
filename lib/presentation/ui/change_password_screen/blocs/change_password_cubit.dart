import '../../../../application/services/auth/auth.dart';
import '../../../bases/base_form_input/base_form_input.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';

enum OldPasswordFieldError { empty }

class OldPasswordField extends BaseFormInput<String, OldPasswordFieldError> {
  const OldPasswordField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const OldPasswordField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  OldPasswordFieldError? selfValidate() {
    if (value.trim().isEmpty) {
      return OldPasswordFieldError.empty;
    }
    return null;
  }
}

class ChangePasswordState {
  const ChangePasswordState({
    this.oldPasswordField = const OldPasswordField.pure(),
    this.newPasswordField = const PasswordField.pure(),
    this.changePasswordCompleted = false,
  });

  final OldPasswordField oldPasswordField;
  final PasswordField newPasswordField;
  final bool changePasswordCompleted;

  ChangePasswordState copyWith({
    OldPasswordField? oldPasswordField,
    PasswordField? newPasswordField,
    bool? changePasswordCompleted,
  }) {
    return ChangePasswordState(
      oldPasswordField: oldPasswordField ?? this.oldPasswordField,
      newPasswordField: newPasswordField ?? this.newPasswordField,
      changePasswordCompleted:
          changePasswordCompleted ?? this.changePasswordCompleted,
    );
  }

  bool get canSubmit {
    return oldPasswordField.isValid && newPasswordField.isValid;
  }
}

class ChangePasswordCubit extends SafeCubit<ChangePasswordState> {
  ChangePasswordCubit({
    required this.authController,
    required this.loadingManager,
    required this.failureHandlerManager,
  }) : super(const ChangePasswordState());

  final LoadingManager loadingManager;
  final AuthController authController;
  final FailureHandlerManager failureHandlerManager;

  void changeCurrentPasswordField(String value) {
    emit(
        state.copyWith(oldPasswordField: OldPasswordField.dirty(value: value)));
  }

  void changeNewPasswordField(String value) {
    emit(state.copyWith(newPasswordField: PasswordField.dirty(value: value)));
  }

  void onSubmit() async {
    final changePasswordResult = await loadingManager.startLoading(
      future: authController.changeMyPassword(
        ChangeMyPasswordRequest(
            newPassword: state.newPasswordField.value,
            currentPassword: state.oldPasswordField.value),
      ),
    );
    changePasswordResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    changePasswordResult.handleRight((value) {
      emit(state.copyWith(changePasswordCompleted: true));
    });
  }
}
