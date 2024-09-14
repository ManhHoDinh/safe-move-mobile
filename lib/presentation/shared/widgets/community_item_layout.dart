import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';
import 'buttons/app_outlined_button.dart';
import 'item_divider.dart';

class CommunityItemLayout extends StatelessWidget {
  const CommunityItemLayout({
    super.key,
    this.items = const [],
    this.shrinkWrap = true,
    this.physics = true,
    this.textNoPost,
    this.textExploreOurCommunity,
    this.onPressed,
  });

  final List<Widget> items;
  final bool shrinkWrap;
  final bool physics;
  final String? textNoPost;
  final String? textExploreOurCommunity;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty &&
        textNoPost != null &&
        textExploreOurCommunity != null &&
        onPressed != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textNoPost ?? '',
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.common),
          ),
          const SizedBox(
            height: 40,
          ),
          AppOutlinedButton.square(
            onPressed: onPressed ?? () {},
            title: textExploreOurCommunity ?? '',
            wrapContent: true,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 27),
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    } else {
      return ListView.separated(
        shrinkWrap: shrinkWrap,
        physics: physics ? const NeverScrollableScrollPhysics() : null,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: items[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const ItemDivider();
        },
        itemCount: items.length,
      );
    }
  }
}
