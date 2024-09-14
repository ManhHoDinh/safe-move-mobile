import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../shared/widgets/app_rating_bar.dart';
import '../../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../../../utilities/date_format.dart';

enum ReviewAction { delete }

class ItemReview extends StatelessWidget {
  const ItemReview({
    super.key,
    this.name,
    required this.createdAt,
    this.content,
    this.avatarUrl,
    required this.rating,
    required this.images,
    this.loading = false,
    this.isHidden = false,
    this.isWriter = false,
    this.onAction,
  });

  final String? avatarUrl;
  final String? name;
  final int rating;
  final DateTime createdAt;
  final List<String> images;
  final String? content;
  final bool loading;
  final bool isHidden;
  final bool isWriter;
  final ValueChanged<ReviewAction>? onAction;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 40,
      height: 40,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: isHidden
          ? const _ItemLock()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (loading)
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: AppColors.gray.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: avatarUrl != null
                            ? Image.network(
                                avatarUrl!,
                                fit: BoxFit.cover,
                                loadingBuilder: helperImage.loadingBuilder,
                                errorBuilder: helperImage.errorBuilder,
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectableText(
                            name ?? '',
                            style: Styles.s15()
                                .withWeight(FontWeight.w500)
                                .withLetterSpacing(-2.5 / 100)
                                .withColor(AppColors.text.main),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              AppRatingBar(
                                rating: rating.toDouble(),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                formatDate(createdAt),
                                style: Styles.s12()
                                    .withColor(AppColors.text.bodyText),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      if (isWriter)
                        Builder(builder: (context) {
                          return AppIconButton(
                            icon: Assets.svgs.dotsHorizontalIcon24.svg(),
                            onTap: loading
                                ? null
                                : () async {
                                    final returnData =
                                        await DropdownSheetRouteData(
                                      $extra: [
                                        DropDownBarData(
                                          value: ReviewAction.delete,
                                          title: S.of(context).delete,
                                          textStyle: Styles.s13()
                                              .withColor(AppColors.red),
                                        ),
                                      ],
                                    ).push<ReviewAction>(context);
                                    if (returnData == null) {
                                      return;
                                    }
                                    onAction?.call(returnData);
                                  },
                          );
                        })
                      else
                        const SizedBox.shrink(),
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                _ImagesReview(imageUrls: images, loading: loading),
                const SizedBox(height: 10),
                if (loading)
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else
                  SelectableText(
                    content ?? '',
                    style: Styles.s13()
                        .withHeight(24 / 15)
                        .withColor(AppColors.black),
                  ),
              ],
            ),
    );
  }
}

class _ItemLock extends StatelessWidget {
  const _ItemLock();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.svgs.appQaLock.svg(),
        const SizedBox(width: 12),
        Text(
          S.of(context).qaHidden,
          style: Styles.s15()
              .withHeight(24 / 15)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.bodyText),
        ),
      ],
    );
  }
}

class _ImagesReview extends StatelessWidget {
  const _ImagesReview({
    this.imageUrls = const [],
    this.loading = false,
  });

  final List<String> imageUrls;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 73,
      height: 73,
    );
    return imageUrls.isEmpty
        ? const SizedBox()
        : SizedBox(
            height: 73,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: 73,
                    height: 73,
                    decoration: BoxDecoration(
                      color: loading ? AppColors.black : AppColors.gray.shade40,
                    ),
                    child: loading
                        ? const SizedBox()
                        : Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                            loadingBuilder: helperImage.loadingBuilder,
                            errorBuilder: helperImage.errorBuilder,
                          ),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8);
              },
              itemCount: loading ? 10 : imageUrls.length,
            ),
          );
  }
}
