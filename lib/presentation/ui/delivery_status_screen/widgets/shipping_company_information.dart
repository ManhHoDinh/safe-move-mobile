import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';

class ShippingCompanyInformation extends StatelessWidget {
  const ShippingCompanyInformation(
      {super.key, required this.invoiceNo, required this.shippingCompany});

  final String invoiceNo;
  final String shippingCompany;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      color: AppColors.blue.shade500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.white),
              ),
              child: Text(
                S.of(context).waybillNumber,
                style: Styles.s12().withColor(AppColors.white),
              )),
          const SizedBox(height: 8),
          Text(
            invoiceNo,
            style: Styles.s24()
                .withColor(AppColors.white)
                .withWeight(FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Text(
            shippingCompany,
            style: Styles.s16().withColor(AppColors.white),
          )
        ],
      ),
    );
  }
}
