import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../../shared/widgets/form_fields/form_username_fields.dart';
import '../../../shared/widgets/textfields/button_textfield.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../bloc/reset_password_cubit.dart';
import '../bloc/reset_password_state.dart';

class VerifyAccountFormSection extends StatelessWidget {
  const VerifyAccountFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 16),
      child: Column(
        children: [
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (prev, curr) {
            return prev.usernameField.value != curr.usernameField.value;
          }, builder: (context, state) {
            return CommonTextField(
              hintText: S.of(context).placeHolderId,
              onChanged: (value) {
                context.read<ResetPasswordCubit>().onUsernameChanged(value);
              },
              errorText: renderUsernameError(
                  context, state.usernameField.displayError),
            );
          }),
          const SizedBox(height: 24),
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
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
                context.read<ResetPasswordCubit>().onPhoneChanged(value);
              },
              errorText:
                  renderPhoneError(context, state.phoneField.displayError),
              keyboardType: TextInputType.phone,
              onSubmit: (value) {
                context.read<ResetPasswordCubit>().onSendOTP();
              },
            );
          }),
          const SizedBox(height: 12),
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
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
                context.read<ResetPasswordCubit>().onOTPChanged(value);
              },
              errorText: renderOTPError(context, state.otpField.displayError),
              keyboardType: TextInputType.phone,
              onSubmit: (value) {
                context.read<ResetPasswordCubit>().onVerifyOTP();
              },
            );
          }),
          const Spacer(),
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (prev, curr) {
            return prev.canVerifyAccount != curr.canVerifyAccount;
          }, builder: (context, state) {
            return SafeArea(
              top: false,
              child: PrimaryButton.square(
                onPressed: state.canVerifyAccount
                    ? () {
                        context.read<ResetPasswordCubit>().onVerifyAccount();
                      }
                    : null,
                title: S.of(context).findPassword,
              ),
            );
          }),
        ],
      ),
    );
  }
}
