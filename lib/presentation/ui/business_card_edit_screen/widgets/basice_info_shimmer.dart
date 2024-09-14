import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/gap_items.dart';

class BasicInfoShimmer extends StatelessWidget {
  const BasicInfoShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).basicInformation,
          style: Styles.s18()
              .withHeight(18 / 18)
              .withWeight(FontWeight.w600)
              .withLetterSpacing(-2.5 / 100),
        ),
        const SizedBox(height: 21),
        Align(
          child: AppShimmer(
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Align(
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                S.of(context).changePhoto,
                style: Styles.s13()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.blue.shade500),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        GapItems(
          items: [
            AppShimmer(
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            AppShimmer(
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppShimmer(
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '-',
                    style: Styles.s15()
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
                Expanded(
                  child: AppShimmer(
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '-',
                    style: Styles.s15()
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
                Expanded(
                  child: AppShimmer(
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AppShimmer(
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
