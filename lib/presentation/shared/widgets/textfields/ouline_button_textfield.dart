import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/src/app_style.dart';
import '../buttons/app_outlined_button.dart';
import 'common_textfield.dart';

class OutlineButtonTextField extends StatelessWidget {
  const OutlineButtonTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.onPressedButton,
    this.errorText,
    this.enableButton = true,
    this.enableTextField = true,
    required this.buttonTitle,
    this.keyboardType,
    this.textStyleButton,
    this.borderActiveColor,
    this.leadingButton,
    this.trailingButton,
    this.backgroundColorButton,
    this.paddingButton,
    this.textEditingController,
    this.maxLinesTextField,
    this.initialValue,
    this.textStyle,
    this.childLeft,
  });

  final String? hintText;
  final String? errorText;
  final String buttonTitle;
  final bool enableButton;
  final String? initialValue;
  final bool enableTextField;
  final TextStyle? textStyleButton;
  final Color? borderActiveColor;
  final TextInputType? keyboardType;
  final Widget? leadingButton;
  final Widget? trailingButton;
  final Color? backgroundColorButton;
  final void Function(String value)? onChanged;
  final VoidCallback? onPressedButton;
  final EdgeInsets? paddingButton;
  final TextEditingController? textEditingController;
  final int? maxLinesTextField;
  final TextStyle? textStyle;
  final Widget? childLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: childLeft ??
              CommonTextField(
                textEditingController: textEditingController,
                onChanged: onChanged,
                enable: enableTextField,
                initialValue: initialValue,
                maxLines: maxLinesTextField,
                hintText: hintText,
                errorText: errorText,
                keyboardType: keyboardType,
              ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: EdgeInsets.only(bottom: errorText != null ? 25 : 0),
          child: AppOutlinedButton.square(
              onPressed: onPressedButton,
              title: buttonTitle,
              wrapContent: true,
              backgroundColor: backgroundColorButton,
              padding: paddingButton ??
                  const EdgeInsets.symmetric(horizontal: 22.5, vertical: 7),
              leading: leadingButton,
              trailing: trailingButton,
              borderActiveColor: borderActiveColor ?? AppColors.gray.shade500,
              textStyle: textStyleButton ??
                  Styles.s13()
                      .withLetterSpacing(-2.5 / 100)
                      .withWeight(FontWeight.w400)
                      .withColor(AppColors.blue.shade600)),
        )
      ],
    );
  }
}
