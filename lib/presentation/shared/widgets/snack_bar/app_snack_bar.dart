import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/theme.dart';

class AppSnackBar {
  const AppSnackBar({
    required this.title,
    this.animation,
  });
  final String title;
  final Animation<double>? animation;

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      elevation: 0,
      dismissDirection: DismissDirection.none,
      animation: animation,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 50),
      content: FadeTransition(
        opacity: animation ?? const AlwaysStoppedAnimation(1),
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.blue.shade500,
            ),
            child: Text(
              title,
              style: Styles.s12().withColor(AppColors.gray.shade70),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
