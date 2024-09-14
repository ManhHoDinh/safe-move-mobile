import 'dart:async';

import '../../../../application/services/auth/auth.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import 'user_info_supplement_state.dart';

class UserInfoSupplementCubit extends SafeCubit<UserInfoSupplementState> {
  UserInfoSupplementCubit({
    required this.userController,
    required this.authController,
    required this.loadingManager,
    required this.failureHandlerManager,
  }) : super(const UserInfoSupplementState()) {
    reload();
  }

  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final UserController userController;
  final AuthController authController;
  Timer? timer;

  void reload() async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    final userInfoResult = await userController.getUserInfo();
    userInfoResult.handleLeft((value) {
      failureHandlerManager.handle(value);
      emit(state.copyWith(apiStatus: ApiStatus.fail));
    });

    userInfoResult.handleRight(
      (value) {
        emit(
          state.copyWith(
            nameField:
                UserInfoSupplementNameField.dirty(value: value.name ?? ''),
            apiStatus: ApiStatus.success,
          ),
        );
      },
    );
  }

  void onNameChanged(String value) {
    emit(
      state.copyWith(
        nameField: UserInfoSupplementNameField.dirty(
          value: value,
        ),
      ),
    );
  }

  void onPhoneChanged(String value) {
    emit(
      state.copyWith(
        phoneField: PhoneField.dirty(value: value),
        verifyPhoneNumberFlowCompleted: false,
      ),
    );
  }

  void onOTPChanged(String value) {
    emit(
      state.copyWith(
        otpField: OTPField.dirty(
          value: value,
        ),
      ),
    );
  }

  void onReferrerPhoneNumberChanged(String value) {
    emit(
      state.copyWith(
        referrerPhoneNumberField: ReferrerPhoneNumberField.dirty(
          value: value,
        ),
      ),
    );
  }

  void dialogHandled() {
    emit(state.dialogContentHandled());
  }

  void _startTimer(int countdown) {
    if (timer?.isActive ?? false) {
      return;
    }
    emit(state.copyWith(expiredIn: countdown));
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (state.expiredIn == 0) {
          timer.cancel();
        } else {
          emit(state.copyWith(expiredIn: state.expiredIn - 1));
        }
      },
    );
  }

  Future<void> performSendOTP() async {
    final String phoneNumber = state.phoneField.value;
    final checkPhoneNumberExistedResult =
        await userController.checkExistPhoneNumber(
      CheckExistPhoneNumberRequest(
        phoneNumber: phoneNumber,
      ),
    );
    if (checkPhoneNumberExistedResult.isLeft) {
      failureHandlerManager.handle(checkPhoneNumberExistedResult.left);
      return;
    }
    final phoneNumberExisted = checkPhoneNumberExistedResult.right.existed;
    if (phoneNumberExisted != null && phoneNumberExisted == true) {
      emit(state.copyWith(dialogContent: DialogContent.phoneNumberExisted));
      return;
    }
    final sendOTPResult = await authController.sendOtp(
      SendOTPRequest(
        phoneNumber: phoneNumber,
      ),
    );
    sendOTPResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });

    sendOTPResult.handleRight((value) {
      emit(state.copyWith(otpSessionId: value.otpSessionId));
      _startTimer(value.expiredIn ?? 0);
    });
  }

  void onSendOTP() async {
    loadingManager.startLoading(future: performSendOTP());
  }

  void onVerifyOTP() async {
    final verifyOTPResult = await loadingManager.startLoading(
        future: authController.verifyOtp(
      VerifyOTPRequest(
        otpSessionId: state.otpSessionId ?? '',
        otp: state.otpField.value,
      ),
    ));
    verifyOTPResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    verifyOTPResult.handleRight((value) {
      emit(
        state.copyWith(
          sessionToken: value.token,
          verifyPhoneNumberFlowCompleted: true,
          dialogContent: DialogContent.verifyOTPSuccess,
          expiredIn: 0,
        ),
      );
    });
  }

  void onSubmit({void Function()? saveSuccess}) async {
    final updateInformationFuture = userController.supplementUserInformation(
      SupplementUserInformationRequest(
        name: state.nameField.value,
        phoneNumber: state.phoneField.value,
        sessionToken: state.sessionToken ?? '',
        referralPhoneNumber: state.referrerPhoneNumberField.value.isEmpty
            ? null
            : state.referrerPhoneNumberField.value,
      ),
    );
    final updateInformationResult =
        await loadingManager.startLoading(future: updateInformationFuture);

    updateInformationResult.handleLeft((value) {
      failureHandlerManager.handle(value);
    });
    updateInformationResult.handleRight((value) {
      emit(state.copyWith(updateInfoFlowCompleted: true));
      if (saveSuccess != null) {
        saveSuccess(); // Call the saveSuccess callback if it’s not null
      }
    });
  }
}
