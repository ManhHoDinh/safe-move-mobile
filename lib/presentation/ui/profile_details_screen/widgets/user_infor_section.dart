import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
    this.imageUrl,
    required this.name,
    this.description,
    this.following = false,
    required this.userId,
    this.onFollowToggle,
  });

  final String? imageUrl;
  final String name;
  final String? description;
  final int userId;
  final VoidCallback? onFollowToggle;
  final bool following;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 26 * 2,
      height: 26 * 2,
    );
    final currentUserId = context.watch<UserCubit>().state.detail?.id;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18)
          .copyWith(bottom: 12, top: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gray.shade100, width: 4),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 26 * 2,
                height: 26 * 2,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gray.shade300,
                ),
                child: imageUrl == null
                    ? null
                    : Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: helperImage.imageErrorBuilder,
                        loadingBuilder: helperImage.imageLoadingBuilder,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: Styles.s18()
                      .withWeight(FontWeight.w600)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.text.main)
                      .withHeight(1),
                ),
              ),
              if (currentUserId != userId)
                AppOutlinedButton.square(
                  onPressed: onFollowToggle,
                  title: following
                      ? S.of(context).following
                      : S.of(context).follow,
                  wrapContent: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  leading: following
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Assets.svgs.plusIcon.svg(color: AppColors.text.common),
                  textStyle: Styles.s13()
                      .withWeight(FontWeight.w500)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(
                          following ? AppColors.white : AppColors.text.common),
                  backgroundColor:
                      following ? AppColors.blue.shade500 : Colors.transparent,
                  borderActiveColor:
                      following ? AppColors.white : AppColors.gray.shade400,
                )
              else
                const SizedBox.shrink()
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          if (description != null)
            Text(description ?? '',
                style: Styles.s15()
                    .withColor(AppColors.text.common)
                    .withLetterSpacing(-2.5 / 100)
                    .withHeight(24 / 15))
          else
            const SizedBox.shrink(),
          const SizedBox(
            height: 16,
          ),
          AppOutlinedButton.square(
            onPressed: () {
              BusinessCardDetailsRouteData(userId).push(context);
            },
            title: S.of(context).businessCardDetails,
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
