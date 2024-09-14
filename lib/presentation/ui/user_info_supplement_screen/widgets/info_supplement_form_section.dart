import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/widgets/buttons/bottom_button.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../../shared/widgets/textfields/button_textfield.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../blocs/user_info_supplement_cubit.dart';
import '../blocs/user_info_supplement_state.dart';

class InfoSupplementFormSection extends StatelessWidget {
  const InfoSupplementFormSection({super.key});

  String? renderInfoSupplementError(
      BuildContext context, UserInfoSupplementNameFieldError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case UserInfoSupplementNameFieldError.empty:
        return S.of(context).empty;
    }
  }

  void saveDataSuccess(BuildContext context) {
    const HomeRouteData().go(context);
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
              BlocBuilder<UserInfoSupplementCubit, UserInfoSupplementState>(
                  buildWhen: (prev, curr) {
                return prev.nameField.value != curr.nameField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  initialValue: state.nameField.value,
                  hintText: S.of(context).placeHolderName,
                  onChanged: (value) {
                    context
                        .read<UserInfoSupplementCubit>()
                        .onNameChanged(value);
                  },
                  errorText: renderInfoSupplementError(
                      context, state.nameField.displayError),
                );
              }),
              const SizedBox(height: 24),
              BlocBuilder<UserInfoSupplementCubit, UserInfoSupplementState>(
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
                    context
                        .read<UserInfoSupplementCubit>()
                        .onPhoneChanged(value);
                  },
                  errorText:
                      renderPhoneError(context, state.phoneField.displayError),
                  keyboardType: TextInputType.phone,
                  onSubmit: (value) {
                    context.read<UserInfoSupplementCubit>().onSendOTP();
                  },
                );
              }),
              const SizedBox(height: 12),
              BlocBuilder<UserInfoSupplementCubit, UserInfoSupplementState>(
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
                    context.read<UserInfoSupplementCubit>().onOTPChanged(value);
                  },
                  errorText:
                      renderOTPError(context, state.otpField.displayError),
                  keyboardType: TextInputType.phone,
                  onSubmit: (value) {
                    context.read<UserInfoSupplementCubit>().onVerifyOTP();
                  },
                );
              }),
              const SizedBox(height: 24),
              BlocBuilder<UserInfoSupplementCubit, UserInfoSupplementState>(
                  buildWhen: (prev, curr) {
                return prev.referrerPhoneNumberField.value !=
                    curr.referrerPhoneNumberField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderReferrerPhoneNumber,
                  onChanged: (value) {
                    context
                        .read<UserInfoSupplementCubit>()
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
        BlocBuilder<UserInfoSupplementCubit, UserInfoSupplementState>(
          buildWhen: (prev, curr) {
            return prev.canUpdateInformation != curr.canUpdateInformation;
          },
          builder: (context, state) {
            return BottomButton(
              onPress: state.canUpdateInformation
                  ? () {
                      context.read<UserInfoSupplementCubit>().onSubmit(
                          saveSuccess: () => saveDataSuccess(context));
                    }
                  : null,
              title: S.of(context).save,
            );
          },
        ),
      ],
    );
  }
}
