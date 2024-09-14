import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/theme/theme.dart';

class SubCategoryChips extends StatelessWidget {
  const SubCategoryChips({
    super.key,
    this.onTap,
    required this.label,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.gray.shade800),
          ),
          child: Row(
            children: [
              Assets.svgs.filterMenu16.svg(),
              const SizedBox(width: 8),
              Text(
                label,
                style: Styles.s13()
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
