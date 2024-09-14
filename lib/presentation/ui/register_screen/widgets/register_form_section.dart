import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/buttons/bottom_button.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../../shared/widgets/form_fields/form_username_fields.dart';
import '../../../shared/widgets/textfields/button_textfield.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../bloc/register_cubit.dart';
import '../bloc/register_state.dart';

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

  String? renderRegisterError(
      BuildContext context, RegisterNameFieldError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case RegisterNameFieldError.empty:
        return S.of(context).empty;
    }
  }

  String? renderDoubleCheckError(
      int isChecked, BuildContext context, UsernameFieldError? error) {
    if (isChecked == 1) {
      return null;
    }
    if (isChecked == 0) {
      return S.of(context).doubleCheckFail;
    }
    return renderUsernameError(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 16),
          child: Column(
            children: [
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.canCheckExistUsername !=
                        curr.canCheckExistUsername ||
                    prev.usernameField.value != curr.usernameField.value ||
                    prev.checkExistUsernameCompleted !=
                        curr.checkExistUsernameCompleted;
              }, builder: (context, state) {
                return ButtonTextField(
                    enableButton: state.canCheckExistUsername,
                    buttonTitle: S.of(context).doubleCheck,
                    hintText: S.of(context).placeHolderId,
                    onChanged: (value) {
                      context.read<RegisterCubit>().onUsernameChanged(value);
                    },
                    onSubmit: (value) {
                      context.read<RegisterCubit>().onCheckExistUsername();
                    },
                    successText:
                        state.isSubmitted && state.checkExistUsernameCompleted
                            ? S.of(context).doubleCheckSuccess
                            : null,
                    errorText: renderDoubleCheckError(
                        state.isSubmitted
                            ? state.checkExistUsernameCompleted
                                ? 1
                                : 0
                            : -1,
                        context,
                        state.usernameField.displayError));
              }),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.passwordField.value != curr.passwordField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderPassword,
                  obscure: true,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onPasswordChanged(value);
                  },
                  errorText: renderPasswordError(
                      context, state.passwordField.displayError),
                );
              }),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.passwordField.value != curr.passwordField.value ||
                    prev.confirmPasswordField.value !=
                        curr.confirmPasswordField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderConfirmPassword,
                  obscure: true,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onConfirmPasswordChanged(
                        state.passwordField.value, value);
                  },
                  errorText: renderPasswordError(
                      context, state.confirmPasswordField.displayError),
                );
              }),
              const SizedBox(height: 24),
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.nameField.value != curr.nameField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderName,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onNameChanged(value);
                  },
                  errorText: renderRegisterError(
                      context, state.nameField.displayError),
                );
              }),
              const SizedBox(height: 24),
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.canSentOTP != curr.canSentOTP ||
                    prev.phoneField.value != curr.phoneField.value ||
                    prev.expiredIn != curr.expiredIn;
              }, builder: (context, state) {
                return ButtonTextField(
                  enableTextField: !state.canEnterOTP,
                  enableButton: state.canSentOTP,
                  buttonTitle: state.expiredIn != 0
                      ? state.expiredIn.toString()
                      : S.of(context).sendAuthentication,
                  hintText: S.of(context).placeHolderPhone,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onPhoneChanged(value);
                  },
                  errorText:
                      renderPhoneError(context, state.phoneField.displayError),
                  keyboardType: TextInputType.phone,
                  onSubmit: (value) {
                    context.read<RegisterCubit>().onSendOTP();
                  },
                );
              }),
              const SizedBox(height: 12),
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.canVerifyOTP != curr.canVerifyOTP ||
                    prev.canEnterOTP != curr.canEnterOTP ||
                    prev.expiredIn != curr.expiredIn;
              }, builder: (context, state) {
                return ButtonTextField(
                  enableButton: state.canVerifyOTP,
                  enableTextField: state.canEnterOTP,
                  buttonTitle: S.of(context).verify,
                  hintText: S.of(context).otpNumber,
                  onChanged: (value) {
                    context.read<RegisterCubit>().onOTPChanged(value);
                  },
                  errorText:
                      renderOTPError(context, state.otpField.displayError),
                  keyboardType: TextInputType.phone,
                  onSubmit: (value) {
                    context.read<RegisterCubit>().onVerifyOTP();
                  },
                );
              }),
              const SizedBox(height: 24),
              BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (prev, curr) {
                return prev.referrerPhoneNumberField.value !=
                    curr.referrerPhoneNumberField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderReferrerPhoneNumber,
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .onReferrerPhoneNumberChanged(value);
                  },
                  errorText: renderPhoneError(
                      context, state.referrerPhoneNumberField.displayError),
                  keyboardType: TextInputType.phone,
                );
              }),
            ],
          ),
        )),
        BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (prev, curr) {
            return prev.canRegister != curr.canRegister;
          },
          builder: (context, state) {
            return BottomButton(
              onPress: state.canRegister
                  ? () {
                      context.read<RegisterCubit>().onSubmit();
                    }
                  : null,
              title: S.of(context).joinMemberShip,
            );
          },
        ),
      ],
    );
  }
}
