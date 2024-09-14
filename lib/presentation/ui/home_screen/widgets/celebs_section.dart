import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/theme.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';

class CelebsSection extends StatelessWidget {
  const CelebsSection({super.key});

  static final List<CelebInfoItem> _celebInfoItems = [
    const CelebInfoItem(
      title: '저는 누군가의 꿈과 소망을 이뤄주는 사람이에요',
      subTitle: '이미경 CEO',
      loading: true,
    ),
    const CelebInfoItem(
      title: '저는 누군가의 꿈과 소망을 이뤄주는 사람이에요',
      subTitle: '이미경 CEO',
      loading: true,
    ),
    const CelebInfoItem(
      title: '저는 누군가의 꿈과 소망을 이뤄주는 사람이에요',
      subTitle: '이미경 CEO',
      loading: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final items = _celebInfoItems;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final mainPostResponse = state.mainResponse;
        final List<CelebInfoItem> mainPosts = mainPostResponse
            .map(
              (post) => CelebInfoItem(
                title: post.mainPageTitle ?? post.title ?? '',
                subTitle: post.nameOfMainCharacter ?? post.writer?.name ?? '',
                imagePath: post.mainThumbnail?.previewUrl ??
                    post.thumbnail?.previewUrl,
                onTap: () {
                  CuratorPostDetailRouteData(postId: post.id ?? 0)
                      .push(context);
                },
              ),
            )
            .toList();
        return Container(
          decoration: BoxDecoration(
            color: AppColors.blue.shade600,
            border: Border.all(color: AppColors.blue.shade600, width: 0),
          ),
          child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: state.loadingMain
                  ? AppShimmer(
                      child: _CelebsCarousel(
                        items: items,
                        loading: true,
                      ),
                    )
                  : mainPosts.isEmpty
                      ? const SizedBox.shrink()
                      : _CelebsCarousel(
                          items: mainPosts,
                        )),
        );
      },
    );
  }
}

class CelebInfoItem extends StatelessWidget {
  const CelebInfoItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.imagePath,
    this.loading = false,
    this.onTap,
  });

  final String? imagePath;
  final String title;
  final String subTitle;
  final bool loading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          )
        : Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                alignment: Alignment.bottomLeft,
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
                        color: AppColors.gray.shade700,
                        borderRadius: BorderRadius.circular(8),
                      ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Styles.s24()
                          .withWeight(FontWeight.w600)
                          .withLetterSpacing(-5 / 100)
                          .withColor(AppColors.gray.shade70),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      subTitle,
                      style: Styles.s13()
                          .withWeight(FontWeight.w500)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.gray.shade100),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: onTap,
                ),
              ),
            ],
          );
  }
}

class _CelebsCarousel extends StatefulWidget {
  const _CelebsCarousel({this.items = const [], this.loading = false});

  final List<CelebInfoItem> items;
  final bool loading;

  static const height = 448.0;
  static const aspectRatio = 306 / height;

  @override
  State<_CelebsCarousel> createState() => _CelebsCarouselState();
}

class _CelebsCarouselState extends State<_CelebsCarousel> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _CelebsCarousel.height,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return AspectRatio(
                aspectRatio: _CelebsCarousel.aspectRatio,
                child: items[index],
              );
            },
            options: CarouselOptions(
              onPageChanged: (page, reason) {
                setState(() {
                  _currentIndex = page;
                });
              },
              enlargeCenterPage: true,
              viewportFraction: 0.75,
              autoPlay: true,
              aspectRatio: _CelebsCarousel.aspectRatio,
              initialPage: _currentIndex,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (widget.loading)
          const SizedBox.shrink()
        else
          _CelebsCarouselCounter(
              currentIndex: _currentIndex, totalCount: items.length),
      ],
    );
  }
}

class _CelebsCarouselCounter extends StatelessWidget {
  const _CelebsCarouselCounter({
    required this.currentIndex,
    required this.totalCount,
  });

  final int currentIndex;
  final int totalCount;
  static const animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final textStyle = Styles.s12().withColor(AppColors.gray.shade70).copyWith(
          leadingDistribution: TextLeadingDistribution.even,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: DefaultTextStyle(
        style: textStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: animationDuration,
              child: Text(
                '${currentIndex + 1}',
                key: ValueKey(currentIndex),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 1,
              width: 80,
              color: AppColors.gray.shade300,
            ),
            Text(totalCount.toString()),
          ],
        ),
      ),
    );
  }
}
