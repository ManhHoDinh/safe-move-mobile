import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';

import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';

class AppRatingBar extends StatelessWidget {
  const AppRatingBar({
    super.key,
    this.rating = 0,
    this.onChanged,
    this.starSize = 12,
    this.starPadding = EdgeInsets.zero,
  });

  final double rating;
  final void Function(int value)? onChanged;
  final double starSize;
  final EdgeInsets starPadding;

  @override
  Widget build(BuildContext context) {
    return PannableRatingBar(
      rate: rating,
      onChanged: onChanged == null
          ? null
          : (value) {
              onChanged?.call(value.ceil());
            },
      items: List.generate(
        5,
        (index) => RatingWidget(
          selectedColor: AppColors.red.shade600,
          unSelectedColor: AppColors.gray.shade300,
          child: Padding(
            padding: starPadding,
            child: SizedBox.square(
              dimension: starSize,
              child: FittedBox(
                child: Assets.svgs.starIcon.svg(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
