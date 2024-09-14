import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../utilities/date_format.dart';

class WriterInfoSection extends StatelessWidget {
  const WriterInfoSection({
    super.key,
    required this.imageUrl,
    required this.nameWriter,
    required this.createdAt,
    this.showDetailsNav = true,
    this.onProfilePressed,
    this.loading = false,
  });

  final String? imageUrl;
  final String? nameWriter;
  final DateTime? createdAt;
  final VoidCallback? onProfilePressed;
  final bool showDetailsNav;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 40,
      height: 40,
    );
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: 40,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gray.shade300,
                ),
                alignment: Alignment.center,
                child: loading || imageUrl == null
                    ? null
                    : Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: helperImage.imageErrorBuilder,
                        loadingBuilder: helperImage.imageLoadingBuilder,
                      ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (loading)
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                      ),
                    )
                  else
                    SelectableText(
                      nameWriter ?? '',
                      style: Styles.s15()
                          .withWeight(FontWeight.w500)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.gray.shade800),
                    ),
                  const SizedBox(height: 6),
                  if (loading)
                    Container(
                      height: 13,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                      ),
                    )
                  else
                    Text(
                      createdAt != null ? formatDate(createdAt!) : '',
                      style: Styles.s13()
                          .withHeight(13 / 13)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.gray.shade500),
                    )
                ],
              )
            ],
          ),
        ),
        if (showDetailsNav)
          AppOutlinedButton.square(
            onPressed: loading ? null : onProfilePressed,
            backgroundColor: loading ? AppColors.black : null,
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
