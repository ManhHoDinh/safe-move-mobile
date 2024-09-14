import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../../../bases/childless_assertion/childless_assertion.dart';
import '../../../../bases/navigation_context_resolver/navigation_context_resolver.dart';
import 'deeplink_handler_delegate.dart';
import 'deeplink_service.dart';

class DeepLinkHandlerWidget extends SingleChildStatefulWidget {
  const DeepLinkHandlerWidget({
    super.key,
    super.child,
    this.navigatorKey,
    required this.delegate,
  });

  final DeepLinkHandlerDelegate delegate;

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<DeepLinkHandlerWidget> createState() => DeepLinkingHandlerWidgetState();
}

class DeepLinkingHandlerWidgetState
    extends SingleChildState<DeepLinkHandlerWidget>
    with StateChildlessAssertion, NavigationContextResolverMixin {
  late DeepLinkHandlerDelegate delegate;
  DeeplinkService? _deepLinkService;

  DeeplinkService get deepLinkService => _deepLinkService!;

  StreamSubscription<String?>? streamSubscription;

  BuildContext? get navigatorContext =>
      maybeResolve(context, navigatorKey: widget.navigatorKey);

  bool initialUriIsHandled = false;

  @override
  void initState() {
    super.initState();
    delegate = widget.delegate;
    _deepLinkService = context.read<DeeplinkService>();
    handleIncomingDeepLink();
    handleInitialUri();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @protected
  void handleIncomingDeepLink() {
    if (kIsWeb) {
      return;
    }
    streamSubscription =
        _deepLinkService?.handleIncomingLinks().listen((String? uri) {
      if (uri == null) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (navigatorContext == null || !navigatorContext!.mounted) {
          return;
        }
        delegate.handleIncomingLink(navigatorContext!, uri);
      });
    }, onError: (Object error) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (navigatorContext == null || !navigatorContext!.mounted) {
          return;
        }
        delegate.handleError(navigatorContext!, error);
      });
    });
  }

  @protected
  void handleInitialUri() async {
    if (initialUriIsHandled) {
      return;
    }
    initialUriIsHandled = true;
    try {
      final uri = await _deepLinkService?.handleInitialLink();
      // if (uri == null) return;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (navigatorContext == null || !navigatorContext!.mounted) {
          return;
        }
        delegate.handleStartAppLink(navigatorContext!, uri);
      });
    } catch (error) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (navigatorContext == null || !navigatorContext!.mounted) {
          return;
        }
        delegate.handleError(navigatorContext!, error);
      });
    }
  }
}
