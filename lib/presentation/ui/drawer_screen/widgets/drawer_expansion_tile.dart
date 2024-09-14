import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_expansion_tile/auto_manage_app_expansion_tile.dart';

class DrawerExpansionTitle extends StatelessWidget {
  const DrawerExpansionTitle({
    super.key,
    this.onTitleTap,
    this.items = const [],
    required this.title,
    this.initialExpanded = false,
    this.enableCollapse = true,
    this.boldTitle = true,
  });

  final VoidCallback? onTitleTap;
  final List<Widget> items;
  final String title;
  final bool initialExpanded;
  final bool enableCollapse;
  final bool boldTitle;

  @override
  Widget build(BuildContext context) {
    return AutoManageAppExpansionTile(
      initialExpanded: initialExpanded,
      enableCollapse: enableCollapse,
      title: Text(
        title,
        style: boldTitle
            ? Styles.s18()
                .withHeight(1)
                .withWeight(FontWeight.w600)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.common)
            : Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
      ),
      onTitleTap: onTitleTap,
      titlePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      icon: items.isEmpty
          ? const SizedBox.square(
              dimension: 24,
            )
          : null,
      content: _DrawerNavigationItemsLayout(
        items: items,
      ),
    );
  }
}

class _DrawerNavigationItemsLayout extends StatelessWidget {
  const _DrawerNavigationItemsLayout({required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: items.isEmpty
          ? EdgeInsets.zero
          : const EdgeInsets.only(bottom: 16, left: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}

class DrawerNavigationItem extends StatelessWidget {
  const DrawerNavigationItem({
    super.key,
    this.onTap,
    required this.title,
  });

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          width: double.infinity,
          child: Text(
            title,
            style: Styles.s16()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(
                  AppColors.text.common,
                ),
          ),
        ),
      ),
    );
  }
}
