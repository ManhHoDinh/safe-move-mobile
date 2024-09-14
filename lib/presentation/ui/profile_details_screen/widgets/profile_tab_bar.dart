import 'package:flutter/material.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/tab_bar.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      pinned: true,
      delegate: _TabBarPersistentDelegate(),
    );
  }
}

class _TabBarPersistentDelegate extends SliverPersistentHeaderDelegate {
  const _TabBarPersistentDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppTabBar(
      isScrollable: false,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      tabs: [
        PaddedTab(text: S.of(context).whatYouWrote),
        PaddedTab(text: S.of(context).postWithComment),
        PaddedTab(text: S.of(context).likedPost),
      ],
    );
  }

  @override
  double get maxExtent => 42;

  @override
  double get minExtent => 42;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
