import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../theme/src/app_style.dart';

class HeadFilter extends StatelessWidget {
  const HeadFilter({
    super.key,
    required this.value,
    this.onTap,
    this.animationDuration = const Duration(milliseconds: 200),
    this.style,
    this.spacer,
    this.padding,
  });

  final TextStyle? style;
  final String value;
  final VoidCallback? onTap;
  final Duration animationDuration;
  final Widget? spacer;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: animationDuration,
              child: AnimatedSize(
                duration: animationDuration,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: style ??
                      Styles.s18()
                          .withHeight(1)
                          .withLetterSpacing(-2.5 / 100)
                          .withWeight(FontWeight.w600)
                          .withColor(AppColors.text.main),
                ),
              ),
            ),
            spacer ?? const SizedBox(width: 16),
            Assets.svgs.chevronDown24.svg(),
          ],
        ),
      ),
    );
  }
}
