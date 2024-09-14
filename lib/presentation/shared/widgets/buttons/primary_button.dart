import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/src/app_style.dart';
import 'common_button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.trailing,
    required this.title,
    this.borderRadius,
    this.wrapContent = false,
    this.leading,
    this.textStyle,
  });

  factory PrimaryButton.square({
    required VoidCallback? onPressed,
    Widget? trailing,
    Widget? leading,
    TextStyle? textStyle,
    EdgeInsets padding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    required String title,
    bool wrapContent = false,
    BorderRadius? borderRadius,
  }) {
    return PrimaryButton(
      onPressed: onPressed,
      title: title,
      trailing: trailing,
      textStyle: textStyle,
      leading: leading,
      wrapContent: wrapContent,
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      padding: padding,
    );
  }

  factory PrimaryButton.round({
    required VoidCallback? onPressed,
    Widget? trailing,
    Widget? leading,
    EdgeInsets padding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    required String title,
    bool wrapContent = false,
  }) {
    return PrimaryButton(
      onPressed: onPressed,
      title: title,
      trailing: trailing,
      leading: leading,
      wrapContent: wrapContent,
      borderRadius: BorderRadius.circular(32),
      padding: padding,
    );
  }

  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final String title;
  final Widget? trailing;
  final BorderRadius? borderRadius;
  final bool wrapContent;
  final Widget? leading;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      wrapContent: wrapContent,
      backgroundColor:
          onPressed != null ? AppColors.blue.shade500 : AppColors.gray.shade200,
      padding: padding,
      borderRadius: borderRadius,
      onTap: onPressed,
      leading: leading,
      trailing: trailing,
      child: Text(
        title,
        style: textStyle ??
            Styles.s15()
                .withLetterSpacing(-2.5 / 100)
                .withWeight(FontWeight.w600)
                .withColor(
                  onPressed != null
                      ? AppColors.gray.shade70
                      : AppColors.text.caption,
                ),
      ),
    );
  }
}
