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
import '../main_screen/widgets/indexed_stack_slider.dart';
import 'bloc/find_id_cubit.dart';
import 'bloc/find_id_state.dart';
import 'widgets/form_find_id_section.dart';
import 'widgets/result_username_section.dart';

class FindIdScreen extends StatelessWidget {
  const FindIdScreen({super.key});

  String renderDialogContent(BuildContext context, DialogContent error) {
    switch (error) {
      case DialogContent.phoneNumberNotExisted:
        return S.of(context).phoneNumberNotExisted;
      case DialogContent.verifyOTPSuccess:
        return S.of(context).verifyOTPSuccess;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FindIdCubit>(
      create: (BuildContext context) {
        return FindIdCubit(
          userController: context.read<UserController>(),
          authController: context.read<AuthController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          initialState: const FindIdState(),
        );
      },
      child: BlocListener<FindIdCubit, FindIdState>(
        listenWhen: (prev, curr) {
          return prev.findIdFlowCompleted != curr.findIdFlowCompleted ||
              prev.dialogContent != curr.dialogContent;
        },
        listener: (BuildContext context, FindIdState state) async {
          if (state.dialogContent != null) {
            final String content =
                renderDialogContent(context, state.dialogContent!);
            context.read<FindIdCubit>().dialogHandled();

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
          body: BlocBuilder<FindIdCubit, FindIdState>(buildWhen: (prev, curr) {
            return prev.findIdFlowCompleted != curr.findIdFlowCompleted;
          }, builder: (context, state) {
            return IndexedStackSlider(
              currentIndex: state.findIdFlowCompleted ? 1 : 0,
              children: [
                const FindIdFormSection(),
                ResultUsernameSection(
                  phoneNumber: state.phoneField.value,
                  username: state.username,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
