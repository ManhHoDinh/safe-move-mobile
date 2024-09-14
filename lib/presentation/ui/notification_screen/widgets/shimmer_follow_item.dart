import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/widgets/item_divider.dart';
import 'notification_item.dart';

class NotificationShimmerContent extends StatelessWidget {
  const NotificationShimmerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const NotificationItem(
            notificationContent: '게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 '
                '제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 '
                '제목게시글 제목',
            loading: true,
          );
        },
        itemCount: 100,
        separatorBuilder: (context, index) {
          return ItemDivider(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: AppColors.gray.shade100,
            thickness: 1,
          );
        },
      ),
    );
  }
}
