import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/src/app_style.dart';
import 'common_button.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.trailing,
    required this.title,
    this.borderRadius,
    this.wrapContent = false,
    this.leading,
    this.borderActiveColor,
    this.textStyle,
    this.backgroundColor,
  });

  factory AppOutlinedButton.square({
    required VoidCallback? onPressed,
    Widget? trailing,
    Widget? leading,
    EdgeInsets padding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    Color? borderActiveColor,
    TextStyle? textStyle,
    required String title,
    BorderRadius? borderRadius,
    bool wrapContent = false,
    Color? backgroundColor,
  }) {
    return AppOutlinedButton(
      onPressed: onPressed,
      title: title,
      leading: leading,
      borderActiveColor: borderActiveColor,
      trailing: trailing,
      textStyle: textStyle,
      padding: padding,
      wrapContent: wrapContent,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius ?? BorderRadius.circular(4),
    );
  }

  factory AppOutlinedButton.round({
    required VoidCallback? onPressed,
    Widget? trailing,
    Widget? leading,
    EdgeInsets padding =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    TextStyle? textStyle,
    Color? borderActiveColor,
    required String title,
    BorderRadius? borderRadius,
    bool wrapContent = false,
    Color? backgroundColor,
  }) {
    return AppOutlinedButton(
      onPressed: onPressed,
      title: title,
      wrapContent: wrapContent,
      trailing: trailing,
      leading: leading,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
      borderActiveColor: borderActiveColor,
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      padding: padding,
    );
  }

  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final String title;
  final Widget? trailing;
  final Widget? leading;
  final Color? borderActiveColor;
  final BorderRadius? borderRadius;
  final bool wrapContent;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      wrapContent: wrapContent,
      backgroundColor: backgroundColor ?? Colors.transparent,
      border: Border.all(
        color: onPressed != null
            ? borderActiveColor ?? AppColors.blue.shade500
            : AppColors.gray.shade400,
      ),
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
                      ? AppColors.blue.shade500
                      : AppColors.text.caption,
                ),
      ),
    );
  }
}
