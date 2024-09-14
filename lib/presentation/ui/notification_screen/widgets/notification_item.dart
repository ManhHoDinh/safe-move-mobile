import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/theme/theme.dart';
import '../../../utilities/date_format.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    this.date,
    this.notificationContent,
    this.haveRead = true,
    this.notificationType,
    this.onTap,
    this.loading = false,
  });

  final DateTime? date;
  final String? notificationType;
  final String? notificationContent;
  final bool haveRead;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (loading)
                const SizedBox.shrink()
              else
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color:
                        haveRead ? Colors.transparent : AppColors.red.shade600,
                    shape: BoxShape.circle,
                  ),
                ),
              const SizedBox(height: 2),
              if (loading)
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              else
                Text.rich(
                  TextSpan(
                    children: [
                      if (notificationType != null)
                        TextSpan(
                          text: '[$notificationType]  ',
                          style: TextStyle(color: AppColors.red.shade600),
                        ),
                      TextSpan(
                        text: notificationContent,
                      )
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.s15()
                      .withHeight(24 / 15)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.text.main),
                ),
              const SizedBox(height: 6),
              if (loading)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 13,
                    width: 62,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              else
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date != null ? formatDate(date!) : '',
                    style: Styles.s13()
                        .withHeight(1)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.bodyText),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
