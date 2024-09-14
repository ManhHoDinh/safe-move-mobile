import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../blocs/create_post_cubit.dart';
import '../blocs/create_post_state.dart';

class InputSubjectSection extends StatelessWidget {
  const InputSubjectSection({super.key});

  String? renderRegisterError(
      BuildContext context, CreatePostNameFieldError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case CreatePostNameFieldError.empty:
        return S.of(context).empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
        buildWhen: (prev, curr) {
      return prev.createPostNameField.value != curr.createPostNameField.value;
    }, builder: (context, state) {
      return CommonTextField(
        initialValue: state.createPostNameField.value,
        maxLines: null,
        useClearIcon: false,
        hintText: S.of(context).pleaseEnterSubject,
        haveBorder: false,
        hintTextStyle: Styles.s18()
            .withLetterSpacing(-2.5 / 100)
            .withHeight(1)
            .withColor(AppColors.text.bodyText),
        textStyle: Styles.s18()
            .withWeight(FontWeight.w600)
            .withLetterSpacing(-2.5 / 100)
            .withHeight(1)
            .withColor(AppColors.text.main),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18).copyWith(top: 16),
        onChanged: (value) {
          context.read<CreatePostCubit>().onNameChanged(value);
        },
        errorText: renderRegisterError(
            context, state.createPostNameField.displayError),
      );
    });
  }
}
