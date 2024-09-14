import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../shared/widgets/app_list_tile.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.title,
    this.onTapUnFavorite,
    this.onTapItem,
    this.selected = true,
  });

  final String title;
  final VoidCallback? onTapUnFavorite;
  final VoidCallback? onTapItem;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTapItem,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: AppListTile(
            title: Text(
              title,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100),
            ),
            trailing: Container(
              margin: const EdgeInsets.only(right: 16),
              child: AppIconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: selected
                      ? Assets.svgs.bookmarkedIcon.svg()
                      : Assets.svgs.bookmarkIcon.svg(),
                ),
                onTap: onTapUnFavorite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
