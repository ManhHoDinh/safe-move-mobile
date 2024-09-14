import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../router/router_config/router_config.dart';
import '../../theme/theme.dart';

class DropDownBarData<T> {
  const DropDownBarData({
    required this.value,
    required this.title,
    this.textStyle,
  });

  final T value;
  final String title;
  final TextStyle? textStyle;
}

class DropDownBar<T> extends StatelessWidget {
  const DropDownBar({
    super.key,
    this.value,
    this.hintText,
    this.data = const [],
    this.onChanged,
    this.enabled = true,
  });

  final T? value;
  final String? hintText;
  final List<DropDownBarData<T>> data;
  final ValueChanged<T>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool hasValue = value != null;
    final Color textColor =
        hasValue ? AppColors.text.main : AppColors.text.bodyText;
    final Color borderColor =
        hasValue ? AppColors.gray.shade700 : AppColors.gray.shade300;
    String resolvedText = hintText ?? '';

    if (hasValue) {
      for (int i = 0; i < data.length; i++) {
        if (data[i].value == value) {
          resolvedText = data[i].title;
          break;
        }
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: enabled
            ? () async {
                final selected = await DropdownSheetRouteData($extra: data)
                    .push(context) as T?;
                if (selected != null) {
                  onChanged?.call(selected);
                }
              }
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor),
            color: !enabled ? AppColors.gray.shade300 : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  resolvedText,
                  style: Styles.s15()
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(textColor),
                ),
              ),
              Assets.svgs.chevronDown24.svg(),
            ],
          ),
        ),
      ),
    );
  }
}
