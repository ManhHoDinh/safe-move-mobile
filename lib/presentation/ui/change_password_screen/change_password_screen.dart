import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/auth/auth.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../../shared/widgets/form_fields/form_password_fields.dart';
import '../../shared/widgets/textfields/common_textfield.dart';
import 'blocs/change_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  String? renderOldPasswordError(
      BuildContext context, OldPasswordFieldError? error) {
    switch (error) {
      case null:
        return null;
      case OldPasswordFieldError.empty:
        return S.of(context).empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
      create: (BuildContext context) {
        return ChangePasswordCubit(
          authController: context.read<AuthController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
        );
      },
      child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (BuildContext context, ChangePasswordState state) {
          if (state.changePasswordCompleted) {
            context.pop(true);
          }
        },
        child: Scaffold(
          appBar: CommonAppBar(
            title: Text(
              S.of(context).changePassword,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
              builder: (context, state) {
            return Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 8, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).currentPassword,
                        style: Styles.s15()
                            .withHeight(24 / 15)
                            .withLetterSpacing(-2.5 / 100)
                            .withColor(AppColors.text.common),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CommonTextField(
                        obscure: true,
                        hintText: S.of(context).currentPassword,
                        onChanged: (value) {
                          context
                              .read<ChangePasswordCubit>()
                              .changeCurrentPasswordField(value);
                        },
                        errorText: renderOldPasswordError(
                            context, state.oldPasswordField.displayError),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).passwordToChange,
                        style: Styles.s15()
                            .withHeight(24 / 15)
                            .withLetterSpacing(-2.5 / 100)
                            .withColor(AppColors.text.common),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CommonTextField(
                        obscure: true,
                        hintText: S.of(context).passwordToChange,
                        onChanged: (value) {
                          context
                              .read<ChangePasswordCubit>()
                              .changeNewPasswordField(value);
                        },
                        errorText: renderPasswordError(
                            context, state.newPasswordField.displayError),
                      )
                    ],
                  ),
                )),
                BottomButton(
                  onPress: !state.canSubmit
                      ? null
                      : () {
                          context.read<ChangePasswordCubit>().onSubmit();
                        },
                  title: S.of(context).change,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
