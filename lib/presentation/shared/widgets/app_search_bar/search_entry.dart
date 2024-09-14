import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../theme/theme.dart';

class SearchEntryItem extends StatelessWidget {
  const SearchEntryItem({
    super.key,
    required this.title,
    this.onDelete,
    this.onSelected,
  });

  final String title;
  final VoidCallback? onDelete;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Material(
              child: InkWell(
                onTap: () {
                  onSelected?.call();
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  width: double.infinity,
                  child: Text(
                    title,
                    style: Styles.s13()
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
              ),
            ),
          ),
        ),
        Material(
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              onDelete?.call();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: FittedBox(
                child: Assets.svgs.closeIconSmall.svg(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
