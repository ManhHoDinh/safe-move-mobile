import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/theme/theme.dart';

class PaymentInfoSection extends StatelessWidget {
  const PaymentInfoSection({
    super.key,
    required this.totalProductAmount,
    required this.deliveryFee,
    required this.totalDiscountAmount,
    required this.paymentAmount,
    this.pointAccumulation,
  });
  final double totalProductAmount;
  final double deliveryFee;
  final double totalDiscountAmount;
  final double paymentAmount;
  final double? pointAccumulation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentInformation,
          style: Styles.s18()
              .withHeight(18 / 18)
              .withWeight(FontWeight.w600)
              .withLetterSpacing(-2.5 / 100),
        ),
        const SizedBox(height: 20),
        _TitleValue(
          title: Text(S.of(context).totalProductAmount),
          value: Text(S.of(context).commonCurrencyFormat(totalProductAmount)),
        ),
        const SizedBox(height: 8),
        _TitleValue(
          title: Text(S.of(context).deliveryFee),
          value: Text('+ ${S.of(context).commonCurrencyFormat(deliveryFee)}'),
        ),
        const SizedBox(height: 8),
        _TitleValue(
          title: Text(S.of(context).totalDiscountAmount),
          value: Text(
              '- ${S.of(context).commonCurrencyFormat(totalDiscountAmount)}'),
        ),
        const SizedBox(height: 16),
        _TitleValue(
          title: Text(
            S.of(context).paymentAmount,
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withColor(AppColors.text.main),
          ),
          value: Text(
            S.of(context).commonCurrencyFormat(paymentAmount),
            style: Styles.s20()
                .withWeight(FontWeight.w600)
                .withLetterSpacing(-5 / 100)
                .withColor(AppColors.text.main),
          ),
        ),
        const SizedBox(height: 4),
        if (pointAccumulation != null)
          _TitleValue(
            value: Text.rich(TextSpan(
              children: [
                TextSpan(text: '${pointAccumulation?.toInt()}P'),
                const WidgetSpan(
                  child: SizedBox(width: 4),
                ),
                TextSpan(text: S.of(context).accumulationExpected),
              ],
            )),
          ),
        if (pointAccumulation != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _TitleValue(
                title: Text(S.of(context).pointAccumulation),
                value: Text('${pointAccumulation?.toInt()}P'),
              ),
            ],
          ),
      ],
    );
  }
}

class _TitleValue extends StatelessWidget {
  const _TitleValue({this.title, this.value});
  final Widget? title;
  final Widget? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultTextStyle(
          style: Styles.s15()
              .withHeight(24 / 15)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.bodyText),
          child: title ?? const SizedBox.shrink(),
        ),
        DefaultTextStyle(
          style: Styles.s15()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.common),
          child: value ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
