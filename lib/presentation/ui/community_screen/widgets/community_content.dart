import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/category/category.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../../shared/widgets/item_divider.dart';
import '../../../shared/widgets/posts/post_stats_info.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/community_cubit.dart';
import 'post_loading_empty.dart';
import 'post_loading_error.dart';

class CommunityContent extends StatelessWidget {
  const CommunityContent({super.key});

  @override
  Widget build(BuildContext context) {
    final shimmerItem = AppShimmer(
      child: PostStatsInfo(
        loading: true,
        title: '게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목',
        subTitle:
            '게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용',
        communityName: '게시판 이름',
        category: '분류',
        author: '작성자',
        created: DateTime(2024, 3, 10),
      ),
    );
    return InfiniteLoaderUnControlledWrapper<CommunityPostCubit,
        CommunityState>.value(
      value: context.read<CommunityPostCubit>(),
      builder: (BuildContext context, CommunityState state) {
        final helper = InfiniteLoaderCalculatorHelper(state);
        if (helper.firstLoadInProgress) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18)
                .copyWith(top: 24, bottom: 50),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return shimmerItem;
            },
            separatorBuilder: (BuildContext context, int index) {
              return const ItemDivider();
            },
            itemCount: 100,
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            context.read<CommunityPostCubit>().reload();
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (helper.firstLoadError) {
                return helper.fullPageScrollable(context, constraints,
                    builder: (context) {
                  return const PostLoadingError();
                });
              }
              if (helper.emptyResult) {
                return helper.fullPageScrollable(context, constraints,
                    builder: (context) {
                  return const PostLoadingEmpty();
                });
              }
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(top: 24, bottom: 100),
                // controller: controller,
                itemCount: helper.length,
                itemBuilder: (BuildContext context, int index) {
                  return helper.renderItem(
                    context,
                    index,
                    loadingItemBuilder: (context) {
                      return shimmerItem;
                    },
                    itemBuilder: (context) {
                      final data = state.data[index];
                      return PostStatsInfo(
                        title: data.title ?? '',
                        subTitle: data.contentPlainText ?? '',
                        category:
                            resolvePostCategoryName(context, data.category),
                        communityName: resolveSubCategoryName(
                            context, data.category?.parent),
                        author: data.writer?.name ?? '',
                        created: data.updatedAt ?? DateTime.now(),
                        imagePath: data.thumbnail?.previewUrl,
                        commentCount: data.commentCounter ?? 0,
                        heartCount: data.reactionCounter ?? 0,
                        viewCount: data.viewCounter ?? 0,
                        writer: data.writer,
                        onAction: (action) async {
                          if (action == PostAction.delete) {
                            final agreed = await ConfirmRouteData(
                                    content: S
                                        .of(context)
                                        .areYouSureToDeleteThisPost)
                                .push<bool>(context);

                            if (agreed == null) {
                              return;
                            }
                            if (agreed == true && context.mounted) {
                              context
                                  .read<CommunityPostCubit>()
                                  .deletePost(index);
                            }
                          }
                          if (action == PostAction.edit) {
                            final result = await EditPostRouteData(
                              categoryType: CategoryType.community,
                              postId: data.id ?? 0,
                            ).push<bool>(context);

                            if (!context.mounted) {
                              return;
                            }
                            if (result != null && result) {
                              context.read<CommunityPostCubit>().reload();
                            }
                          }
                        },
                        onTap: () async {
                          final result = await CommunityPostDetailRouteData(
                            postId: data.id ?? 0,
                          ).push<bool>(context);
                          if (result == null || !context.mounted) {
                            return;
                          }

                          if (result) {
                            context.read<CommunityPostCubit>().reload();
                          }
                        },
                      );
                    },
                    errorItemBuilder: (context) {
                      return const InfiniteLoadingListItemError();
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const ItemDivider();
                },
              );
            },
          ),
        );
      },
    );
  }
}
