import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_rating_bar.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.imagePath,
    required this.title,
    required this.price,
    required this.originalPrice,
    this.discount,
    required this.rating,
    required this.numberOfReviews,
    this.onTap,
    this.loading = false,
  });

  final String? imagePath;
  final String title;
  final double price;
  final int? discount;
  final double rating;
  final int numberOfReviews;
  final VoidCallback? onTap;
  final bool loading;
  final double originalPrice;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 163,
      height: 164,
    );
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 163 / 164,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: loading ? AppColors.black : null,
                  ),
                  child: loading && imagePath == null
                      ? null
                      : FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(
                            imagePath!,
                            loadingBuilder: helperImage.loadingBuilder,
                            errorBuilder: helperImage.errorBuilder,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: loading
                  ? Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.black,
                      ),
                    )
                  : Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.s13()
                          .withWeight(FontWeight.w400)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.text.main),
                    ),
            ),
            const SizedBox(height: 8),
            if (loading)
              Container(
                height: 20,
                width: 91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.black,
                ),
              )
            else
              Text(
                S.of(context).commonCurrencyFormat(price),
                style: Styles.s15()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main),
              ),
            if (loading) const SizedBox(height: 4) else const SizedBox.shrink(),
            if (loading)
              Container(
                height: 20,
                width: 91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.black,
                ),
              )
            else
              Row(
                children: [
                  Text(
                      discount != null && discount != 0
                          ? S.of(context).commonCurrencyFormat(originalPrice)
                          : '',
                      style: Styles.s13()
                          .withWeight(FontWeight.w300)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.text.caption)
                          .withLetterSpacing(1)
                          .copyWith(decoration: TextDecoration.lineThrough)),
                  const SizedBox(width: 8),
                  Text(
                    discount != null && discount != 0 ? '-$discount%' : '',
                    style: Styles.s13()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.red.shade800),
                  )
                ],
              ),
            const SizedBox(height: 6),
            if (loading)
              Container(
                height: 12,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.black,
                ),
              )
            else
              Row(
                children: [
                  AppRatingBar(
                    rating: rating,
                    starSize: 10,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '($numberOfReviews)',
                    style: Styles.s12().withColor(AppColors.text.bodyText),
                  )
                ],
              )
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
