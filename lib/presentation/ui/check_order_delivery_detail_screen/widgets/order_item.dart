import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../application/services/user_order/dto/src/order_status_type.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/view_detail_action.dart';
import '../../../utilities/date_format.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    this.date,
    this.status,
    this.productName,
    this.productImage,
    this.onInquire,
    this.onDeliveryCheck,
    this.onViewDetail,
    this.loading = false,
    this.onCancel,
  });

  final DateTime? date;
  final OrderStatusType? status;
  final String? productName;
  final String? productImage;
  final VoidCallback? onInquire;
  final VoidCallback? onDeliveryCheck;
  final VoidCallback? onCancel;
  final VoidCallback? onViewDetail;
  final bool loading;

  String renderOrderStatus(BuildContext context, OrderStatusType? status) {
    switch (status) {
      case OrderStatusType.unconfirmed:
        return S.of(context).unconfirmed;
      case OrderStatusType.confirmed:
        return S.of(context).confirmed;
      case OrderStatusType.delivering:
        return S.of(context).shipping;
      case OrderStatusType.cancel:
        return S.of(context).cancelOrder;
      case OrderStatusType.delivered:
        return S.of(context).delivered;
      case OrderStatusType.refund:
        return S.of(context).refund;
      case null:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 40,
      height: 40,
    );

    return Column(
      children: [
        Row(
          children: [
            if (loading)
              Container(
                width: 69,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            else
              Text(
                formatDate(date ?? DateTime.now()),
                style: Styles.s15()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100),
              ),
            const SizedBox(width: 10),
            if (loading)
              Container(
                width: 54,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            else
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.blue.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  renderOrderStatus(context, status),
                  style: Styles.s13()
                      .withWeight(FontWeight.w500)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.blue.shade500),
                ),
              ),
            const Spacer(),
            if (loading)
              Container(
                width: 80,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            else
              ViewDetailAction(
                onTap: onViewDetail,
                title: (context) => S.of(context).viewDetails,
                colors: AppColors.text.common,
              ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 64,
                height: 64,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.gray.shade300,
                ),
                child: loading && productImage == null
                    ? null
                    : Image.network(
                        productImage!,
                        loadingBuilder: helperImage.loadingBuilder,
                        errorBuilder: helperImage.errorBuilder,
                      )),
            const SizedBox(width: 12),
            Expanded(
              child: loading
                  ? Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  : Text(
                      productName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.s13().withLetterSpacing(-2.5 / 100),
                    ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
                child: loading
                    ? Container(
                        width: double.infinity,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    : AppOutlinedButton.square(
                        onPressed: onInquire,
                        title: S.of(context).submitQA,
                        borderRadius: BorderRadius.circular(8),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                      )),
            const SizedBox(width: 12),
            Expanded(
                child: loading
                    ? Container(
                        width: double.infinity,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    : onCancel != null
                        ? AppOutlinedButton.square(
                            onPressed: onCancel,
                            title: S.of(context).cancel,
                            borderActiveColor: AppColors.red.shade600,
                            textStyle: Styles.s15()
                                .withLetterSpacing(-2.5 / 100)
                                .withWeight(FontWeight.w600)
                                .withColor(AppColors.red.shade600),
                            borderRadius: BorderRadius.circular(8),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          )
                        : PrimaryButton.square(
                            onPressed: onDeliveryCheck,
                            borderRadius: BorderRadius.circular(8),
                            title: S.of(context).deliveryStatus,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          )),
          ],
        )
      ],
    );
  }
}
