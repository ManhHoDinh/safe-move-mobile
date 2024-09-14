import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/theme/src/app_style.dart';

class TimeLineInformation extends StatelessWidget {
  const TimeLineInformation(
      {super.key,
      required this.where,
      required this.when,
      required this.status,
      this.isCompleted = false});

  final String where;
  final String when;
  final String status;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: [
            Text(
              where,
              style: Styles.s14()
                  .withColor(AppColors.text.main)
                  .withWeight(isCompleted ? FontWeight.w600 : FontWeight.w500),
            ),
            Container(
              width: 1,
              height: 12,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              color: AppColors.gray.shade700,
            ),
            Text(
              status,
              style: Styles.s14()
                  .withColor(isCompleted
                      ? AppColors.blue.shade500
                      : AppColors.text.main)
                  .withWeight(isCompleted ? FontWeight.w600 : FontWeight.w500),
            ),
          ]),
          const SizedBox(
            height: 2,
          ),
          Text(when, style: Styles.s13().withColor(AppColors.gray.shade500))
        ],
      ),
    );
  }
}
