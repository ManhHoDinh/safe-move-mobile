import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size,
    this.notificationCount,
  });

  final Widget icon;
  final VoidCallback? onTap;
  final Size? size;
  final int? notificationCount;

  @override
  Widget build(BuildContext context) {
    Widget resolvedIcon = icon;
    if (notificationCount != null) {
      resolvedIcon = Badge(
        backgroundColor: AppColors.red.shade800,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        label: Text(
          notificationCount.toString().padLeft(2, '0'),
          style: Styles.s8()
              .withHeight(1)
              .withColor(AppColors.gray.shade70)
              .withLetterSpacing(-2.5 / 100),
        ),
        child: resolvedIcon,
      );
    }

    return Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          alignment: Alignment.center,
          width: size?.width ?? 40,
          height: size?.height ?? 40,
          child: resolvedIcon,
        ),
      ),
    );
  }
}
