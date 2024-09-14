import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../router/router_config/routes/news_branch/news_branch.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/gap_items.dart';
import '../../../utilities/category_name_resolver.dart';
import '../../../utilities/date_format.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';
import 'see_all_title_bar.dart';

class SungongMuseumSection extends StatelessWidget {
  const SungongMuseumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final currentLocale = context.watch<LocaleCubit>().state;
      final listTitle = state.mainPageTitleResponse;
      final title = currentLocale == const Locale('en')
          ? listTitle?.fourthTitleEn
          : currentLocale == const Locale('zh')
              ? listTitle?.fourthTitleCn
              : currentLocale == const Locale('ko')
                  ? listTitle?.fourthTitleKr
                  : listTitle?.fourthTitleJp;
      final sgmNewsResponse = state.sgmNewsResponse;
      final List<SungongMuseumInfo> sgmNews = sgmNewsResponse
          .map((post) => SungongMuseumInfo(
                dateTime: post.createdAt ?? DateTime.now(),
                title: post.title ?? '',
                imagePath: post.mainThumbnail?.previewUrl ??
                    post.thumbnail?.previewUrl,
                tag: resolvePostCategoryName(
                      context,
                      post.category,
                    ) ??
                    '',
                onTap: () {
                  NewsPostDetailRouteData(postId: post.id ?? 1).push(context);
                },
              ))
          .toList();
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeeAllTitleBar(
            title: title ?? '',
            onTap: () {
              const NewsRouteData().go(context);
            },
          ),
          const SizedBox(height: 12),
          if (state.loadingSgmNews)
            AppShimmer(
              child: SungongMuseumInfoSection(
                items: [
                  SungongMuseumInfo(
                    dateTime: DateTime(2023, 12, 15),
                    title: 'SGM 사랑나눔회, 사회복지법인 신아원 후원금 전달 및 나눔봉사',
                    tag: '공지',
                    loading: true,
                  ),
                  SungongMuseumInfo(
                    dateTime: DateTime(2023, 12, 15),
                    title: 'SGM 사랑나눔회, 사회복지법인 신아원 후원금 전달 및 나눔봉사',
                    tag: '공지',
                    loading: true,
                  ),
                  SungongMuseumInfo(
                    dateTime: DateTime(2023, 12, 15),
                    title: 'SGM 사랑나눔회, 사회복지법인 신아원 후원금 전달 및 나눔봉사',
                    tag: '공지',
                    loading: true,
                  ),
                ],
              ),
            )
          else if (sgmNews.isEmpty)
            Padding(
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
          else
            SungongMuseumInfoSection(items: sgmNews),
        ],
      );
    });
  }
}

class SungongMuseumInfoSection extends StatelessWidget {
  const SungongMuseumInfoSection({
    super.key,
    this.items = const [],
  });

  final List<SungongMuseumInfo> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GapItems(
        items: items,
        axis: Axis.horizontal,
      ),
    );
  }
}

class SungongMuseumInfo extends StatelessWidget {
  const SungongMuseumInfo(
      {super.key,
      required this.dateTime,
      required this.title,
      this.imagePath,
      required this.tag,
      this.onTap,
      this.loading = false});

  final String? imagePath;
  final String tag;
  final String title;
  final DateTime dateTime;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loading)
              Container(
                width: 216,
                height: 136,
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8)),
              )
            else
              SizedBox(
                height: 136,
                child: AspectRatio(
                  aspectRatio: 216 / 136,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(6),
                    decoration: imagePath != null
                        ? BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                imagePath!,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          )
                        : BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.gray.shade200.withOpacity(0.8),
                      ),
                      child: Text(
                        tag,
                        style: Styles.s12()
                            .withWeight(FontWeight.w600)
                            .withColor(AppColors.blue.shade500),
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Container(
              width: 216,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (loading)
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  else
                    Text(
                      title,
                      style: Styles.s15()
                          .withWeight(FontWeight.w500)
                          .withHeight(20 / 15)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.text.main),
                    ),
                  const SizedBox(height: 8),
                  if (loading)
                    Container(
                      height: 12,
                      width: 45,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  else
                    Text(
                      formatDate(dateTime),
                      style: Styles.s12().withColor(AppColors.text.bodyText),
                    ),
                ],
              ),
            ),
          ],
        ),
        if (!loading)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: onTap,
              ),
            ),
          ),
      ],
    );
  }
}
