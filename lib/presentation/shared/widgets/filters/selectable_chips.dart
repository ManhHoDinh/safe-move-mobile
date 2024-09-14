import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/src/app_style.dart';
import '../gap_items.dart';

class ChipData<T> {
  const ChipData({
    required this.value,
    required this.label,
  });

  final T value;
  final String label;
}

class SelectableChips<T> extends StatelessWidget {
  const SelectableChips({
    super.key,
    this.selected,
    this.data = const [],
    this.animationDuration = const Duration(milliseconds: 300),
    this.padding = const EdgeInsets.symmetric(horizontal: 18),
    this.onSelect,
  });

  final Set<T>? selected;
  final List<ChipData<T>> data;
  final Duration animationDuration;
  final void Function(T value)? onSelect;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: GapItems(
        axis: Axis.horizontal,
        gap: 8,
        items: data
            .map((e) => SingleChips<T>(
                  selected: selected?.contains(e.value) ?? false,
                  label: e.label,
                  onTap: () {
                    onSelect?.call(e.value);
                  },
                ))
            .toList(),
      ),
    );
  }
}

class SingleChips<T> extends StatelessWidget {
  const SingleChips({
    super.key,
    this.selected = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.onTap,
    required this.label,
  });

  final String label;
  final bool selected;
  final Duration animationDuration;
  final VoidCallback? onTap;

  Color resolveBorderColor(bool selected) {
    if (selected) {
      return AppColors.blue.shade500;
    } else {
      return AppColors.gray.shade400;
    }
  }

  TextStyle resolveTextStyle(bool selected) {
    Color textColor;
    const FontWeight fontWeight = FontWeight.w500;

    if (selected) {
      textColor = AppColors.blue.shade500;
    } else {
      textColor = AppColors.gray.shade800;
    }
    return Styles.s13()
        .withWeight(fontWeight)
        .withColor(textColor)
        .withLetterSpacing(-2.5 / 100);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: resolveBorderColor(selected),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              child: Text(
                label,
                style: resolveTextStyle(selected),
              )),
        ),
      ),
    );
  }
}
