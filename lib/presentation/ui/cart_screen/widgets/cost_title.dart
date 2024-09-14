import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';

class CostTile extends StatelessWidget {
  const CostTile({
    super.key,
    this.priceStyle,
    this.titleStyle,
    this.pricePrefix,
    required this.price,
    required this.title,
  });

  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final String? pricePrefix;
  final double price;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultTextStyle(
            style: Styles.s15()
                .withHeight(24 / 15)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.bodyText),
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
        ),
        DefaultTextStyle(
          style: Styles.s15()
              .withHeight(20 / 15)
              .withLetterSpacing(-2.5 / 100)
              .withWeight(FontWeight.w500)
              .withColor(AppColors.text.common),
          child: Text(
            '${pricePrefix != null ? '$pricePrefix' : ''}${S.of(context).commonCurrencyFormat(price)}',
            style: priceStyle,
          ),
        ),
      ],
    );
  }
}
