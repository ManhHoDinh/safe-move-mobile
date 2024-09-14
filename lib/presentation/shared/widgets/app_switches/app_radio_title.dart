import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/theme.dart';
import 'app_radio.dart';

class AppRadioTitle<T> extends StatelessWidget {
  const AppRadioTitle({
    super.key,
    required this.value,
    this.onChanged,
    this.trailing,
    required this.title,
    this.groupValue,
    this.toggleable = false,
  });

  final Widget title;
  final Widget? trailing;
  final T value;
  final T? groupValue;
  final bool toggleable;
  final void Function(T? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppRadio<T>(
          value: value,
          groupValue: groupValue,
          toggleable: toggleable,
          onChanged: onChanged,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: AnimatedDefaultTextStyle(
            style: Styles.s13()
                .withColor(AppColors.text.common)
                .withLetterSpacing(-2.5 / 100),
            duration: const Duration(milliseconds: 300),
            child: title,
          ),
        ),
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}
