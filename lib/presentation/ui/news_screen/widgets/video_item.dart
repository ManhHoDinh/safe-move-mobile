import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.title,
    this.thumbnail,
    this.onTap,
    this.loading = false,
  });

  final String? thumbnail;
  final String title;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    const imageHelper = ImageLoading(width: 339, height: 190);
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 339 / 190,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: loading ? AppColors.blue : null,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: thumbnail != null
                      ? Image.network(
                          thumbnail!,
                          loadingBuilder: imageHelper.imageLoadingBuilder,
                          errorBuilder: imageHelper.imageErrorBuilder,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: !loading
                  ? Text(
                      title,
                      style: Styles.s15()
                          .withWeight(FontWeight.w500)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.black),
                    )
                  : Container(
                      height: 20 * 2,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: loading ? null : onTap,
            ),
          ),
        ),
      ],
    );
  }
}
