import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'deeplink_handler_delegate.dart';
import 'deeplink_handler_widget.dart';
import 'deeplink_service.dart';

abstract class DeepLinkHandler extends SingleChildStatelessWidget {
  const DeepLinkHandler({
    super.key,
    super.child,
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  @protected
  DeepLinkHandlerDelegate createDelegate(BuildContext context) {
    return const DefaultDeepLinkHandlerDelegate();
  }

  @protected
  DeeplinkService createDeeplinkService(BuildContext context);

  @protected
  SingleChildWidget createScope(BuildContext context) {
    return Provider<DeeplinkService>(
      create: (context) => createDeeplinkService(context),
    );
  }

  @protected
  SingleChildWidget createHandlerWidget(BuildContext context) {
    final delegate = createDelegate(context);
    return DeepLinkHandlerWidget(
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
