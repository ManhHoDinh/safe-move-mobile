import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';

import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../bases/bootstrap_cubit/bootstrap_cubit.dart';
import '../../../bases/navigation_context_resolver/navigation_context_resolver.dart';
import '../../../router/router_config/router_config.dart';

class AuthBasedRoutingHandler extends SingleChildStatefulWidget {
  const AuthBasedRoutingHandler({
    super.key,
    super.child,
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  SingleChildState<AuthBasedRoutingHandler> createState() =>
      _AuthBasedRoutingHandlerState();
}

class _AuthBasedRoutingHandlerState
    extends SingleChildState<AuthBasedRoutingHandler>
    with NavigationContextResolverMixin {
  bool _loginWhenStartedAttempt = true;

  void resolveGoHomeOrTermAccept(BuildContext context) {
    final bootstrapState = context.read<BootstrapCubit>().state;
    if (!bootstrapState.haveReadTermAndCond) {
      const HomeLoginRouteData().go(context);
      return;
    }
    const HomeRouteData().go(context);
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<AuthCubit, AuthStatusState>(
      listener: (_, state) {
        final navContext = maybeResolve(context);
        if (navContext == null) {
          return;
        }
        if (state is AuthStatusLoggedInState) {
          if (state.userNeedVerify) {
            if (_loginWhenStartedAttempt) {
              _loginWhenStartedAttempt = false;
              const UserInfoSupplementRouteData().go(navContext);
            }
          } else if (state.redirectUrl != null) {
            navContext.go(state.redirectUrl!);
          } else if (_loginWhenStartedAttempt) {
            _loginWhenStartedAttempt = false;
            const HomeRouteData().go(navContext);
          }
        }
        if (state is AuthStatusLoggedOutState) {
          if (_loginWhenStartedAttempt) {
            _loginWhenStartedAttempt = false;
            if (state.url != null) {
              navContext.go(state.url!);
              return;
            }
            resolveGoHomeOrTermAccept(navContext);
          }
        }
      },
      child: child,
    );
  }
}
