import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/bottom_button.dart';
import '../../../shared/widgets/form_fields/form_password_fields.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../bloc/reset_password_cubit.dart';
import '../bloc/reset_password_state.dart';

class NewPasswordFormSection extends StatelessWidget {
  const NewPasswordFormSection(
      {super.key, required this.sessionToken, required this.username});

  final String sessionToken;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 24, bottom: 16),
          child: Column(
            children: [
              Text(
                S.of(context).pleaseEnterPassword,
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.common),
              ),
              Text(
                S.of(context).passwordCondition,
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.gray.shade600),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  buildWhen: (prev, curr) {
                return prev.passwordField.value != curr.passwordField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderPassword,
                  obscure: true,
                  onChanged: (value) {
                    context.read<ResetPasswordCubit>().onPasswordChanged(value);
                  },
                  errorText: renderPasswordError(
                      context, state.passwordField.displayError),
                );
              }),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  buildWhen: (prev, curr) {
                return prev.passwordField.value != curr.passwordField.value ||
                    prev.confirmPasswordField.value !=
                        curr.confirmPasswordField.value;
              }, builder: (context, state) {
                return CommonTextField(
                  hintText: S.of(context).placeHolderConfirmPassword,
                  obscure: true,
                  onChanged: (value) {
                    context.read<ResetPasswordCubit>().onConfirmPasswordChanged(
                        state.passwordField.value, value);
                  },
                  errorText: renderPasswordError(
                      context, state.confirmPasswordField.displayError),
                );
              }),
            ],
          ),
        )),
        BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            buildWhen: (prev, curr) {
          return prev.canResetPassword != curr.canResetPassword;
        }, builder: (context, state) {
          return BottomButton(
            title: S.of(context).findPassword,
            onPress: state.canResetPassword
                ? () {
                    context.read<ResetPasswordCubit>().onSubmit();
                  }
                : null,
          );
        }),
      ],
    );
  }
}
