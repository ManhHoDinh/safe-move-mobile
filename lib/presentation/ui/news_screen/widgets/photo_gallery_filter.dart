import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../blocs/photo_gallery_cubit.dart';

class PhotoGalleryFilter extends StatelessWidget {
  const PhotoGalleryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PhotoGalleryCubit>().state;
    final selectedFilter = state.filterSgmNewsType;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableChips<FilterSgmNewsType>(
          selected: selectedFilter == null ? {} : {selectedFilter},
          data: [
            ChipData(
                value: FilterSgmNewsType.LATEST, label: S.of(context).latest),
            ChipData(
                value: FilterSgmNewsType.POPULAR, label: S.of(context).popular),
          ],
          onSelect: (value) {
            context.read<PhotoGalleryCubit>().changePostsFilter(value);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SelectableChips<PostLanguage>(
            selected: state.postLanguage != null ? {state.postLanguage!} : {},
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
              context.read<PhotoGalleryCubit>().changePostsLanguage(value);
            },
          ),
        ),
      ],
    );
  }
}
