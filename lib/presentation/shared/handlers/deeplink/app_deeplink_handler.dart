import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../utilities/logging/logging.dart';
import '../../../bases/bootstrap_cubit/bootstrap_cubit.dart';
import 'src/deep_link_service_impls/src/uni_link_impl/src/uni_link_deeplink_handler.dart';
import 'src/deeplink_handler_delegate.dart';

class AppDeeplinkHandler extends UniLinkDeepLinkHandler {
  const AppDeeplinkHandler({super.key});

  @override
  DeepLinkHandlerDelegate createDelegate(BuildContext context) {
    return AppDeeplinkHandlerDelegate();
  }
}

class AppDeeplinkHandlerDelegate extends DeepLinkHandlerDelegate {
  @override
  void handleError(BuildContext context, Object error) {}

  @override
  void handleIncomingLink(BuildContext context, String uri) {
    logging.i('incomingLink: $uri');
    final resolvedUri = resolveExternalUri(uri);
    context.go(resolvedUri);
  }

  @override
  void handleStartAppLink(BuildContext context, String? uri) {
    logging.i('startAppLink: $uri');

    final resolvedUri = uri != null ? resolveExternalUri(uri) : null;
    context.read<BootstrapCubit>().initialDeeplinkReceived(resolvedUri);
  }
}
