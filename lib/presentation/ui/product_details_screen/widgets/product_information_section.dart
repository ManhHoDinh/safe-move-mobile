import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_rating_bar.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation(
      {super.key,
      required this.rating,
      required this.name,
      this.discount,
      this.loading = false,
      required this.oldPrice,
      required this.currentPrice});

  final double rating;
  final bool loading;
  final String name;
  final int? discount;
  final double oldPrice;
  final double currentPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (loading)
            Container(
              height: 14,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          else
            AppRatingBar(
              rating: rating,
              starSize: 14,
            ),
          const SizedBox(height: 8),
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
              name,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.main),
            ),
          const SizedBox(height: 16),
          if (loading)
            Container(
              height: 20,
              width: 75,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          else
            Text(S.of(context).commonCurrencyFormat(currentPrice),
                style: Styles.s18()
                    .withWeight(FontWeight.w600)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main)
                    .withLetterSpacing(1)),
          const SizedBox(height: 2),
          if (loading)
            Container(
              height: 20,
              width: 91,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            )
          else if (discount != null && discount! > 0)
            Row(
              children: [
                Text(
                  S.of(context).commonCurrencyFormat(oldPrice),
                  style: Styles.s13()
                      .withWeight(FontWeight.w300)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.text.caption)
                      .withLetterSpacing(1)
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(width: 8),
                Text(
                  '-$discount%',
                  style: Styles.s15()
                      .withWeight(FontWeight.w500)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.red.shade800),
                ),
              ],
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
