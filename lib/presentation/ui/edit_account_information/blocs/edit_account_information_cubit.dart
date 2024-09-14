import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/form_fields/form_email_field.dart';
import '../../register_screen/bloc/register_state.dart';

class EditAccountEmailField extends EmailField {
  const EditAccountEmailField.dirty({
    required super.value,
  }) : super.dirty(allowEmpty: true);

  const EditAccountEmailField.pure({
    super.value = '',
  }) : super.pure(allowEmpty: true);
}

class EditAccountInformationState {
  const EditAccountInformationState({
    this.apiStatus = ApiStatus.initial,
    this.nameField = const RegisterNameField.pure(),
    this.emailField = const EditAccountEmailField.pure(),
    this.username = '',
    this.phoneNumber = '',
    this.accountType,
    this.bio,
  });

  final ApiStatus apiStatus;
  final RegisterNameField nameField;
  final EditAccountEmailField emailField;
  final String username;
  final AccountType? accountType;
  final String phoneNumber;
  final String? bio;

  bool get canSubmit {
    if (accountType == null) {
      return false;
    }
    return emailField.isValid && nameField.isValid;
  }

  EditAccountInformationState copyWith({
    ApiStatus? apiStatus,
    RegisterNameField? nameField,
    EditAccountEmailField? emailField,
    String? username,
    AccountType? accountType,
    String? phoneNumber,
    String? bio,
  }) {
    return EditAccountInformationState(
      apiStatus: apiStatus ?? this.apiStatus,
      nameField: nameField ?? this.nameField,
      emailField: emailField ?? this.emailField,
      username: username ?? this.username,
      accountType: accountType ?? this.accountType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
    );
  }
}

class EditAccountInformationCubit
    extends SafeCubit<EditAccountInformationState> {
  EditAccountInformationCubit({
    required this.failureHandlerManager,
    required this.loadingManager,
    required this.userController,
  }) : super(const EditAccountInformationState()) {
    reload();
  }

  final UserController userController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;

  void onChangeName(String value) {
    emit(state.copyWith(nameField: RegisterNameField.dirty(value: value)));
  }

  void onChangeEmail(String value) {
    emit(state.copyWith(emailField: EditAccountEmailField.dirty(value: value)));
  }

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final userInfoResult = await userController.getUserInfo();
    userInfoResult.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });
    userInfoResult.handleRight(
      (value) {
        final accountType = value.accountType;
        emit(
          state.copyWith(
            apiStatus: ApiStatus.success,
            username: value.username,
            accountType: accountType,
            nameField: RegisterNameField.dirty(value: value.name ?? ''),
            emailField: EditAccountEmailField.dirty(value: value.email ?? ''),
            phoneNumber: value.phoneNumber,
            bio: value.bio,
          ),
        );
      },
    );
  }

  void submit() async {
    final editUserInfoResult = await loadingManager.startLoading(
        future: userController.updateUserInfo(
      UpdateUserInfoRequest(
        name: state.nameField.value,
        bio: state.bio,
        email: state.accountType == AccountType.normal
            ? state.emailField.value
            : null,
      ),
    ));
    editUserInfoResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    editUserInfoResult.handleRight((value) {
      emit(
        state.copyWith(
          apiStatus: ApiStatus.success,
          username: value.username,
          accountType: value.accountType,
          nameField: RegisterNameField.dirty(value: value.name ?? ''),
          emailField: EditAccountEmailField.dirty(value: value.email ?? ''),
          phoneNumber: value.phoneNumber,
          bio: value.bio,
        ),
      );
    });
  }
}
