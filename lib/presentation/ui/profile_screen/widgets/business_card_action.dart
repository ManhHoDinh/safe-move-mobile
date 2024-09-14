import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';

class BusinessCardAction extends StatelessWidget {
  const BusinessCardAction({super.key, required this.userId});
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  const BusinessCardEditRouteData().go(context);
                },
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).editBusinessCard,
                    style: Styles.s13()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.blue.shade500),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: AppColors.gray.shade550,
            ),
            width: 2,
            height: 16,
          ),
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  BusinessCardDetailsRouteData(userId).push(context);
                },
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).businessCardDetails,
                    style: Styles.s13()
                        .withWeight(FontWeight.w500)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
