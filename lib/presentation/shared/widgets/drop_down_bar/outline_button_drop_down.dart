import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/src/app_style.dart';
import '../buttons/app_outlined_button.dart';
import '../drop_down_bar/drop_down_bar.dart';

class OutlineButtonDropDown<T> extends StatelessWidget {
  const OutlineButtonDropDown({
    super.key,
    this.value,
    this.hintText,
    this.data = const [],
    this.onChangedDropDown,
    required this.buttonTitle,
    this.borderActiveColor,
    this.leadingButton,
    this.textStyle,
    this.trailingButton,
    this.onPressedButton,
    this.paddingButton,
    this.enabled,
  });
  final T? value;
  final String? hintText;
  final List<DropDownBarData<T>> data;
  final ValueChanged<T>? onChangedDropDown;
  final String buttonTitle;
  final Color? borderActiveColor;
  final Widget? leadingButton;
  final TextStyle? textStyle;
  final Widget? trailingButton;
  final VoidCallback? onPressedButton;
  final EdgeInsets? paddingButton;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropDownBar<T>(
            value: value,
            hintText: hintText,
            onChanged: onChangedDropDown,
            data: data,
            enabled: enabled ?? true,
          ),
        ),
        const SizedBox(width: 8),
        AppOutlinedButton(
          onPressed: onPressedButton,
          title: buttonTitle,
          wrapContent: true,
          padding: paddingButton ??
              const EdgeInsets.symmetric(horizontal: 22.5, vertical: 8),
          leading: leadingButton,
          trailing: trailingButton,
          borderActiveColor: borderActiveColor ?? AppColors.red.shade600,
          textStyle: textStyle ??
              Styles.s15()
                  .withLetterSpacing(-2.5 / 100)
                  .withWeight(FontWeight.w600)
                  .withColor(AppColors.red.shade600),
        )
      ],
    );
  }
}
