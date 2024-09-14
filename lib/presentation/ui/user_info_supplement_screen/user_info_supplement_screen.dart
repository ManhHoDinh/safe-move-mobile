import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/auth/controller/controller.dart';
import '../../../application/services/user/controller/controller.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import 'blocs/user_info_supplement_cubit.dart';
import 'blocs/user_info_supplement_state.dart';
import 'widgets/info_supplement_form_section.dart';

class UserInfoSupplementScreen extends StatelessWidget {
  const UserInfoSupplementScreen({super.key});

  String renderDialogContent(BuildContext context, DialogContent error) {
    switch (error) {
      case DialogContent.phoneNumberExisted:
        return S.of(context).phoneNumberExisted;
      case DialogContent.verifyOTPSuccess:
        return S.of(context).verifyOTPSuccess;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoSupplementCubit>(
      create: (BuildContext context) {
        return UserInfoSupplementCubit(
          userController: context.read<UserController>(),
          authController: context.read<AuthController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
        );
      },
      child: BlocListener<UserInfoSupplementCubit, UserInfoSupplementState>(
        listenWhen: (prev, curr) {
          return prev.updateInfoFlowCompleted != curr.updateInfoFlowCompleted ||
              prev.dialogContent != curr.dialogContent;
        },
        listener: (BuildContext context, UserInfoSupplementState state) async {
          if (state.updateInfoFlowCompleted && context.mounted) {
            context.pop();
          }
          if (state.dialogContent != null) {
            final String content =
                renderDialogContent(context, state.dialogContent!);
            context.read<UserInfoSupplementCubit>().dialogHandled();
            AlertRouteData(content: content).push(context);
          }
        },
        child: Scaffold(
            appBar: CommonAppBar(
              title: Text(
                S.of(context).informationSupplement,
                style: Styles.s15()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100),
              ),
              centerTitle: true,
            ),
            body: BlocBuilder<UserInfoSupplementCubit, UserInfoSupplementState>(
                builder: (context, state) {
              if (state.apiStatus == ApiStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const InfoSupplementFormSection();
            })),
      ),
    );
  }
}
