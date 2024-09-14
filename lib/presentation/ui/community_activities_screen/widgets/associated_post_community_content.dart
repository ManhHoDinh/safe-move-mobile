import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/user.dart';
import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../../shared/widgets/item_divider.dart';
import '../../../shared/widgets/login_required_blockage/login_required_blockage.dart';
import '../../../shared/widgets/posts/post_stats_info.dart';
import '../../community_screen/widgets/post_loading_empty.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../blocs/associated_post_cubit.dart';

class AssociatedPostCommunityContent extends StatelessWidget {
  const AssociatedPostCommunityContent({
    super.key,
    required this.type,
  });

  final AssociatedPostType type;

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    if (authState is AuthStatusLoggedOutState) {
      return const LoginRequiredNotificationContent();
    }
    final shimmerItem = AppShimmer(
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
    return InfiniteLoaderWrapper<AssociatedPostCubit, AssociatedPostState>(
      create: (context) {
        return AssociatedPostCubit(
            postType: type,
            failureHandlerManager: context.read<FailureHandlerManager>(),
            userController: context.read<UserController>());
      },
      builder: (BuildContext context, ScrollController controller,
          AssociatedPostState state) {
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
            context.read<AssociatedPostCubit>().reload();
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
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(top: 24, bottom: 100),
                controller: controller,
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
                          final result = await CommunityPostDetailRouteData(
                            postId: data.id ?? 0,
                          ).push<bool>(context);

                          if (result == null || !context.mounted) {
                            return;
                          }

                          if (result) {
                            context.read<AssociatedPostCubit>().reload();
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
