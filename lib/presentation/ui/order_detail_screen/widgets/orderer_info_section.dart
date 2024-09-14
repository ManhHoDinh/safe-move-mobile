import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../utilities/phone_format.dart';

class OrdererInfoSection extends StatelessWidget {
  const OrdererInfoSection({
    super.key,
    this.ordererName,
    this.phoneNumber,
    this.email,
    this.sectionTitle,
    this.loading = false,
  });

  final String? ordererName;
  final String? phoneNumber;
  final String? email;
  final String? sectionTitle;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final Widget shimmer = Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(4),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle ?? S.of(context).paymentInformation,
          style: Styles.s18()
              .withHeight(18 / 18)
              .withWeight(FontWeight.w600)
              .withLetterSpacing(-2.5 / 100),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: DefaultTextStyle(
                style: Styles.s15()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.bodyText),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (loading)
                      shimmer
                    else
                      Text(S.of(context).placeHolderName),
                    const SizedBox(height: 8),
                    if (loading) shimmer else Text(S.of(context).phoneNumber),
                    const SizedBox(height: 8),
                    if (loading) shimmer else Text(S.of(context).email),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DefaultTextStyle(
                style: Styles.s13()
                    .withWeight(FontWeight.w400)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.bodyText),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (loading) shimmer else Text(ordererName ?? ''),
                    const SizedBox(height: 8),
                    if (loading)
                      shimmer
                    else
                      Text(phoneFormat(phoneNumber ?? '')),
                    const SizedBox(height: 8),
                    if (loading) shimmer else Text(email ?? ''),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
