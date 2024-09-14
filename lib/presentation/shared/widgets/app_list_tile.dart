import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.title,
    this.trailing,
    this.titlePadding =
        const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    this.onTap,
  });

  final Widget title;
  final Widget? trailing;
  final EdgeInsets titlePadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: titlePadding,
                child: DefaultTextStyle(
                  style: Styles.s15()
                      .withHeight(18 / 15)
                      .withWeight(FontWeight.w500)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.text.main),
                  child: title,
                ),
              ),
            ),
          ),
        ),
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}
