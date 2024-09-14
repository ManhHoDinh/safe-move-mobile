import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../../bases/global_key_provider/global_key_provider.dart';
import 'base_route_path.dart';

class _GoRouterConfigScope {
  const _GoRouterConfigScope(this.goRouter);

  final GoRouter goRouter;
}

abstract class GoRouterConfig extends SingleChildStatelessWidget {
  const GoRouterConfig({
    super.key,
    super.child,
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  static GoRouter of(BuildContext context) {
    return context.read<_GoRouterConfigScope>().goRouter;
  }

  @protected
  BaseRoutePath createRouterPath(BuildContext context);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider(
      create: (context) {
        final routePath = createRouterPath(context);
        final goRouter = routePath.createGoRouter(
          context: context,
          navigatorKey: navigatorKey ??
              GlobalKeyProvider.maybeOf<NavigatorState>(context),
        );
        return _GoRouterConfigScope(goRouter);
      },
      child: child,
    );
  }
}
