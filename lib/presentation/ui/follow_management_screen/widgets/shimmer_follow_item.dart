import 'package:flutter/material.dart';

import '../../../shared/base_infinite_loading/app_shimmer.dart';
import 'user_follow_item.dart';

class FollowShimmerContent extends StatelessWidget {
  const FollowShimmerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const UserFollowItem(
            imageUrl: '',
            userName: '',
            loading: true,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemCount: 100,
      ),
    );
  }
}
