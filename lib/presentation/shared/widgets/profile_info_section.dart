import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../base_infinite_loading/image_loading.dart';
import '../theme/src/app_style.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection(
      {super.key,
      this.imageUrl,
      required this.name,
      required this.description,
      this.loading = false,
      this.point});

  final String? imageUrl;
  final String name;
  final String description;
  final bool loading;
  final int? point;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 72,
      height: 72,
    );
    return Row(
      children: [
        if (loading)
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
          )
        else
          Container(
            width: 72,
            height: 72,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.gray.shade300,
              shape: BoxShape.circle,
            ),
            child: imageUrl != null
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: helperImage.loadingBuilder,
                    errorBuilder: helperImage.errorBuilder,
                  )
                : null,
          ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (loading)
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else
                  SelectableText(
                    name,
                    style: Styles.s18()
                        .withWeight(FontWeight.w600)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.main)
                        .withHeight(1),
                  ),
                const SizedBox(
                  height: 4,
                ),
                if (loading)
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else if (description.isNotEmpty)
                  SelectableText(
                    description,
                    style: Styles.s15()
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common)
                        .withHeight(24 / 15),
                  )
                else
                  const SizedBox.shrink(),
                const SizedBox(
                  height: 4,
                ),
                if (loading)
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else if (point != null)
                  // Row(
                  //   children: [
                  //     Text(
                  //       point.toString(),
                  //       style: Styles.s15()
                  //           .withWeight(FontWeight.w600)
                  //           .withLetterSpacing(-2.5 / 100)
                  //           .withColor(AppColors.text.main)
                  //           .withHeight(1),
                  //     ),
                  //     const SizedBox(
                  //       width: 2,
                  //     ),
                  //     Assets.svgs.pointIcon.svg(),
                  //   ],
                  // )
                  const SizedBox.shrink()
                else
                  const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
