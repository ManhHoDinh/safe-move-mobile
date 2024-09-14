import 'package:flutter/material.dart';

abstract class DeepLinkHandlerDelegate {
  const DeepLinkHandlerDelegate();

  @protected
  String resolveExternalUri(String uri) {
    final parsedUri = tryParseUri(uri);
    if (parsedUri == null) {
      return '/';
    }
    String resolvedPath;
    if (parsedUri.hasEmptyPath) {
      resolvedPath = '/';
    } else {
      resolvedPath = parsedUri.path;
    }
    final resolvedUri =
        Uri(path: resolvedPath, queryParameters: parsedUri.queryParameters);
    return resolvedUri.toString();
  }

  @protected
  Uri? tryParseUri(String uri) {
    return Uri.tryParse(uri);
  }

  @protected
  Uri parseUri(String uri) {
    return Uri.parse(uri);
  }

  void handleStartAppLink(BuildContext context, String? uri);

  void handleIncomingLink(BuildContext context, String uri);

  void handleError(BuildContext context, Object error);
}

class DefaultDeepLinkHandlerDelegate extends DeepLinkHandlerDelegate {
  const DefaultDeepLinkHandlerDelegate();

  @override
  void handleIncomingLink(BuildContext context, String uri) {}

  @override
  void handleError(BuildContext context, Object error) {}

  @override
  void handleStartAppLink(BuildContext context, String? uri) {}
}
