import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/user.dart';
import '../../../../application/services/user_follow/controller/controller.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../blocs/follow_cubit.dart';
import '../blocs/follow_state.dart';
import 'shimmer_follow_item.dart';
import 'user_follow_item.dart';

class FollowList extends StatefulWidget {
  const FollowList({
    super.key,
    required this.title,
    required this.followType,
  });

  final String Function(BuildContext context) title;
  final FollowType followType;

  @override
  State<FollowList> createState() => _FollowListState();
}

class _FollowListState extends State<FollowList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfiniteLoaderWrapper<FollowCubit, FollowState>(
      create: (BuildContext context) {
        return FollowCubit(
          initialState: FollowState(followType: widget.followType),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          userController: context.read<UserController>(),
          followController: context.read<UserFollowController>(),
          loadingManager: context.read<LoadingManager>(),
        );
      },
      builder: (BuildContext context, ScrollController controller,
          FollowState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text(
                      widget.title.call(context),
                      style: Styles.s15()
                          .withWeight(FontWeight.w600)
                          .withLetterSpacing(-2.5 / 100),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '(${state.currentItemCount})',
                      style: Styles.s15()
                          .withHeight(24 / 15)
                          .withLetterSpacing(-2.5 / 100),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Builder(builder: (context) {
                  final helper = InfiniteLoaderCalculatorHelper(state);
                  if (helper.firstLoadInProgress) {
                    return const FollowShimmerContent();
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<FollowCubit>().reload();
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
                        return ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 10),
                          controller: controller,
                          itemCount: helper.length,
                          itemBuilder: (BuildContext context, int index) {
                            return helper.renderItem(
                              context,
                              index,
                              loadingItemBuilder: (context) {
                                return const AppShimmer(
                                  child: UserFollowItem(
                                    imageUrl: '',
                                    userName: 'User name',
                                    loading: true,
                                  ),
                                );
                              },
                              itemBuilder: (context) {
                                final data = state.data[index];
                                return UserFollowItem(
                                  onTapUnfollow: state.followType ==
                                          FollowType.following
                                      ? () {
                                          context
                                              .read<FollowCubit>()
                                              .unfollow(data.id ?? 0, index);
                                        }
                                      : null,
                                  onTapItem: () {
                                    ProfileDetailsRouteData(
                                            userId: data.id ?? 0)
                                        .push(context);
                                  },
                                  imageUrl: data.avatarUrl,
                                  userName: data.name ?? '',
                                );
                              },
                              errorItemBuilder: (context) {
                                return const InfiniteLoadingListItemError();
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 12);
                          },
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
