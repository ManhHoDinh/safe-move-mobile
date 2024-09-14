import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../../application/services/app/app_config/app_config.dart';
import '../../../../utilities/logging/logging.dart';
import '../../../bases/childless_assertion/childless_assertion.dart';
import '../../../bases/navigation_context_resolver/navigation_context_resolver.dart';

class OneSignalHandler extends SingleChildStatefulWidget {
  const OneSignalHandler({
    super.key,
    super.child,
    this.navigatorKey,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  SingleChildState<OneSignalHandler> createState() =>
      _AuthBasedRoutingHandlerState();
}

class _AuthBasedRoutingHandlerState extends SingleChildState<OneSignalHandler>
    with NavigationContextResolverMixin, StateChildlessAssertion {
  BuildContext get navContext => resolve(context);

  @override
  void initState() {
    super.initState();
    _initOneSignal();
  }

  void _initOneSignal() {
    final appConfig = context.read<AppConfig>();
    //Remove this method to stop OneSignal Debugging
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize(appConfig.oneSignalAppId);

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission(true);
    OneSignal.Notifications.addClickListener((event) {
      logging.i(event.notification.launchUrl);
      logging.i(event.result.url);
    });
  }
}
