import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/gap_items.dart';
import '../../../shared/widgets/posts/post_info.dart';
import '../../../utilities/date_format.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';
import 'see_all_title_bar.dart';

class OnlineMagazineSection extends StatelessWidget {
  const OnlineMagazineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final currentLocale = context.watch<LocaleCubit>().state;
        final listTitle = state.mainPageTitleResponse;
        final title = currentLocale == const Locale('en')
            ? listTitle?.secondTitleEn
            : currentLocale == const Locale('zh')
                ? listTitle?.secondTitleCn
                : currentLocale == const Locale('ko')
                    ? listTitle?.secondTitleKr
                    : listTitle?.secondTitleJp;
        final onlineMagazineResponse = state.onlineMagazineResponse;
        final OnlineMagazineHeadline? headline =
            onlineMagazineResponse.isNotEmpty
                ? OnlineMagazineHeadline(
                    role: onlineMagazineResponse[0].nameOfMainCharacter ??
                        onlineMagazineResponse[0].writer?.name ??
                        '',
                    title: onlineMagazineResponse[0].title ?? '',
                    subTitle: onlineMagazineResponse[0].contentPlainText ?? '',
                    imagePath:
                        onlineMagazineResponse[0].mainThumbnail?.previewUrl ??
                            onlineMagazineResponse[0].thumbnail?.previewUrl,
                    onTap: () {
                      CuratorPostDetailRouteData(
                              postId: onlineMagazineResponse[0].id ?? 1)
                          .push(context);
                    },
                  )
                : null;
        final List<PostInfo> onlineMagazinePosts = headline != null
            ? onlineMagazineResponse
                .skip(1)
                .map(
                  (post) => PostInfo(
                    title: post.title ?? '',
                    imagePath: post.mainThumbnail?.previewUrl ??
                        post.thumbnail?.previewUrl,
                    role: post.nameOfMainCharacter ?? post.writer?.name ?? '',
                    isNetworkImage: true,
                    onTap: () {
                      CuratorPostDetailRouteData(postId: post.id ?? 1)
                          .push(context);
                    },
                    trailing: formatDate(post.createdAt!),
                    showDot: false,
                  ),
                )
                .toList()
            : [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SeeAllTitleBar(
              title: title ?? '',
              onTap: () {
                CuratorRouteData(
                        preSelectedParentId:
                            onlineMagazineResponse[0].category?.parent?.id ?? 0)
                    .go(context);
              },
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: state.loadingOnlineMagazine
                  ? AppShimmer(
                      child: OnlineMagazineHeadline(
                        role: '최정민 CEO',
                        title: '꿈을 실현하는 여성 사업가',
                        subTitle:
                            '인셀덤 사업으로 더 이상 남편에게 의지하는 계약직 상담원이 아닌, 남편의 인생까지 책임지는 멋있는 여성 사업가로 우뚝 서기까지.',
                        onTap: () {},
                        loading: true,
                      ),
                    )
                  : headline ?? const SizedBox.shrink(),
            ),
            if (onlineMagazinePosts.isNotEmpty) const SizedBox(height: 16),
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
                  : GapItems(
                      items: onlineMagazinePosts,
                    ),
            ),
          ],
        );
      },
    );
  }
}

class OnlineMagazineHeadline extends StatelessWidget {
  const OnlineMagazineHeadline({
    super.key,
    required this.role,
    required this.title,
    required this.subTitle,
    this.imagePath,
    this.onTap,
    this.loading = false,
  });

  final String? imagePath;
  final String title;
  final String subTitle;
  final String role;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (loading)
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 339 / 400,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                    child: Text(
                      role,
                      style: Styles.s15()
                          .withHeight(24 / 15)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.gray.shade100),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            if (loading)
              Container(
                width: 200,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
              )
            else
              Text(
                title,
                style: Styles.s20()
                    .withWeight(FontWeight.w600)
                    .withLetterSpacing(-5 / 100)
                    .withColor(AppColors.text.main),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 2),
            if (loading)
              Container(
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
              )
            else
              Text(
                subTitle,
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.common),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
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
