import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_switches/app_checkbox.dart';

class ItemQuickManagementSection extends StatelessWidget {
  const ItemQuickManagementSection({
    super.key,
    this.currentAmount = 0,
    this.allSelected = false,
    this.onDelete,
    this.onSelectAllChanged,
  });

  final int currentAmount; // item type, not type x amount
  final bool allSelected;
  final ValueChanged<bool>? onSelectAllChanged;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 10),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: Styles.s13()
            .withWeight(FontWeight.w500)
            .withLetterSpacing(-2.5 / 100)
            .withColor(AppColors.text.main),
        child: Row(
          children: [
            Text(
              S.of(context).cartItemAmount(currentAmount),
              style: const TextStyle(fontSize: 15, height: 20 / 15),
            ),
            const Spacer(),
            AppCheckBox(
              value: allSelected,
              onChanged: onSelectAllChanged,
            ),
            Text(S.of(context).selectAll),
            const SizedBox(
              width: 9,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: onDelete,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
