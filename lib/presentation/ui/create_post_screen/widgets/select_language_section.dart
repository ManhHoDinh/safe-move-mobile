import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/common/common.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/filters/head_filter.dart';
import '../blocs/create_post_cubit.dart';
import '../blocs/create_post_state.dart';
import 'post_language_sheet.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  static final List<LanguageItem> languages = [
    const LanguageItem(language: PostLanguage.KOREAN, label: 'Korea'),
    const LanguageItem(language: PostLanguage.ENGLISH, label: 'English'),
    const LanguageItem(language: PostLanguage.CHINESE, label: 'Chinese'),
    const LanguageItem(language: PostLanguage.JAPANESE, label: 'Japanese'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
      return HeadFilter(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        spacer: const Spacer(),
        style: Styles.s15()
            .withLetterSpacing(-2.5 / 100)
            .withHeight(24 / 15)
            .withColor(AppColors.text.common),
        value: state.language?.label ?? S.of(context).selectLanguage,
        onTap: () async {
          final result = await PostLanguageRouteData($extra: languages)
              .push<LanguageItem>(context);
          if (result == null) {
            return;
          }
          if (!context.mounted) {
            return;
          }
          context.read<CreatePostCubit>().onPostLanguageChanged(
                languages
                    .where((element) => element.language == result.language)
                    .firstOrNull,
              );
        },
      );
    });
  }
}
