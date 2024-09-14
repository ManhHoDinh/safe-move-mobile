import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../blocs/youtube_video_internal_cubit.dart';

class YoutubeVideoFilter extends StatelessWidget {
  const YoutubeVideoFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<YoutubeVideoInternalCubit>().state;
    final selectedTypeFilter = state.youtubeVideoType;
    final selectedSortFilter = state.youtubeVideoSort;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableChips<YoutubeVideoType>(
          selected: selectedTypeFilter == null ? {} : {selectedTypeFilter},
          data: [
            ChipData(
                value: YoutubeVideoType.LONG, label: S.of(context).longVideo),
            ChipData(
                value: YoutubeVideoType.SHORT, label: S.of(context).shortVideo),
          ],
          onSelect: (value) {
            context
                .read<YoutubeVideoInternalCubit>()
                .changeVideoTypeFilter(value);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SelectableChips<YoutubeVideoSort>(
            selected: {selectedSortFilter},
            data: [
              ChipData(
                value: YoutubeVideoSort.LATEST,
                label: S.of(context).latest,
              ),
              ChipData(
                value: YoutubeVideoSort.BY_VIEW,
                label: S.of(context).popular,
              ),
              ChipData(
                value: YoutubeVideoSort.BY_REACTION,
                label: S.of(context).reaction,
              ),
            ],
            onSelect: (value) {
              context
                  .read<YoutubeVideoInternalCubit>()
                  .changeSortOrderFilter(value);
            },
          ),
        ),
      ],
    );
  }
}
