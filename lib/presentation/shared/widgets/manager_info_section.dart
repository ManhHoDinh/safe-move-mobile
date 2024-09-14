import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';
import 'buttons/app_outlined_button.dart';
import 'posts/post_info.dart';

class ManagerSection extends StatelessWidget {
  const ManagerSection({
    super.key,
    this.items = const [],
    this.textNoPost,
    this.textBtnExplore,
    this.onPressed,
  });

  final List<PostInfo> items;
  final String? textNoPost;
  final String? textBtnExplore;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty &&
        textNoPost != null &&
        textBtnExplore != null &&
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
            title: textBtnExplore ?? '',
            wrapContent: true,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 27),
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    } else {
      return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return items[index];
            },
          ),
        ),
      );
    }
  }
}
