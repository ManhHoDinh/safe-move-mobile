import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/gap_items.dart';
import '../../../shared/widgets/posts/post_info.dart';
import '../../../utilities/date_format.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';
import 'see_all_title_bar.dart';

class BestReviewsSection extends StatelessWidget {
  const BestReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final currentLocale = context.watch<LocaleCubit>().state;
        final listTitle = state.mainPageTitleResponse;
        final title = currentLocale == const Locale('en')
            ? listTitle?.thirdTitleEn
            : currentLocale == const Locale('zh')
                ? listTitle?.thirdTitleCn
                : currentLocale == const Locale('ko')
                    ? listTitle?.thirdTitleKr
                    : listTitle?.thirdTitleJp;
        final betsReviewResponse = state.bestReviewResponse;
        final List<PostInfo> bestReviews = betsReviewResponse
            .map((post) => PostInfo(
                  title: post.title ?? '',
                  imagePath: post.mainThumbnail?.previewUrl ??
                      post.thumbnail?.previewUrl,
                  role: post.nameOfMainCharacter ?? post.writer?.name ?? '',
                  trailing: formatDate(post.createdAt!),
                  onTap: () {
                    CuratorPostDetailRouteData(postId: post.id ?? 1)
                        .push(context);
                  },
                  showDot: false,
                  isNetworkImage: true,
                ))
            .toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SeeAllTitleBar(
              title: title ?? '',
              onTap: () {
                CuratorRouteData(
                        preSelectedParentId:
                            betsReviewResponse[0].category?.parent?.id ?? 0)
                    .go(context);
              },
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: state.loadingOnlineMagazine
                  ? const AppShimmer(
                      child: GapItems(
                        items: [
                          PostInfo(title: '', role: '', trailing: ''),
                          PostInfo(title: '', role: '', trailing: ''),
                          PostInfo(title: '', role: '', trailing: ''),
                        ],
                      ),
                    )
                  : bestReviews.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            S.of(context).noPostDisplayed,
                            textAlign: TextAlign.center,
                            style: Styles.s15()
                                .withWeight(FontWeight.w500)
                                .withLetterSpacing(-2.5 / 100)
                                .withColor(AppColors.text.common),
                          ),
                        )
                      : GapItems(
                          items: bestReviews,
                        ),
            ),
          ],
        );
      },
    );
  }
}
