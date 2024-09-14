import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../shared/widgets/posts/post_stats_info.dart';

class NumberReactSection extends StatelessWidget {
  const NumberReactSection({
    super.key,
    this.loading = false,
    this.favorite = 0,
    this.seen = 0,
    this.isFavorited = false,
    this.onFavorited,
    required this.shouldShowReactionButton,
  });

  final bool loading;
  final int seen;
  final int favorite;
  final bool isFavorited;
  final VoidCallback? onFavorited;
  final bool shouldShowReactionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PostStats(
          count: seen,
          icon: Assets.svgs.eyeIcon16.svg(),
          loading: loading,
        ),
        const SizedBox(width: 20),
        PostStats(
          count: favorite,
          icon: Assets.svgs.heartIcon16.svg(),
          loading: loading,
        ),
        const Spacer(),
        if (shouldShowReactionButton && !loading)
          AppOutlinedButton.square(
            onPressed: loading ? null : onFavorited,
            title: S.of(context).great,
            wrapContent: true,
            leading: isFavorited
                ? Assets.svgs.heartIconFilled16.svg(
                    color: AppColors.red,
                  )
                : Assets.svgs.heartIcon16.svg(),
            borderActiveColor:
                isFavorited ? AppColors.red : AppColors.gray.shade400,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            textStyle: Styles.s13()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(isFavorited ? AppColors.red : AppColors.text.common),
          )
      ],
    );
  }
}
