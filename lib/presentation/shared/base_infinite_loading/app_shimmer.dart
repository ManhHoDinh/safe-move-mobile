import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../gen/app_colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child, this.enabled = true});

  static const animationDuration = Duration(milliseconds: 300);

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: animationDuration,
      child: AnimatedSwitcher(
        duration: animationDuration,
        child: !enabled
            ? child
            : Shimmer.fromColors(
                baseColor: AppColors.gray.shade300,
                highlightColor: AppColors.gray.shade70,
                child: child,
              ),
      ),
    );
  }
}
