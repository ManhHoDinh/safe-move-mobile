import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/common/common.dart';
import '../../../../application/services/post_community/post_community.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/widgets/filters/head_filter.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/community_cubit.dart';
import 'community_filter_sheet.dart';
import 'sub_category_chips.dart';

class CommunityFilter extends StatelessWidget {
  const CommunityFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityPostCubit, CommunityState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: HeadFilter(
                  value: resolveCategoryName(context, state.parentCategory) ??
                      S.of(context).seeAll,
                  onTap: () async {
                    final List<CommunityCategoryItem> categories = [
                      CommunityCategoryItem(
                        label: S.of(context).seeAll,
                        shouldShowFavoriteIcon: false,
                      ),
                    ];
                    categories.addAll(
                      (state.communityCategories ?? []).map(
                        (e) => CommunityCategoryItem(
                          favorite: e.isFavorite ?? false,
                          label: resolveCategoryName(context, e) ?? '',
                          id: e.id,
                        ),
                      ),
                    );
                    final result =
                        await CommunityCategoriesRouteData($extra: categories)
                            .push(context);
                    if (!context.mounted) {
                      return;
                    }
                    if (result is CommunityCategoryItem) {
                      context.read<CommunityPostCubit>().changeParentCategory(
                            state.communityCategories
                                ?.where((element) => element.id == result.id)
                                .firstOrNull,
                          );
                    }
                    context.read<CommunityPostCubit>().loadCategory();
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return SizeTransition(
                        axis: Axis.horizontal,
                        axisAlignment: -1,
                        sizeFactor: animation,
                        child: child,
                      );
                    },
                    child: state.parentCategory != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: SubCategoryChips(
                              label: resolveSubCategoryName(
                                      context, state.childCategory) ??
                                  S.of(context).category,
                              onTap: () async {
                                final List<CommunityCategoryItem> categories = [
                                  CommunityCategoryItem(
                                    label: S.of(context).category,
                                    shouldShowFavoriteIcon: false,
                                  ),
                                ];
                                categories.addAll(
                                  (state.parentCategory?.children ?? []).map(
                                    (e) => CommunityCategoryItem(
                                      shouldShowFavoriteIcon: false,
                                      label:
                                          resolveSubCategoryName(context, e) ??
                                              '',
                                      id: e.id,
                                    ),
                                  ),
                                );
                                final result =
                                    await CommunityCategoriesRouteData(
                                            $extra: categories)
                                        .push<CommunityCategoryItem>(context);
                                if (result == null) {
                                  return;
                                }
                                if (!context.mounted) {
                                  return;
                                }

                                context
                                    .read<CommunityPostCubit>()
                                    .changeChildCategory(
                                      state.parentCategory?.children
                                          ?.where((element) =>
                                              element.id == result.id)
                                          .firstOrNull,
                                    );
                              },
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  SelectableChips<FilterCommunityPost>(
                    padding: EdgeInsets.only(
                        left: state.parentCategory != null ? 8 : 18),
                    selected: <FilterCommunityPost>{}
                      ..add(state.filterCommunityPost),
                    data: [
                      if (state.parentCategory == null)
                        ChipData(
                          value: FilterCommunityPost.ALL,
                          label: S.of(context).allPosts,
                        )
                      else
                        ChipData(
                          value: FilterCommunityPost.LATEST,
                          label: S.of(context).latest,
                        ),
                      if (state.parentCategory == null)
                        ChipData(
                          value: FilterCommunityPost.FAVORITE,
                          label: S.of(context).favoritePosts,
                        ),
                      ChipData(
                        value: FilterCommunityPost.POPULAR,
                        label: S.of(context).popularPosts,
                      ),
                    ],
                    onSelect: (value) {
                      context
                          .read<CommunityPostCubit>()
                          .changePostFilter(value);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
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
                    context
                        .read<CommunityPostCubit>()
                        .changePostsLanguage(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
