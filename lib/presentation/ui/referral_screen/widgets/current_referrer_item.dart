import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';

class CurrentReferrerItem extends StatelessWidget {
  const CurrentReferrerItem({
    super.key,
    this.imageUrl,
    required this.name,
    required this.phone,
    this.onPressed,
    this.loading = false,
  });

  final String? imageUrl;
  final String name;
  final String phone;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(width: 20, height: 20);
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.gray.shade300,
          ),
          child: imageUrl == null || loading
              ? null
              : Image.network(
                  imageUrl!,
                  loadingBuilder: helperImage.imageLoadingBuilder,
                  errorBuilder: helperImage.imageErrorBuilder,
                ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (loading)
                Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.gray.shade300,
                  ),
                )
              else
                Text(
                  name,
                  style: Styles.s15()
                      .withWeight(FontWeight.w500)
                      .withLetterSpacing(-2.5 / 100),
                ),
              const SizedBox(height: 2),
              if (loading)
                Container(
                  height: 20,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.gray.shade300,
                  ),
                )
              else
                Text(
                  phone,
                  style: Styles.s15()
                      .withHeight(24 / 15)
                      .withLetterSpacing(-2.5 / 100),
                ),
            ],
          ),
        ),
        AppOutlinedButton.square(
          onPressed: onPressed,
          title: S.of(context).viewProfile,
          textStyle: Styles.s13()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.blue.shade500),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          borderRadius: BorderRadius.circular(8),
          wrapContent: true,
        )
      ],
    );
  }
}
