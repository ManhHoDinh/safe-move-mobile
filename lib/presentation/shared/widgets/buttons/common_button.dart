import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/theme.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.backgroundColor,
    this.wrapContent = false,
    this.minHeight,
    this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.trailing,
    this.textStyle,
    this.borderRadius,
    this.onTap,
    this.border,
    this.animationDuration = const Duration(milliseconds: 200),
    this.leading,
  });

  final Color? backgroundColor;
  final bool wrapContent;
  final double? minHeight;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final Widget? trailing;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Widget? leading;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: animationDuration,
      child: AnimatedContainer(
        duration: animationDuration,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.blue.shade500,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          border: border,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            child: Container(
              constraints: minHeight != null
                  ? BoxConstraints(minHeight: minHeight!)
                  : null,
              padding: padding,
              child: Row(
                mainAxisSize: wrapContent ? MainAxisSize.min : MainAxisSize.max,
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  if (leading != null)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: leading,
                    )
                  else
                    const SizedBox.shrink(),
                  AnimatedDefaultTextStyle(
                    style: textStyle ??
                        Styles.s15()
                            .withWeight(FontWeight.w600)
                            .withColor(
                              AppColors.gray.shade70,
                            )
                            .copyWith(
                                leadingDistribution:
                                    TextLeadingDistribution.even),
                    duration: animationDuration,
                    child: Flexible(child: child ?? const SizedBox.shrink()),
                  ),
                  if (trailing != null)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: trailing,
                    )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
