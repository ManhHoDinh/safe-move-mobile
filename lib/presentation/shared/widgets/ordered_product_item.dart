import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/theme.dart';
import '../base_infinite_loading/image_loading.dart';

class OrderedProductItem extends StatelessWidget {
  const OrderedProductItem({
    super.key,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productCount,
    this.loading = false,
    this.onTap,
    this.size = 64,
  });

  final String? productImage;
  final String? productName;
  final double? productPrice;
  final int? productCount;
  final bool loading;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final helperImage = ImageLoading(
      width: size,
      height: size,
    );
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (loading)
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            else
              Container(
                  width: size,
                  height: size,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: productImage != null
                      ? Image.network(
                          fit: BoxFit.cover,
                          productImage!,
                          loadingBuilder: helperImage.loadingBuilder,
                          errorBuilder: helperImage.errorBuilder,
                        )
                      : null),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: size,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (loading)
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    else
                      Text(
                        productName ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.s13().withLetterSpacing(-2.5 / 100),
                      ),
                    // const SizedBox(height: 4),
                    if (productPrice != null && productCount != null)
                      if (loading)
                        Container(
                          width: 90,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )
                      else
                        Row(
                          children: [
                            Text(
                              S
                                  .of(context)
                                  .commonCurrencyFormat(productPrice ?? 0),
                              style: Styles.s13()
                                  .withLetterSpacing(-2.5 / 100)
                                  .withColor(AppColors.text.common),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: 8,
                              color: AppColors.gray.shade400,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              S.of(context).numberProducts(productCount ?? 0),
                              style: Styles.s13()
                                  .withWeight(FontWeight.w300)
                                  .withLetterSpacing(-2.5 / 100)
                                  .withColor(AppColors.text.bodyText),
                            ),
                          ],
                        )
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
