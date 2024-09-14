import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../utilities/phone_format.dart';

class ShippingInfoSection extends StatelessWidget {
  const ShippingInfoSection({
    super.key,
    this.title,
    this.content,
    this.phone,
    this.name,
    this.onChangeAddress,
    this.defaultAddress = false,
    this.loading = false,
  });

  final String? title;
  final String? content;
  final String? phone;
  final String? name;
  final VoidCallback? onChangeAddress;
  final bool defaultAddress;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                S.of(context).deliveryInformation,
                style: Styles.s18()
                    .withHeight(18 / 18)
                    .withWeight(FontWeight.w600)
                    .withLetterSpacing(-2.5 / 100),
              ),
            const Spacer(),
            if (onChangeAddress != null)
              InkWell(
                onTap: onChangeAddress,
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).changeAddress,
                    style: Styles.s13()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.blue.shade500),
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            if (loading)
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            else
              Text(title ?? '',
                  style: Styles.s15()
                      .withWeight(FontWeight.w500)
                      .withLetterSpacing(-2.5 / 100)
                      .withColor(AppColors.text.common)),
            const SizedBox(width: 12),
            if (defaultAddress)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: AppColors.blue.shade100,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(S.of(context).defaultShippingAddress,
                    style: Styles.s13()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.blue.shade500)),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 4),
        if (loading)
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        else
          Text(
            content ?? '',
            style: Styles.s13()
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.common),
          ),
        const SizedBox(height: 12),
        const SizedBox(height: 4),
        if (loading)
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        else
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: name),
                const WidgetSpan(
                  child: SizedBox(width: 12),
                ),
                TextSpan(text: phoneFormat(phone ?? '')),
              ],
            ),
            style: Styles.s13()
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.bodyText),
          ),
      ],
    );
  }
}
