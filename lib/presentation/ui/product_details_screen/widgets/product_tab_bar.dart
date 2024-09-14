import 'package:flutter/material.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/tab_bar.dart';

class ProductTabBar extends StatelessWidget {
  const ProductTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TabBarPersistentDelegate(),
    );
  }
}

class _TabBarPersistentDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppTabBar(
      isScrollable: false,
      tabs: [
        PaddedTab(text: S.of(context).productInformation),
        PaddedTab(text: S.of(context).review),
        PaddedTab(text: S.of(context).inquiry),
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
