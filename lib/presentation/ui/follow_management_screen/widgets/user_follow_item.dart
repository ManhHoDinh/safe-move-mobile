import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';

class UserFollowItem extends StatelessWidget {
  const UserFollowItem({
    super.key,
    this.imageUrl,
    required this.userName,
    this.onTapUnfollow,
    this.onTapItem,
    this.loading = false,
  });
  final String? imageUrl;
  final String userName;
  final VoidCallback? onTapUnfollow;
  final VoidCallback? onTapItem;

  final bool loading;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 40,
      height: 40,
    );

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTapItem,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          child: Row(
            children: [
              if (loading)
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                )
              else
                Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.gray.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl!,
                          loadingBuilder: helperImage.loadingBuilder,
                          errorBuilder: helperImage.errorBuilder,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              const SizedBox(
                width: 12,
              ),
              if (loading)
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              else
                Expanded(
                  child: Text(
                    userName,
                    style: Styles.s15()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100),
                  ),
                ),
              const SizedBox(
                width: 8,
              ),
              if (loading)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              else if (onTapUnfollow != null)
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: onTapUnfollow,
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        S.of(context).delete,
                        style: Styles.s13()
                            .withWeight(FontWeight.w500)
                            .withLetterSpacing(-2.5 / 100)
                            .withColor(AppColors.blue.shade500),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
