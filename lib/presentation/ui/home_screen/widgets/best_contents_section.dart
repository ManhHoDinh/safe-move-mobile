import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';

class BestContentsSection extends StatelessWidget {
  const BestContentsSection({super.key});

  static final List<BestContentInfoItem> items = [
    BestContentInfoItem(
      title: 'Low Risk 인셀덤 사업으로 부자의 꿈에 가까워졌습니다.',
      tag: '자영업',
      role: '이엘 CEO',
      onTap: () {},
      loading: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final currentLocale = context.watch<LocaleCubit>().state;
        final listTitle = state.mainPageTitleResponse;
        final title = currentLocale == const Locale('en')
            ? listTitle?.firstTitleEn
            : currentLocale == const Locale('zh')
                ? listTitle?.firstTitleCn
                : currentLocale == const Locale('ko')
                    ? listTitle?.firstTitleKr
                    : listTitle?.firstTitleJp;
        final betsContentResponse = state.bestContentResponse;
        final List<BestContentInfoItem> bestContents = betsContentResponse
            .map((post) => BestContentInfoItem(
                  title: post.title ?? '',
                  imagePath: post.mainThumbnail?.previewUrl ??
                      post.thumbnail?.previewUrl,
                  tag: resolveSubCategoryName(
                        context,
                        post.category?.parent,
                      ) ??
                      '',
                  role: post.nameOfMainCharacter ?? post.writer?.name ?? '',
                  onTap: () {
                    CuratorPostDetailRouteData(postId: post.id ?? 0)
                        .push(context);
                  },
                ))
            .toList();
        return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.blue.shade600,
                  width: 0,
                ),
                bottom: const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blue.shade600,
                  Colors.transparent,
                ],
                stops: const [
                  0.08,
                  0.4,
                ],
              ),
            ),
            child: state.loadingBestContent
                ? AppShimmer(
                    child: ItemSwitcher(
                    items: items,
                    loading: true,
                  ))
                : bestContents.isEmpty
                    ? const SizedBox.shrink()
                    : ItemSwitcher(
                        items: bestContents,
                        title: title ?? '',
                      ));
      },
    );
  }
}

class ItemSwitcher extends StatefulWidget {
  const ItemSwitcher(
      {super.key,
      this.items = const [],
      this.loading = false,
      this.title = ''});

  final List<BestContentInfoItem> items;
  final bool loading;
  final String title;
  static const animationDuration = Duration(milliseconds: 300);
  static const height = 348.0;

  @override
  State<ItemSwitcher> createState() => _ItemSwitcherState();
}

class _ItemSwitcherState extends State<ItemSwitcher> {
  CarouselController carouselController = CarouselController();
  int _currentIdx = 0;

  void _moveNext() {
    _currentIdx++;
    if (_currentIdx >= widget.items.length) {
      _currentIdx = 0;
    }
    carouselController.nextPage();
    setState(() {});
  }

  void _movePrev() {
    _currentIdx--;
    if (_currentIdx < 0) {
      _currentIdx = widget.items.length - 1;
    }
    carouselController.previousPage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: _CounterSwitcher(
            index: _currentIdx,
            totalCount: widget.items.length,
            onNext: _moveNext,
            onPrev: _movePrev,
            loading: widget.loading,
            title: widget.title,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: ItemSwitcher.height,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return widget.items[index];
            },
            options: CarouselOptions(
              onPageChanged: (page, reason) {
                setState(() {
                  _currentIdx = page;
                });
              },
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlay: true,
              initialPage: _currentIdx,
              height: 365,
            ),
          ),
        ),
        // AnimatedSwitcher(
        //   duration: ItemSwitcher.animationDuration,
        //   child: Padding(
        //     key: ValueKey(_currentIdx),
        //     padding: const EdgeInsets.symmetric(horizontal: 18),
        //     child: widget.items[_currentIdx],
        //   ),
        // ),
      ],
    );
  }
}

class _CounterSwitcher extends StatelessWidget {
  const _CounterSwitcher({
    required this.index,
    required this.totalCount,
    this.onNext,
    this.onPrev,
    this.loading = false,
    this.title = '',
  });

  final int index;
  final int totalCount;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;
  final bool loading;
  final String title;

  static const animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    const buttonSize = Size.square(32);
    return loading
        ? Container(
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          )
        : Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Styles.s20()
                      .withWeight(FontWeight.w600)
                      .withLetterSpacing(-5 / 100)
                      .withColor(AppColors.gray.shade70),
                ),
              ),
              DefaultTextStyle(
                style: Styles.s12().withColor(AppColors.gray.shade70),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIconButton(
                      size: buttonSize,
                      icon: RotatedBox(
                        quarterTurns: 2,
                        child: Assets.svgs.chevronRight16.svg(),
                      ),
                      onTap: onPrev,
                    ),
                    const SizedBox(width: 13),
                    AnimatedSwitcher(
                      duration: animationDuration,
                      child: Text(
                        '${index + 1}',
                        key: ValueKey(index),
                      ),
                    ),
                    Text('/$totalCount'),
                    const SizedBox(width: 13),
                    AppIconButton(
                      size: buttonSize,
                      icon: Assets.svgs.chevronRight16.svg(),
                      onTap: onNext,
                    )
                  ],
                ),
              ),
            ],
          );
  }
}

class BestContentInfoItem extends StatelessWidget {
  const BestContentInfoItem({
    super.key,
    required this.title,
    this.imagePath,
    required this.tag,
    required this.role,
    this.onTap,
    this.loading = false,
  });

  final String? imagePath;
  final String tag;
  final String title;
  final String role;
  final VoidCallback? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (loading)
              Container(
                height: 240,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 339 / 240,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
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
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: AppColors.gray.shade200.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        tag,
                        style: Styles.s12()
                            .withWeight(FontWeight.w400)
                            .withColor(AppColors.text.main),
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (loading)
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else
                  Text(
                    role,
                    style: Styles.s15()
                        .withWeight(FontWeight.w500)
                        .withColor(AppColors.text.common)
                        .withLetterSpacing(-2.5 / 100),
                  ),
                const SizedBox(height: 4),
                if (loading)
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )
                else
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.s20()
                        .withWeight(FontWeight.w600)
                        .withColor(AppColors.text.main)
                        .withLetterSpacing(-5 / 100),
                  ),
              ],
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
