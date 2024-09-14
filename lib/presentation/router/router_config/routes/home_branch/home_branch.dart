import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../ui/drawer_screen/drawer_screen.dart';
import '../../../../ui/home_screen/home_screen.dart';
import '../../../../ui/login_screen/login_screen.dart';
import '../../../../ui/notification_screen/notification_screen.dart';
import '../../../app_nav_key/app_nav_key.dart';

class HomeBranchData extends StatefulShellBranchData {
  const HomeBranchData();
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class DrawerRouteData extends GoRouteData {
  const DrawerRouteData();

  static const routeName = 'drawer';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DrawerScreen.buildPage(context, state);
  }
}

class NotificationRouteData extends GoRouteData {
  const NotificationRouteData();

  static const routeName = 'notification';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationScreen();
  }
}

class HomeLoginRouteData extends GoRouteData {
  const HomeLoginRouteData({
    this.redirectUrl,
  });

  final String? redirectUrl;

  static const routeName = 'login';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(
      redirectUrl: redirectUrl,
    );
  }
}
