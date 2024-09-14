import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bases/auth_cubit/auth_cubit.dart';
import '../../bases/bootstrap_cubit/bootstrap_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import 'bloc/login_cubit.dart';
import 'bloc/login_state.dart';
import 'widgets/login_form_section.dart';
import 'widgets/social_login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    this.redirectUrl,
  });
  final String? redirectUrl;

  static const logoFraction = 0.25;
  static const formSection = 0.3;
  static const social = 0.2;

  static Page<void> buildPage(BuildContext context, GoRouterState state,
      {String? redirectUrl}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: LoginScreen(
        redirectUrl: redirectUrl,
      ),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return CustomTransitionBuilder.slideFromBottomTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      },
    );
  }

  void handleNav(BuildContext context) {
    final authStatus =
        context.read<AuthCubit>().state as AuthStatusLoggedInState;

    if (authStatus.userNeedVerify) {
      const TermAndCondAcceptRouteData(type: 1).go(context);
    } else {
      const HomeRouteData().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) {
        return LoginCubit(
          redirectUrl: redirectUrl,
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          authCubit: context.read<AuthCubit>(),
        );
      },
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(listenWhen: (prev, curr) {
            return prev.loginFlowCompleted != curr.loginFlowCompleted;
          }, listener: (BuildContext context, LoginState state) {
            if (state.loginFlowCompleted && context.mounted) {
              handleNav(context);
            }
          }),
          BlocListener<AuthCubit, AuthStatusState>(
            listenWhen: (previous, current) {
              return current is AuthStatusLoggedInState &&
                  previous.runtimeType != current.runtimeType;
            },
            listener: (context, state) {
              if (state is AuthStatusLoggedInState) {
                handleNav(context);
              }
            },
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CommonAppBar(
            closeIcon: Assets.svgs.appBarCloseIcon.svg(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: constraints.maxHeight * logoFraction,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Assets.svgs.logoMain.svg(
                        color: AppColors.blue.shade500,
                      ),
                    ),
                  ),
                  const LoginFormSection(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: constraints.maxHeight * social,
                    child: const SocialLoginSection(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
