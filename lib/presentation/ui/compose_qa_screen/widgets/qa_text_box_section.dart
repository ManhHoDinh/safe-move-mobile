import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../blocs/compose_qa_cubit.dart';
import '../blocs/compose_qa_state.dart';

class QATextBoxSection extends StatelessWidget {
  const QATextBoxSection({super.key});

  String? renderQAFieldError(BuildContext context, QAFieldError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case QAFieldError.empty:
        return S.of(context).empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).qaDetails,
          style: Styles.s18()
              .withHeight(1)
              .withLetterSpacing(-2.5 / 100)
              .withWeight(FontWeight.w600)
              .withColor(AppColors.text.main),
        ),
        const SizedBox(height: 16),
        BlocBuilder<ComposeQACubit, ComposeQAState>(
            buildWhen: (previous, current) =>
                previous.questionField.value != current.questionField.value ||
                previous.questionField.error != current.questionField.error,
            builder: (context, state) {
              return CommonTextField(
                useClearIcon: false,
                hintText: S.of(context).qaDetailsHintText,
                errorText:
                    renderQAFieldError(context, state.questionField.error),
                maxLines: 6,
                onChanged: (value) {
                  context.read<ComposeQACubit>().onQuestionFieldChange(value);
                },
              );
            }),
      ],
    );
  }
}
