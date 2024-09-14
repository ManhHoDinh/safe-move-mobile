import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/auth/auth.dart';
import '../../../application/services/user/controller/controller.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/success_section.dart';
import '../main_screen/widgets/indexed_stack_slider.dart';
import 'bloc/reset_password_cubit.dart';
import 'bloc/reset_password_state.dart';
import 'widgets/new_password_form_section.dart';
import 'widgets/verify_account_form_section.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  String renderDialogContent(BuildContext context, DialogContent error) {
    switch (error) {
      case DialogContent.phoneNumberNotExisted:
        return S.of(context).phoneNumberNotExisted;
      case DialogContent.verifyOTPSuccess:
        return S.of(context).verifyOTPSuccess;
      case DialogContent.verifyAccountFailed:
        return S.of(context).verifyAccountFailed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (BuildContext context) {
        return ResetPasswordCubit(
          userController: context.read<UserController>(),
          authController: context.read<AuthController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          initialState: const ResetPasswordState(),
        );
      },
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listenWhen: (prev, curr) {
          return prev.verifyAccountFlowCompleted !=
                  curr.verifyAccountFlowCompleted ||
              prev.dialogContent != curr.dialogContent;
        },
        listener: (BuildContext context, ResetPasswordState state) async {
          if (state.dialogContent != null) {
            final String content =
                renderDialogContent(context, state.dialogContent!);
            context.read<ResetPasswordCubit>().dialogHandled();
            AlertRouteData(content: content).push(context);
          }
        },
        child: Scaffold(
          appBar: CommonAppBar(
            title: Text(
              S.of(context).findId,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100),
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              buildWhen: (prev, curr) {
            return prev.verifyAccountFlowCompleted !=
                    curr.verifyAccountFlowCompleted ||
                prev.changePasswordFlowCompleted !=
                    curr.changePasswordFlowCompleted;
          }, builder: (context, state) {
            return IndexedStackSlider(
              currentIndex: state.verifyAccountFlowCompleted
                  ? state.changePasswordFlowCompleted
                      ? 2
                      : 1
                  : 0,
              children: [
                const VerifyAccountFormSection(),
                NewPasswordFormSection(
                    sessionToken: state.sessionToken ?? '',
                    username: state.usernameField.value),
                SuccessFailedStatusSection(
                  content: S
                      .of(context)
                      .resetPasswordSuccess(state.phoneField.value),
                  onPress: () {
                    context.pop();
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
