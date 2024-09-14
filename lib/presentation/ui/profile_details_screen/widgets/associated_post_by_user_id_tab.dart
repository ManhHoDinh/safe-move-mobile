import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/common/common.dart';
import '../../../../application/services/common/dto/src/post_activity_type.dart';
import '../../../../application/services/user/user.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../../shared/widgets/item_divider.dart';
import '../../../shared/widgets/posts/post_info.dart';
import '../../../shared/widgets/posts/post_stats_info.dart';
import '../../../utilities/date_format.dart';
import '../../community_screen/widgets/post_loading_empty.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../blocs/associated_post_by_user_id_cubit.dart';

class AssociatedPostByUserIdTab extends StatelessWidget {
  const AssociatedPostByUserIdTab({
    super.key,
    required this.initialPostActivityType,
    required this.initialPostType,
    required this.userId,
  });

  final PostActivityType initialPostActivityType;
  final PostType initialPostType;
  final int userId;

  Widget renderItemDivider(BuildContext context) {
    if (context.watch<AssociatedPostByUserIdCubit>().state.postType ==
        PostType.COMMUNITY) {
      return const ItemDivider();
    }
    return const SizedBox(
      height: 12,
    );
  }

  Widget renderShimmerItem(BuildContext context) {
    if (context.watch<AssociatedPostByUserIdCubit>().state.postType ==
        PostType.COMMUNITY) {
      return AppShimmer(
        child: PostStatsInfo(
          loading: true,
          title: '게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목게시글 제목',
          subTitle:
              '게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용',
          author: '작성자',
          created: DateTime(2024, 3, 10),
          showDot: false,
        ),
      );
    }
    return AppShimmer(
      child: PostInfo(
        loading: true,
        title: '나의 변화가 무기가 되는 사업. 주저하기엔 너무 아깝다고 생각합니다',
        role: '홍준표 CEO',
        trailing: formatDate(DateTime(2023, 2, 20)),
      ),
    );
  }

  Widget renderSelectableChips(BuildContext context) {
    if (context.watch<AssociatedPostByUserIdCubit>().state.postActivityType ==
        PostActivityType.POSTED) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SelectableChips<PostType>(
        selected: <PostType>{}
          ..add(context.watch<AssociatedPostByUserIdCubit>().state.postType),
        data: [
          ChipData(
            value: PostType.COMMUNITY,
            label: S.of(context).community,
          ),
          ChipData(
            value: PostType.CURATOR,
            label: S.of(context).curator,
          ),
        ],
        onSelect: (value) {
          context.read<AssociatedPostByUserIdCubit>().updatePostType(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteLoaderWrapper<AssociatedPostByUserIdCubit,
        AssociatedPostStateByUserIdState>(
      create: (BuildContext context) {
        return AssociatedPostByUserIdCubit(
          userId: userId,
          initialPostType: initialPostType,
          initialPostActivityType: initialPostActivityType,
          failureHandlerManager: context.read<FailureHandlerManager>(),
          userController: context.read<UserController>(),
        );
      },
      builder: (BuildContext context, ScrollController controller,
          AssociatedPostStateByUserIdState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderSelectableChips(context),
            Expanded(
              child: Builder(
                builder: (context) {
                  final helper = InfiniteLoaderCalculatorHelper(state);
                  if (helper.firstLoadInProgress) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 18)
                          .copyWith(top: 24, bottom: 50),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return renderShimmerItem(context);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return renderItemDivider(context);
                      },
                      itemCount: 100,
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<AssociatedPostByUserIdCubit>().reload();
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (helper.firstLoadError) {
                          return helper.fullPageScrollable(
                            context,
                            constraints,
                            builder: (context) {
                              return const PostLoadingError();
                            },
                          );
                        }
                        if (helper.emptyResult) {
                          return helper.fullPageScrollable(context, constraints,
                              builder: (context) {
                            return const PostLoadingEmpty();
                          });
                        }
                        return ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 24),
                          controller: controller,
                          itemCount: helper.length,
                          itemBuilder: (BuildContext context, int index) {
                            return helper.renderItem(
                              context,
                              index,
                              loadingItemBuilder: (context) {
                                return renderShimmerItem(context);
                              },
                              itemBuilder: (context) {
                                final data = state.data[index];
                                if (state.postType == PostType.COMMUNITY) {
                                  return PostStatsInfo(
                                    commentCount: data.commentCounter ?? 0,
                                    heartCount: data.reactionCounter ?? 0,
                                    viewCount: data.viewCounter ?? 0,
                                    title: data.title ?? '',
                                    subTitle: data.contentPlainText ?? '',
                                    author: data.writer?.name ?? '',
                                    created: data.updatedAt ?? DateTime.now(),
                                    imagePath: data.thumbnail?.previewUrl,
                                    showDot: false,
                                    onTap: () async {
                                      final result =
                                          await CommunityPostDetailRouteData(
                                        postId: data.id ?? 0,
                                      ).push<bool>(context);

                                      if (result == null || !context.mounted) {
                                        return;
                                      }

                                      if (result) {
                                        context
                                            .read<AssociatedPostByUserIdCubit>()
                                            .reload();
                                      }
                                    },
                                  );
                                }
                                return PostInfo(
                                  onTap: () async {
                                    final result =
                                        await CuratorPostDetailRouteData(
                                      postId: data.id ?? 0,
                                    ).push<bool>(context);

                                    if (result == null || !context.mounted) {
                                      return;
                                    }

                                    if (result) {
                                      context
                                          .read<AssociatedPostByUserIdCubit>()
                                          .reload();
                                    }
                                  },
                                  title: data.title ?? '',
                                  imagePath: data.thumbnail?.previewUrl,
                                  role: data.nameOfMainCharacter ??
                                      data.writer?.name ??
                                      '',
                                  trailing: formatDate(
                                    data.createdAt ?? DateTime.now(),
                                  ),
                                  isNetworkImage: true,
                                );
                              },
                              errorItemBuilder: (context) {
                                return const InfiniteLoadingListItemError();
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return renderItemDivider(context);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
