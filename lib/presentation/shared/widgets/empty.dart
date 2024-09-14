import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';

class TextCenter extends StatelessWidget {
  const TextCenter({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(
          title,
          style: Styles.s15()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.main),
        ),
      ),
    );
  }
}
