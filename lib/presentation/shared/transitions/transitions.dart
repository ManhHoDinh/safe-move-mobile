import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';

class CustomTransitionBuilder {
  const CustomTransitionBuilder._();

  static Widget noTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  static Widget fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation.drive(
        Tween<double>(begin: 0.5, end: 1),
      ),
      child: child,
    );
  }

  static Widget backgroundFadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ColoredBox(
      color: AppColors.black,
      child: FadeTransition(
        opacity: secondaryAnimation.drive(
          Tween<double>(begin: 1, end: 0.3),
        ),
        child: child,
      ),
    );
  }

  static Widget slideFromRightTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.easeIn),
        ),
      ),
      child: child,
    );
  }

  static Widget slideFromBottomTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.easeIn),
        ),
      ),
      child: child,
    );
  }
}
