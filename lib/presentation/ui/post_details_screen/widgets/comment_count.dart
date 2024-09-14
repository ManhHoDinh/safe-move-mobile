import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../cubit/post_comment_cubit.dart';

class CommentCount extends StatelessWidget {
  const CommentCount({super.key});

  static const height = 56.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.gray.shade70,
        border: Border(
          top: BorderSide(color: AppColors.gray.shade100, width: 4),
        ),
      ),
      child: Row(
        children: [
          Assets.svgs.commentIcon16.svg(),
          const SizedBox(width: 4),
          Text(
            S.of(context).comment,
            style: Styles.s14()
                .withWeight(FontWeight.w300)
                .withHeight(14 / 14)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.common),
          ),
          const SizedBox(width: 8),
          Text(
            context
                .watch<PostCommentCubit>()
                .state
                .commentCount
                .toString()
                .padLeft(2, '0'),
            style: Styles.s14()
                .withHeight(14 / 14)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.blue.shade500),
          ),
          const SizedBox(
            width: 10,
          ),
          AppIconButton(
            icon: const Icon(Icons.refresh),
            onTap: () {
              context.read<PostCommentCubit>().reload();
            },
          ),
        ],
      ),
    );
  }
}

class CommentCountPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const CommentCount();
  }

  @override
  double get maxExtent => CommentCount.height;

  @override
  double get minExtent => CommentCount.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
