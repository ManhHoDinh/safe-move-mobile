import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../../application/services/category/category.dart';
import '../../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../router/router_config/router_config.dart';
import '../../../router/router_config/routes/news_branch/news_branch.dart';
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
import '../../curator_screen/blocs/search_trigger_cubit.dart';
import '../blocs/photo_gallery_cubit.dart';
import 'photo_gallery_filter.dart';

class PhotoGalleryTab extends StatefulWidget {
  const PhotoGalleryTab({super.key});

  @override
  State<PhotoGalleryTab> createState() => _PhotoGalleryTabState();
}

class _PhotoGalleryTabState extends State<PhotoGalleryTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<PhotoGalleryCubit>(
      create: (BuildContext context) {
        return PhotoGalleryCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          postSgmNewsController: context.read<PostSgmNewsController>(),
          loadingManager: context.read<LoadingManager>(),
          adminPostCuratorController:
              context.read<AdminPostSgmNewsController>(),
        );
      },
      child: BlocListener<SearchTriggerCubit, SearchTriggerState>(
        listener: (BuildContext context, state) {
          context.read<PhotoGalleryCubit>().search(state.query);
        },
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                  bottom: 20,
                ),
                child: const PhotoGalleryFilter(),
              ),
              Expanded(
                child: InfiniteLoaderWrapper<PhotoGalleryCubit,
                    PhotoGalleryState>.value(
                  value: context.read<PhotoGalleryCubit>(),
                  builder: (context, controller, state) {
                    final helper = InfiniteLoaderCalculatorHelper(state);
                    if (helper.firstLoadInProgress) {
                      return AppShimmer(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 18)
                              .copyWith(bottom: 20),
                          itemBuilder: (context, index) {
                            return PostInfo(
                              loading: true,
                              title: '이혼 사실을 숨기는데 급급한 싱글맘이었어요',
                              role: '홍준표 CEO',
                              trailing: formatDate(DateTime(2023, 2, 20)),
                            );
                          },
                          itemCount: 100,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                        ),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<PhotoGalleryCubit>().reload();
                      },
                      child: LayoutBuilder(builder: (context, constraints) {
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
                          controller: controller,
                          padding: const EdgeInsets.symmetric(horizontal: 18)
                              .copyWith(bottom: 100),
                          itemBuilder: (context, index) {
                            return helper.renderItem(context, index,
                                loadingItemBuilder: (context) {
                              return AppShimmer(
                                child: PostInfo(
                                  loading: true,
                                  title: '이혼 사실을 숨기는데 급급한 싱글맘이었어요',
                                  role: '홍준표 CEO',
                                  trailing: formatDate(DateTime(2023, 2, 20)),
                                ),
                              );
                            }, itemBuilder: (context) {
                              final data = state.data[index];
                              return PostInfo(
                                onTap: () async {
                                  final result = await NewsPostDetailRouteData(
                                    postId: data.id ?? 0,
                                  ).push<bool>(context);
                                  if (result == null || !context.mounted) {
                                    return;
                                  }

                                  if (result) {
                                    context.read<PhotoGalleryCubit>().reload();
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
                                        .read<PhotoGalleryCubit>()
                                        .deletePost(index);
                                  }
                                  if (action == PostAction.edit) {
                                    final result = await EditPostRouteData(
                                      categoryType: CategoryType.sgmNews,
                                      postId: data.id ?? 0,
                                    ).push<bool>(context);

                                    if (!context.mounted) {
                                      return;
                                    }
                                    if (result != null && result) {
                                      context
                                          .read<PhotoGalleryCubit>()
                                          .reload();
                                    }
                                  }
                                },
                              );
                            }, errorItemBuilder: (context) {
                              return const InfiniteLoadingListItemError();
                            });
                          },
                          itemCount: helper.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
