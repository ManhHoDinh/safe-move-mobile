import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogPage extends Page<void> {
  const DialogPage({required this.pageBuilder, super.key});

  final RoutePageBuilder pageBuilder;

  @override
  Route<void> createRoute(BuildContext context) {
    return _CustomDialogRoute<void>(
      context: context,
      settings: this,
      pageBuilder: pageBuilder,
    );
  }
}

class _CustomDialogRoute<T> extends RawDialogRoute<T> {
  _CustomDialogRoute({
    required BuildContext context,
    super.barrierColor = Colors.black54,
    super.barrierDismissible,
    String? barrierLabel,
    super.settings,
    super.anchorPoint,
    super.traversalEdgeBehavior,
    RoutePageBuilder? pageBuilder,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionBuilder,
  }) : super(
          pageBuilder: pageBuilder ??
              (BuildContext buildContext, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  sized: false,
                  value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                  ),
                  child: pageBuilder!.call(
                    context,
                    animation,
                    secondaryAnimation,
                  ),
                );
              },
          barrierLabel: barrierLabel ??
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 150),
          transitionBuilder:
              transitionBuilder ?? _buildMaterialDialogTransitions,
        );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
