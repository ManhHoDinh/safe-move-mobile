import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

import 'loading_handler_widget.dart';
import 'loading_manager_scope.dart';
import 'loading_widget_builder_delegate.dart';

class LoadingHandler extends SingleChildStatelessWidget {
  const LoadingHandler({
    super.key,
    this.navigatorKey,
    super.child,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  @protected
  LoadingWidgetBuilderDelegate createDelegate(BuildContext context) {
    return DefaultLoadingWidgetBuilderDelegate();
  }

  @protected
  SingleChildWidget createScope(BuildContext context) {
    return const LoadingManagerScope();
  }

  @protected
  SingleChildWidget createHandlerWidget(BuildContext context) {
    final delegate = createDelegate(context);
    return LoadingHandlerWidget(
      navigatorKey: navigatorKey,
      delegate: delegate,
    );
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Nested(
      children: [
        createScope(context),
        createHandlerWidget(context),
      ],
      child: child,
    );
  }
}
