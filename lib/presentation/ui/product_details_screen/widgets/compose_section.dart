import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_icon_button.dart';

class ComposeSection extends StatelessWidget {
  const ComposeSection({
    super.key,
    required this.title,
    this.count = 0,
    required this.buttonTitle,
    this.onPressed,
    this.onRefresh,
  });

  final String title;
  final int count;
  final String buttonTitle;
  final VoidCallback? onPressed;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
          .copyWith(top: 10),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          ),
          const SizedBox(width: 12),
          Text(
            '(${count.toString().padLeft(3, '0')})',
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.common),
          ),
          const SizedBox(width: 12),
          AppIconButton(
            onTap: onRefresh,
            icon: const Icon(Icons.refresh),
            size: const Size.square(32),
          ),
          const Spacer(),
          InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                buttonTitle,
                style: Styles.s13()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.blue.shade500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
