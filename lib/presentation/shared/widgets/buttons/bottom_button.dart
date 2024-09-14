import 'package:flutter/cupertino.dart';

import '../../../gen/app_colors.dart';
import 'app_outlined_button.dart';
import 'primary_button.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    this.onPress,
    this.color,
    this.enableBorder = false,
    this.padding =
        const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
    this.outlined = false,
    this.borderActiveColor,
    this.textStyle,
  });

  final String title;
  final VoidCallback? onPress;
  final Color? color;
  final bool enableBorder;
  final EdgeInsets padding;
  final bool outlined;
  final Color? borderActiveColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.gray.shade70,
        border: enableBorder
            ? Border(
                top: BorderSide(
                  color: AppColors.gray.shade200,
                ),
              )
            : null,
      ),
      padding: padding,
      child: SafeArea(
        top: false,
        child: outlined
            ? AppOutlinedButton.square(
                onPressed: onPress,
                title: title,
                borderActiveColor: borderActiveColor,
                textStyle: textStyle,
              )
            : PrimaryButton.square(
                onPressed: onPress,
                title: title,
              ),
      ),
    );
  }
}
