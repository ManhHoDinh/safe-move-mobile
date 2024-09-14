import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/view_detail_action.dart';

class SeeAllTitleBar extends StatelessWidget {
  const SeeAllTitleBar({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Styles.s24()
                  .withWeight(FontWeight.w600)
                  .withLetterSpacing(-5 / 100)
                  .withColor(AppColors.text.main),
            ),
          ),
          ViewDetailAction(
            onTap: onTap,
            title: (context) => S.of(context).seeAll,
          ),
        ],
      ),
    );
  }
}
