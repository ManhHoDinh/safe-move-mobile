import 'package:flutter/cupertino.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/theme/src/app_style.dart';

class PostTypeSection extends StatelessWidget {
  const PostTypeSection({
    super.key,
    required this.category,
    required this.classification,
    this.loading = false,
  });

  final String? category;
  final String? classification;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //category
        if (loading || category != null)
          Container(
            width: loading ? 100 : null,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.blue.shade100,
            ),
            child: Text(
              category ?? '',
              style: Styles.s14().withColor(AppColors.blue.shade500),
            ),
          ),
        const SizedBox(width: 8),
        //classification
        if (loading || classification != null)
          Container(
            width: loading ? 100 : null,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: loading ? AppColors.blue.shade200 : null,
              border: Border.all(
                color: AppColors.blue.shade200,
              ),
            ),
            child: Text(
              classification ?? '',
              style: Styles.s14().withColor(AppColors.blue.shade500),
            ),
          ),
      ],
    );
  }
}
