import 'package:flutter/material.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';

enum LateViewFilterType {
  late,
  view,
}

class LateViewFilter extends StatelessWidget {
  const LateViewFilter({
    super.key,
    this.type = LateViewFilterType.late,
    this.onChanged,
  });

  final LateViewFilterType type;
  final ValueChanged<LateViewFilterType>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SelectableChips<LateViewFilterType>(
      selected: {type},
      data: [
        ChipData(value: LateViewFilterType.late, label: S.of(context).latest),
        ChipData(value: LateViewFilterType.view, label: S.of(context).popular),
      ],
      onSelect: (value) {
        onChanged?.call(value);
      },
    );
  }
}
