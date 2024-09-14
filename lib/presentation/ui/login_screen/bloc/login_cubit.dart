import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import 'login_state.dart';

class LoginCubit extends SafeCubit<LoginState> {
  LoginCubit({
    required this.loadingManager,
    required this.failureHandlerManager,
    required this.authCubit,
    this.redirectUrl,
  }) : super(const LoginState());
  final AuthCubit authCubit;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final String? redirectUrl;

  void onUsernameChanged(String value) {
    emit(state.copyWith(
        usernameField: UsernameField.dirty(value: value.trim())));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(
        passwordField: PasswordField.dirty(value: value.trim())));
  }

  void onLoginWithUserInfo() async {
    final loginFuture = authCubit.loginWithUserInfo(
      userName: state.usernameField.value,
      password: state.passwordField.value,
      redirectUrl: redirectUrl,
    );

    final loadingLoginFailure =
        await loadingManager.startLoading(future: loginFuture);
    if (loadingLoginFailure != null) {
      failureHandlerManager.handle(loadingLoginFailure);
      return;
    }
    emit(state.copyWith(loginFlowCompleted: true));
  }

  void onLoginWithKakao(String accessToken) async {
    final loginWithKakaoFuture = authCubit.loginWithKakao(
      accessToken: accessToken,
      redirectUrl: redirectUrl,
    );

    final loadingLoginWithKakaoFailure =
        await loadingManager.startLoading(future: loginWithKakaoFuture);
    if (loadingLoginWithKakaoFailure != null) {
      failureHandlerManager.handle(loadingLoginWithKakaoFailure);
      return;
    }
    emit(state.copyWith(loginFlowCompleted: true));
  }

  void onLoginWithApple(String idToken) async {
    final loginWithAppleFuture = authCubit.loginWithApple(
      idToken: idToken,
      redirectUrl: redirectUrl,
    );

    final loadingLoginWithAppleFailure =
        await loadingManager.startLoading(future: loginWithAppleFuture);
    if (loadingLoginWithAppleFailure != null) {
      failureHandlerManager.handle(loadingLoginWithAppleFailure);
      return;
    }
    emit(state.copyWith(loginFlowCompleted: true));
  }

  void onLoginWithNaver(String accessToken) async {
    final loginWithNaverFuture = authCubit.loginWithNaver(
      accessToken: accessToken,
      redirectUrl: redirectUrl,
    );

    final loadingLoginWithNaverFailure =
        await loadingManager.startLoading(future: loginWithNaverFuture);
    if (loadingLoginWithNaverFailure != null) {
      failureHandlerManager.handle(loadingLoginWithNaverFailure);
      return;
    }
    emit(state.copyWith(loginFlowCompleted: true));
  }

  void onLoginWithGoogle(String idToken) async {
    final loginWithGoogleFuture = authCubit.loginWithGoogle(
      idToken: idToken,
      redirectUrl: redirectUrl,
    );

    final loadingLoginWithGoogleFailure =
        await loadingManager.startLoading(future: loginWithGoogleFuture);
    if (loadingLoginWithGoogleFailure != null) {
      failureHandlerManager.handle(loadingLoginWithGoogleFailure);
      return;
    }
    emit(state.copyWith(loginFlowCompleted: true));
  }
}
