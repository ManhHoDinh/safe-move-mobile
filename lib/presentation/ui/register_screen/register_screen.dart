import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/auth/auth.dart';
import '../../../application/services/user/controller/controller.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import 'bloc/register_cubit.dart';
import 'bloc/register_state.dart';
import 'widgets/register_form_section.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  String renderDialogContent(BuildContext context, DialogContent error) {
    switch (error) {
      case DialogContent.usernameExisted:
        return S.of(context).usernameExisted;
      case DialogContent.phoneNumberExisted:
        return S.of(context).phoneNumberExisted;
      case DialogContent.verifyOTPSuccess:
        return S.of(context).verifyOTPSuccess;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (BuildContext context) {
        return RegisterCubit(
          userController: context.read<UserController>(),
          authController: context.read<AuthController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          initialState: const RegisterState(),
        );
      },
      child: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (prev, curr) {
          return prev.registerFlowCompleted != curr.registerFlowCompleted ||
              prev.dialogContent != curr.dialogContent;
        },
        listener: (BuildContext context, RegisterState state) async {
          if (state.registerFlowCompleted && context.mounted) {
            const ProfileLoginRouteData().go(context);
          }
          if (state.dialogContent != null) {
            final String content =
                renderDialogContent(context, state.dialogContent!);
            context.read<RegisterCubit>().dialogHandled();
            AlertRouteData(content: content).push(context);
          }
        },
        child: Scaffold(
          appBar: CommonAppBar(
            title: Text(
              S.of(context).joinMemberShip,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100),
            ),
            centerTitle: true,
          ),
          body: const RegisterFormSection(),
        ),
      ),
    );
  }
}
