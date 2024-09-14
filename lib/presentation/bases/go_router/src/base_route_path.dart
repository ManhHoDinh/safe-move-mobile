import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseRoutePath {
  GoRouter createGoRouter({
    required BuildContext context,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: [],
    );
  }
}
