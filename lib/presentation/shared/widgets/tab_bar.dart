import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    this.tabs = const [],
    this.isScrollable = true,
    this.tabAlignment,
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.labelPadding,
    this.backgroundColor,
  });

  final List<Widget> tabs;
  final bool isScrollable;
  final TabAlignment? tabAlignment;
  final TabBarIndicatorSize indicatorSize;
  final EdgeInsets? labelPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? AppColors.gray.shade70,
      child: Material(
        type: MaterialType.transparency,
        child: TabBar(
          tabAlignment: tabAlignment,
          isScrollable: isScrollable,
          indicatorSize: indicatorSize,
          indicatorColor: AppColors.blue.shade500,
          labelColor: AppColors.blue.shade500,
          labelStyle: Styles.s15()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100),
          unselectedLabelColor: AppColors.text.bodyText,
          unselectedLabelStyle: Styles.s15().withLetterSpacing(-2.5 / 100),
          labelPadding:
              labelPadding ?? const EdgeInsets.symmetric(horizontal: 16),
          dividerColor: AppColors.gray.shade200,
          dividerHeight: 1,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          splashBorderRadius: BorderRadius.circular(4),
          tabs: tabs,
        ),
      ),
    );
  }
}

class PaddedTab extends StatelessWidget {
  const PaddedTab({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
