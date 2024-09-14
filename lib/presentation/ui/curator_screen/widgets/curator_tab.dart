import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../../application/services/category/category.dart';
import '../../../../application/services/post_curator/post_curator.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../../shared/widgets/posts/post_info.dart';
import '../../../shared/widgets/posts/post_stats_info.dart';
import '../../../utilities/date_format.dart';
import '../../community_screen/widgets/post_loading_empty.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../blocs/curator_cubit.dart';
import '../blocs/search_trigger_cubit.dart';
import 'curator_filter.dart';
import 'shimmer_curator_component.dart';

class CuratorTab extends StatefulWidget {
  const CuratorTab({
    super.key,
    required this.parentCategory,
    this.preSelectedChildCategory,
  });

  final CategoryDTO parentCategory;
  final int? preSelectedChildCategory;

  @override
  State<CuratorTab> createState() => _CuratorTabState();
}

class _CuratorTabState extends State<CuratorTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfiniteLoaderWrapper<CuratorPostCubit, CuratorState>(
      create: (BuildContext context) {
        return CuratorPostCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          initialState: CuratorState(
            selectedChildCategory: widget.preSelectedChildCategory != null
                ? {widget.preSelectedChildCategory!}
                : {},
            parentCategory: widget.parentCategory,
            availableChildCategory: widget.parentCategory.children ?? [],
          ),
          postCuratorController: context.read<PostCuratorController>(),
          loadingManager: context.read<LoadingManager>(),
          adminPostCuratorController:
              context.read<AdminPostCuratorController>(),
        );
      },
      builder: (BuildContext context, ScrollController controller,
          CuratorState state) {
        return BlocListener<SearchTriggerCubit, SearchTriggerState>(
          listener: (BuildContext context, state) {
            context.read<CuratorPostCubit>().search(state.query);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CuratorFilterBar(),
              Expanded(
                child: Builder(builder: (context) {
                  final helper = InfiniteLoaderCalculatorHelper(state);
                  if (helper.firstLoadInProgress) {
                    return const CuratorShimmerContent();
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<CuratorPostCubit>().reload();
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
                          return helper.fullPageScrollable(
                            context,
                            constraints,
                            builder: (context) {
                              return const PostLoadingEmpty();
                            },
                          );
                        }
                        return ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 18)
                              .copyWith(bottom: 100),
                          controller: controller,
                          itemCount: helper.length,
                          itemBuilder: (BuildContext context, int index) {
                            return helper.renderItem(
                              context,
                              index,
                              loadingItemBuilder: (context) {
                                return AppShimmer(
                                  child: PostInfo(
                                    title: '이혼 사실을 숨기는데 급급한 싱글맘이었어요',
                                    role: '홍준표 CEO',
                                    loading: true,
                                    trailing: formatDate(DateTime(2023, 2, 20)),
                                  ),
                                );
                              },
                              itemBuilder: (context) {
                                final data = state.data[index];
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
                                      context.read<CuratorPostCubit>().reload();
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
                                  writer: data.writer,
                                  onAction: (action) async {
                                    if (action == PostAction.delete) {
                                      context
                                          .read<CuratorPostCubit>()
                                          .deletePost(index);
                                    }
                                    if (action == PostAction.edit) {
                                      final result = await EditPostRouteData(
                                        categoryType: CategoryType.curator,
                                        postId: data.id ?? 0,
                                      ).push<bool>(context);

                                      if (!context.mounted) {
                                        return;
                                      }
                                      if (result != null && result) {
                                        context
                                            .read<CuratorPostCubit>()
                                            .reload();
                                      }
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
