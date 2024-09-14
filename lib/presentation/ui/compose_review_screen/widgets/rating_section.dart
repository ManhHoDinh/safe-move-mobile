import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/app_rating_bar.dart';
import '../blocs/compose_review_cubit.dart';
import '../blocs/compose_review_state.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComposeReviewCubit, ComposeReviewState>(
        buildWhen: (previous, current) =>
            previous.ratingPoint != current.ratingPoint,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).productRating,
                  style: Styles.s18()
                      .withHeight(1)
                      .withLetterSpacing(-2.5 / 100)
                      .withWeight(FontWeight.w600)
                      .withColor(AppColors.text.main),
                ),
                const SizedBox(height: 4),
                AppRatingBar(
                  starPadding: const EdgeInsets.all(10.5),
                  starSize: 35,
                  rating: state.ratingPoint.toDouble(),
                  onChanged: (value) {
                    context.read<ComposeReviewCubit>().onRatingChanged(value);
                  },
                ),
              ],
            ),
          );
        });
  }
}
