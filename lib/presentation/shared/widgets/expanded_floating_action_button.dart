import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../theme/src/app_style.dart';

class ExpandedFloatingActionButton extends StatelessWidget {
  const ExpandedFloatingActionButton({
    super.key,
    required this.onPressed,
    this.heroTag,
  });

  final VoidCallback onPressed;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      backgroundColor: AppColors.blue.shade500,
      elevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
      ),
      onPressed: onPressed,
      label: Row(
        children: [
          FittedBox(
            child: SizedBox.square(
              dimension: 20,
              child: Assets.svgs.plusIcon.svg(),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            S.of(context).compose,
            style: Styles.s15()
                .withWeight(FontWeight.w600)
                .withColor(AppColors.gray.shade50)
                .withLetterSpacing(-2.5 / 100),
          ),
        ],
      ),
    );
  }
}
