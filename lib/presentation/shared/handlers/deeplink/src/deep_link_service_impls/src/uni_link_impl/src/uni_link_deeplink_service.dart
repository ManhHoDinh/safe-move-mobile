import 'package:uni_links/uni_links.dart';

import '../../../../deeplink_service.dart';

class UniLinkDeeplinkService extends DeeplinkService {
  @override
  Stream<String?> handleIncomingLinks() {
    return linkStream;
  }

  @override
  Future<String?> handleInitialLink() {
    return getInitialLink();
  }
}
