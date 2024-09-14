import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../blocs/compose_review_cubit.dart';
import '../blocs/compose_review_state.dart';

class ReviewTextBoxSection extends StatelessWidget {
  const ReviewTextBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComposeReviewCubit, ComposeReviewState>(
        buildWhen: (previous, current) => previous.content != current.content,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).writeReviewTextBoxTitle,
                  style: Styles.s18()
                      .withHeight(1)
                      .withLetterSpacing(-2.5 / 100)
                      .withWeight(FontWeight.w600)
                      .withColor(AppColors.text.main),
                ),
                const SizedBox(height: 16),
                CommonTextField(
                  useClearIcon: false,
                  hintText: S.of(context).writeReviewHintText,
                  maxLines: 6,
                  onChanged: (value) =>
                      context.read<ComposeReviewCubit>().onReviewChanged(value),
                ),
              ],
            ),
          );
        });
  }
}
