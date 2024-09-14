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
import '../../../shared/widgets/login_required_blockage/login_required_blockage.dart';
import '../../../shared/widgets/posts/post_info.dart';
import '../../../utilities/date_format.dart';
import '../../community_screen/widgets/post_loading_empty.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../blocs/associated_post_cubit.dart';

class AssociatedPostCuratorContent extends StatelessWidget {
  const AssociatedPostCuratorContent({
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
      child: PostInfo(
        loading: true,
        title: '나의 변화가 무기가 되는 사업. 주저하기엔 너무 아깝다고 생각합니다',
        role: '홍준표 CEO',
        onTap: () {},
        trailing: formatDate(DateTime(2023, 2, 20)),
      ),
    );
    return InfiniteLoaderWrapper<AssociatedPostCubit, AssociatedPostState>(
      create: (context) {
        return AssociatedPostCubit(
          postType: type,
          failureHandlerManager: context.read<FailureHandlerManager>(),
          userController: context.read<UserController>(),
        );
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
              return const SizedBox(
                height: 12,
              );
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
                      return PostInfo(
                        onTap: () async {
                          final result = await CuratorPostDetailRouteData(
                            postId: data.id ?? 0,
                          ).push<bool>(context);

                          if (result == null || !context.mounted) {
                            return;
                          }

                          if (result) {
                            context.read<AssociatedPostCubit>().reload();
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
                  return const SizedBox(
                    height: 12,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
