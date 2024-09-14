import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/app_colors.dart';

abstract class LoadingWidgetBuilderDelegate {
  Widget buildLoadingIndicator(BuildContext context);

  Future<void> showLoadingDialog({
    required BuildContext context,
    required int dialogId,
    required Map<int, Route<void>> mapDialogRoute,
    required Widget indicator,
    required Route<void> route,
  }) async {
    mapDialogRoute[dialogId] = route;
    await Navigator.of(context, rootNavigator: true).push(route);
  }

  void hide({
    required BuildContext context,
    required int dialogId,
    required Map<int, Route<void>> mapDialogRoute,
  }) async {
    final loadingRoute = mapDialogRoute[dialogId];
    if (loadingRoute?.navigator != null) {
      loadingRoute?.navigator?.removeRoute(loadingRoute);
    }
    mapDialogRoute.remove(dialogId);
  }

  Route<void> buildRoute(BuildContext context, Widget indicator) {
    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: true,
      ).context,
    );
    final route = DialogRoute<void>(
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          sized: false,
          child: indicator,
        ),
      ),
      themes: themes,
    );
    return route;
  }
}

class DefaultLoadingWidgetBuilderDelegate extends LoadingWidgetBuilderDelegate {
  @override
  Widget buildLoadingIndicator(BuildContext context) {
    return const DefaultLoadingIndicator();
  }
}

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          // Platform.isIOS
          //     ? const CupertinoActivityIndicator(
          //         color: Colors.white,
          //       )
          //     :
          CircularProgressIndicator(
        color: AppColors.blue.shade500,
      ),
    );
  }
}
