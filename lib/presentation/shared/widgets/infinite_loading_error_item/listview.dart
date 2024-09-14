import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../theme/theme.dart';

class InfiniteLoadingListItemError extends StatelessWidget {
  const InfiniteLoadingListItemError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.red.shade600.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        S.of(context).someThingWentWrong,
        textAlign: TextAlign.center,
        style: Styles.s12().withColor(AppColors.red.shade600),
      ),
    );
  }
}
