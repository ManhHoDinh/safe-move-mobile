import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_icon_button.dart';

class ProductItemCounter extends StatelessWidget {
  const ProductItemCounter({
    super.key,
    this.count = 0,
    this.onAdd,
    this.onSubtract,
  });

  final int count;
  final VoidCallback? onAdd;
  final VoidCallback? onSubtract;

  @override
  Widget build(BuildContext context) {
    const iconSize = Size(32, 32);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.gray.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIconButton(
            size: iconSize,
            icon: Assets.svgs.counterMinus.svg(),
            onTap: onSubtract,
          ),
          Text(
            count.toString().padLeft(2, '0'),
            style: Styles.s13()
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          ),
          AppIconButton(
            size: iconSize,
            icon: Assets.svgs.counterPlus.svg(),
            onTap: onAdd,
          )
        ],
      ),
    );
  }
}
