import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../application/services/auth/auth.dart';
import '../../../application/services/user/user.dart';
import '../../../utilities/failure/failure.dart';
import '../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../widgets/form_fields/form_phone_fields.dart';

class ResponseOTP {
  ResponseOTP({
    this.failure,
    this.isExistPhoneNumber,
  });

  final Failure? failure;
  final bool? isExistPhoneNumber;
}

abstract class OTPState extends Equatable {
  const OTPState({
    this.phoneField = const PhoneField.pure(),
    this.otpField = const OTPField.pure(),
    this.verifyPhoneNumberFlowCompleted = false,
    this.otpSessionId,
    this.expiredIn = 0,
    this.sessionToken,
  });

  final PhoneField phoneField;
  final OTPField otpField;
  final bool verifyPhoneNumberFlowCompleted;
  final String? otpSessionId;
  final int expiredIn;
  final String? sessionToken;

  bool get canSentOTP {
    return phoneField.isValid && expiredIn == 0;
  }

  bool get canEnterOTP {
    return expiredIn > 0;
  }

  bool get canVerifyOTP {
    return otpField.isValid && expiredIn > 0;
  }

  OTPState sendOtpStateChanged({
    PhoneField? phoneField,
    OTPField? otpField,
    bool? verifyPhoneNumberFlowCompleted,
    String? otpSessionId,
    int? expiredIn,
    String? sessionToken,
  });

  @override
  List<Object?> get props => [
        phoneField.value,
        phoneField.error,
        otpField.value,
        otpField.error,
        verifyPhoneNumberFlowCompleted,
        otpSessionId,
        expiredIn,
        sessionToken,
      ];
}

class OTPCubit<T extends OTPState> extends SafeCubit<T> {
  OTPCubit(
      {required this.userController,
      required this.authController,
      required T initialState})
      : super(initialState);

  final UserController userController;
  final AuthController authController;
  Timer? timer;

  void onPhoneChanged(String value) {
    emit(
      state.sendOtpStateChanged(
        phoneField: PhoneField.dirty(value: value),
        verifyPhoneNumberFlowCompleted: false,
      ) as T,
    );
  }

  void onOTPChanged(String value) {
    emit(
      state.sendOtpStateChanged(
        otpField: OTPField.dirty(
          value: value,
        ),
      ) as T,
    );
  }

  void _startTimer(int countdown) {
    if (timer?.isActive ?? false) {
      return;
    }
    emit(state.sendOtpStateChanged(expiredIn: countdown) as T);
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (state.expiredIn == 0) {
          timer.cancel();
        } else {
          emit(state.sendOtpStateChanged(expiredIn: state.expiredIn - 1) as T);
        }
      },
    );
  }

  Future<ResponseOTP?> performSendOTP(bool existPhoneNumber) async {
    final String phoneNumber = state.phoneField.value;
    final checkPhoneNumberExistedResult =
        await userController.checkExistPhoneNumber(
      CheckExistPhoneNumberRequest(
        phoneNumber: phoneNumber,
      ),
    );
    if (checkPhoneNumberExistedResult.isLeft) {
      return ResponseOTP(failure: checkPhoneNumberExistedResult.left);
    }
    final phoneNumberExisted = checkPhoneNumberExistedResult.right.existed;
    if (phoneNumberExisted != null && phoneNumberExisted != existPhoneNumber) {
      return ResponseOTP(isExistPhoneNumber: phoneNumberExisted);
    }
    final sendOTPResult = await authController.sendOtp(
      SendOTPRequest(
        phoneNumber: phoneNumber,
      ),
    );

    if (sendOTPResult.isLeft) {
      return ResponseOTP(failure: sendOTPResult.left);
    }
    sendOTPResult.handleRight((value) {
      emit(state.sendOtpStateChanged(otpSessionId: value.otpSessionId) as T);
      _startTimer(value.expiredIn ?? 0);
    });
    return null;
  }

  Future<Failure?> onVerifyOTP() async {
    final verifyOTPResult = await authController.verifyOtp(
      VerifyOTPRequest(
        otpSessionId: state.otpSessionId ?? '',
        otp: state.otpField.value,
      ),
    );

    if (verifyOTPResult.isLeft) {
      return verifyOTPResult.left;
    }

    verifyOTPResult.handleRight((value) {
      emit(state.sendOtpStateChanged(
        sessionToken: value.token,
        verifyPhoneNumberFlowCompleted: true,
        expiredIn: 0,
      ) as T);
    });
    return null;
  }
}
