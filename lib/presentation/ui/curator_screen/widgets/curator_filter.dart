import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/common/common.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/curator_cubit.dart';

class CuratorFilterBar extends StatelessWidget {
  const CuratorFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CuratorPostCubit, CuratorState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.availableChildCategory.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SelectableChips<int>(
                  selected: state.selectedChildCategory,
                  data: state.availableChildCategory
                      .map((e) => ChipData(
                          value: e.id ?? 0,
                          label: resolveSubCategoryName(context, e) ?? ''))
                      .toList(),
                  onSelect: (value) {
                    context.read<CuratorPostCubit>().selectChildCategory(state
                        .availableChildCategory
                        .where((element) => element.id == value)
                        .firstOrNull);
                  },
                ),
              )
            else
              const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SelectableChips<PostLanguage>(
                selected:
                    state.postLanguage != null ? {state.postLanguage!} : {},
                data: const [
                  ChipData(
                    value: PostLanguage.KOREAN,
                    label: 'KO',
                  ),
                  ChipData(
                    value: PostLanguage.ENGLISH,
                    label: 'EN',
                  ),
                  ChipData(
                    value: PostLanguage.CHINESE,
                    label: 'CN',
                  ),
                  ChipData(
                    value: PostLanguage.JAPANESE,
                    label: 'JP',
                  ),
                ],
                onSelect: (value) {
                  context.read<CuratorPostCubit>().changePostsLanguage(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
