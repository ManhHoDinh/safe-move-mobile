import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/theme.dart';
import 'app_checkbox.dart';

class AppCheckBoxTitle extends StatelessWidget {
  const AppCheckBoxTitle({
    super.key,
    required this.value,
    this.onChanged,
    this.fillColor,
    this.trailing,
    required this.title,
  });

  final bool value;
  final void Function(bool value)? onChanged;
  final Color? fillColor;
  final Widget title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCheckBox(
          value: value,
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
