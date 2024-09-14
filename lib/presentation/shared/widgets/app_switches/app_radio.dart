import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';

class AppRadio<T> extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.value,
    this.groupValue,
    this.toggleable = false,
    this.onChanged,
  });

  final T value;
  final T? groupValue;
  final bool toggleable;
  final void Function(T? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      fillColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? AppColors.blue.shade500
            : AppColors.gray.shade400,
      ),
      toggleable: toggleable,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
