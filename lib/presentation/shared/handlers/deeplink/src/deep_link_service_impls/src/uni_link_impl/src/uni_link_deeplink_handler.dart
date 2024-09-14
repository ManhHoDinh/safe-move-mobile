import 'package:flutter/material.dart';

import '../../../../deeplink_handler.dart';
import '../../../../deeplink_service.dart';
import 'uni_link_deeplink_service.dart';

class UniLinkDeepLinkHandler extends DeepLinkHandler {
  const UniLinkDeepLinkHandler({
    super.key,
    super.child,
    super.navigatorKey,
  });

  @override
  DeeplinkService createDeeplinkService(BuildContext context) {
    return UniLinkDeeplinkService();
  }
}
