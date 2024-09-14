import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    this.onChanged,
    this.fillColor,
  });

  final bool value;
  final void Function(bool value)? onChanged;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      checkColor: AppColors.blue.shade500,
      fillColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? fillColor ?? AppColors.blue.shade50
            : Colors.transparent,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      side: MaterialStateBorderSide.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? BorderSide(color: AppColors.blue.shade500)
              : BorderSide(color: AppColors.gray.shade400)),
      value: value,
      onChanged:
          onChanged == null ? null : (value) => onChanged?.call(value ?? false),
    );
  }
}
