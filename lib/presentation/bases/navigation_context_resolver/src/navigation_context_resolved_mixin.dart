import 'package:flutter/material.dart';

import '../../global_key_provider/global_key_provider.dart';
import 'exceptions.dart';

mixin NavigationContextResolverMixin {
  BuildContext? maybeResolve(
    BuildContext context, {
    GlobalKey<NavigatorState>? navigatorKey,
    bool rootNavigator = false,
  }) {
    final resolvedContext = navigatorKey?.currentContext ??
        Navigator.maybeOf(context, rootNavigator: rootNavigator)?.context ??
        GlobalKeyProvider.maybeOf<NavigatorState>(context)?.currentContext;
    return resolvedContext;
  }

  BuildContext resolve(
    BuildContext context, {
    GlobalKey<NavigatorState>? navigatorKey,
    bool rootNavigator = false,
  }) {
    final resolved = maybeResolve(
      context,
      navigatorKey: navigatorKey,
      rootNavigator: rootNavigator,
    );
    if (resolved == null) {
      throw const NavigationContextNotFoundException();
    }
    return resolved;
  }
}
