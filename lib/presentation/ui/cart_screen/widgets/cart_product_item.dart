import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../shared/widgets/app_switches/app_checkbox.dart';
import 'product_item_counter.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
    required this.selected,
    this.imageUrl,
    this.amount = 0,
    required this.title,
    this.onAmountChanged,
    required this.pricePerUnit,
    this.onDeletePressed,
    this.onSelectionChanged,
    this.loading = false,
    this.animation,
  });

  final bool selected;
  final String? imageUrl;
  final String title;
  final int amount;
  final double pricePerUnit;
  final ValueChanged<int>? onAmountChanged;
  final ValueChanged<bool>? onSelectionChanged;
  final VoidCallback? onDeletePressed;
  final bool loading;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 64,
      height: 64,
    );
    return SizeTransition(
      sizeFactor: animation ?? const AlwaysStoppedAnimation(1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (loading)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )
              else
                AppCheckBox(
                  value: selected,
                  onChanged: onSelectionChanged,
                ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 64,
                  height: 64,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.gray.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: loading && imageUrl == null
                      ? null
                      : Image.network(
                          fit: BoxFit.cover,
                          imageUrl!,
                          loadingBuilder: helperImage.loadingBuilder,
                          errorBuilder: helperImage.errorBuilder,
                        ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2).copyWith(top: 12),
                  child: loading
                      ? Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )
                      : Text(
                          title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.s13()
                              .withLetterSpacing(-2.5 / 100)
                              .withColor(AppColors.text.main),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              if (!loading)
                AppIconButton(
                  size: const Size(38, 36),
                  icon: Assets.svgs.closeIcon1816.svg(),
                  onTap: onDeletePressed,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(right: 18, left: loading ? 36 : 40),
            child: Row(
              children: [
                if (loading)
                  Container(
                    height: 32,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else
                  ProductItemCounter(
                    count: amount,
                    onAdd: () => onAmountChanged?.call(amount + 1),
                    onSubtract: () => onAmountChanged?.call(amount - 1),
                  ),
                const Spacer(),
                if (loading)
                  Container(
                    height: 20,
                    width: 62,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else
                  Text(
                    S.of(context).commonCurrencyFormat(pricePerUnit),
                    style: Styles.s15()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.main),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
