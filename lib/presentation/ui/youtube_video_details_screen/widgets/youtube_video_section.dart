import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/theme/theme.dart';
import '../../post_details_screen/widgets/number_react_section.dart';
import '../../post_details_screen/widgets/post_type_section.dart';

class YoutubeVideoSection extends StatelessWidget {
  const YoutubeVideoSection({
    super.key,
    this.loading = false,
    this.mainCategory,
    this.subCategory,
    this.createdAt,
    this.postTitle,
    this.onReact,
    this.favoriteCount = 0,
    this.reacted = false,
    this.seenCount = 0,
    this.shouldShowReactionButton = false,
    this.thumbnailUrl,
    this.videoUrl,
    this.player,
  });

  final bool loading;
  final String? videoUrl;
  final String? mainCategory;
  final String? subCategory;
  final String? thumbnailUrl;
  final DateTime? createdAt;
  final String? postTitle;
  final VoidCallback? onReact;
  final bool reacted;
  final int seenCount;
  final int favoriteCount;
  final bool shouldShowReactionButton;
  final Widget? player;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18)
          .copyWith(top: 8)
          .copyWith(bottom: 16),
      color: loading ? Colors.transparent : AppColors.gray.shade70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PostTypeSection(
            category: mainCategory,
            classification: subCategory,
            loading: loading,
          ),
          const SizedBox(height: 32),
          if (loading)
            Container(
              height: 28 * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black,
              ),
            )
          else
            Text(
              postTitle ?? '',
              style: Styles.s18()
                  .withWeight(FontWeight.w800)
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.main),
            ),
          if (loading)
            Container(
              height: 190,
              color: Colors.black,
            )
          else
            player ?? const SizedBox.shrink(),
          const SizedBox(height: 24),
          NumberReactSection(
            loading: loading,
            seen: seenCount,
            favorite: favoriteCount,
            isFavorited: reacted,
            onFavorited: onReact,
            shouldShowReactionButton: shouldShowReactionButton,
          ),
          if (loading)
            Container(
              height: 1000,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
