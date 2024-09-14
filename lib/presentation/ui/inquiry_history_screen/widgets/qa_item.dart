import 'package:flutter/material.dart';

import '../../../../application/services/qa/request/src/qa_create_request.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_expansion_tile/auto_manage_app_expansion_tile.dart';
import '../../../shared/widgets/ordered_product_item.dart';

class QAItemExpand extends StatelessWidget {
  const QAItemExpand(
      {super.key,
      this.onTitleTap,
      this.productImage,
      this.productTitle,
      this.question,
      this.answer,
      this.loading = false,
      this.type});

  final VoidCallback? onTitleTap;
  final String? productImage;
  final String? productTitle;
  final String? question;
  final String? answer;
  final bool loading;
  final String? type;

  String getStringByEnum(QAType type, BuildContext context) {
    switch (type) {
      case QAType.product:
        return S.of(context).product;
      case QAType.delivery:
        return S.of(context).delivery;
      case QAType.return_refund:
        return S.of(context).refund;
      case QAType.cancel:
        return S.of(context).cancel;
      case QAType.exchange:
        return S.of(context).exchange;
      case QAType.other:
        return S.of(context).other;
      case QAType.all:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoManageAppExpansionTile(
      iconCenter: false,
      useDefaultTextStyle: false,
      onTitleTap: onTitleTap,
      initialExpanded: loading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: loading
                ? Container(
                    width: 55,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                : Text(
                    getStringByEnum(decodeQAType(type), context),
                    style: Styles.s15()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.blue.shade500),
                  ),
          ),
          const SizedBox(height: 8),
          if (loading)
            OrderedProductItem(
              size: 40,
              loading: loading,
            )
          else
            OrderedProductItem(
              productImage: productImage,
              productName: productTitle,
              size: 40,
            )
        ],
      ),
      titlePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      content: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (loading)
              Container(
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            else
              Text(
                question ?? '',
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.black),
              ),
            const SizedBox(height: 16),
            if (loading)
              Container(
                width: 55,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            else if (answer != null)
              Text(
                S.of(context).answerComplete,
                style: Styles.s15()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.blue.shade500),
              )
            else
              const SizedBox.shrink(),
            const SizedBox(height: 8),
            if (loading)
              Container(
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            else
              Text(
                answer ?? '',
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.black),
              ),
          ],
        ),
      ),
    );
  }
}
