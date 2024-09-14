import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utilities/logging/logging.dart';
import '../../bases/go_router/go_router.dart';
import 'routes/home_branch/home_branch.dart';
import 'routes_gen/routes_gen.dart';

export 'routes/routes.dart';
export 'routes_gen/routes_gen.dart';

class AppRoutingConfig extends GoRouterConfig {
  const AppRoutingConfig({super.key});

  @override
  BaseRoutePath createRouterPath(BuildContext context) {
    return AppRoutePath();
  }
}

class AppRoutePath extends BaseRoutePath {
  @override
  GoRouter createGoRouter({
    required BuildContext context,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return GoRouter(
      initialLocation: SplashRoute.routeName,
      debugLogDiagnostics: true,
      navigatorKey: navigatorKey,
      routes: $appRoutes,
      onException: (context, state, router) {
        logging.e('invalid route, redirect to home...');
        router.go(const HomeRouteData().location);
      },
    );
  }
}
