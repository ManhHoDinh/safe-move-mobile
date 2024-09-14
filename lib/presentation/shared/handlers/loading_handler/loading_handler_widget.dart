import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../../bases/navigation_context_resolver/navigation_context_resolver.dart';
import 'loading_manager.dart';
import 'loading_state.dart';
import 'loading_widget_builder_delegate.dart';

class LoadingHandlerWidget extends SingleChildStatefulWidget {
  const LoadingHandlerWidget({
    super.key,
    super.child,
    required this.delegate,
    this.navigatorKey,
  });

  final LoadingWidgetBuilderDelegate delegate;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<LoadingHandlerWidget> createState() => LoadingHandlerWidgetState();
}

class LoadingHandlerWidgetState extends SingleChildState<LoadingHandlerWidget>
    with NavigationContextResolverMixin {
  final Map<int, Route<void>> mapDialogRoute = {};
  late LoadingWidgetBuilderDelegate delegate;

  @override
  void initState() {
    super.initState();
    delegate = widget.delegate;
  }

  Future<void> showLoadingDialog({
    required BuildContext context,
    required int dialogId,
    required Map<int, Route<void>> mapDialogRoute,
  }) {
    final indicator = delegate.buildLoadingIndicator(context);
    final route = delegate.buildRoute(context, indicator);
    return delegate.showLoadingDialog(
      context: context,
      dialogId: dialogId,
      mapDialogRoute: mapDialogRoute,
      indicator: indicator,
      route: route,
    );
  }

  void hide({
    required BuildContext context,
    required int dialogId,
    required Map<int, Route<void>> mapDialogRoute,
  }) {
    return delegate.hide(
      context: context,
      dialogId: dialogId,
      mapDialogRoute: mapDialogRoute,
    );
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<LoadingManager, LoadingState>(
      listener: (context, state) async {
        if (state is! EventDrivenLoadingState) {
          return;
        }
        final resolvedNavigatorContext = maybeResolve(
          context,
          navigatorKey: widget.navigatorKey,
          rootNavigator: true,
        );
        if (resolvedNavigatorContext == null ||
            !resolvedNavigatorContext.mounted) {
          return;
        }
        if (state.showing) {
          showLoadingDialog(
            context: resolvedNavigatorContext,
            dialogId: state.operationId,
            mapDialogRoute: mapDialogRoute,
          );
        } else {
          hide(
            context: resolvedNavigatorContext,
            dialogId: state.operationId,
            mapDialogRoute: mapDialogRoute,
          );
        }
      },
      child: child,
    );
  }
}
