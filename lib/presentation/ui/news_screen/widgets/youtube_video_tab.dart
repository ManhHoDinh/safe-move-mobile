import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../router/router_config/router_config.dart';
import '../../../router/router_config/routes/news_branch/news_branch.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../community_screen/widgets/post_loading_empty.dart';
import '../../community_screen/widgets/post_loading_error.dart';
import '../../curator_screen/blocs/search_trigger_cubit.dart';
import '../blocs/youtube_video_internal_cubit.dart';
import 'video_item.dart';
import 'youtube_video_filter.dart';

class YoutubeVideoTab extends StatefulWidget {
  const YoutubeVideoTab({super.key});

  @override
  State<YoutubeVideoTab> createState() => _YoutubeVideoTabState();
}

class _YoutubeVideoTabState extends State<YoutubeVideoTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<YoutubeVideoInternalCubit>(
      create: (BuildContext context) {
        return YoutubeVideoInternalCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          loadingManager: context.read<LoadingManager>(),
          youtubeVideoController: context.read<YoutubeVideoController>(),
        );
      },
      child: BlocListener<SearchTriggerCubit, SearchTriggerState>(
        listener: (BuildContext context, SearchTriggerState state) {
          context.read<YoutubeVideoInternalCubit>().search(state.query);
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
                child: const YoutubeVideoFilter(),
              ),
              Expanded(
                child: InfiniteLoaderWrapper<YoutubeVideoInternalCubit,
                    YoutubeVideoInternalState>.value(
                  value: context.read<YoutubeVideoInternalCubit>(),
                  builder: (context, controller, state) {
                    final helper = InfiniteLoaderCalculatorHelper(state);
                    if (helper.firstLoadInProgress) {
                      return AppShimmer(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 18)
                              .copyWith(bottom: 20),
                          itemBuilder: (context, index) {
                            return const VideoItem(
                              loading: true,
                              title: '이혼 사실을 숨기는데 급급한 싱글맘이었어요',
                            );
                          },
                          itemCount: 100,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<YoutubeVideoInternalCubit>().reload();
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
                              .copyWith(bottom: 20),
                          itemBuilder: (context, index) {
                            return helper.renderItem(context, index,
                                loadingItemBuilder: (context) {
                              return const AppShimmer(
                                child: VideoItem(
                                  loading: true,
                                  title: '이혼 사실을 숨기는데 급급한 싱글맘이었어요',
                                ),
                              );
                            }, itemBuilder: (context) {
                              final data = state.data[index];
                              return VideoItem(
                                onTap: () async {
                                  // appLaunchUrl(
                                  //     formatYoutubeUrl(
                                  //         data.snippet?.resourceId?.videoId ?? ''),
                                  //     context);
                                  YoutubePostDetailRouteData(
                                    postId: data.id ?? 0,
                                  ).push(context);
                                },
                                title: data.title ?? '',
                                thumbnail: data.thumbnail?.previewUrl,
                              );
                            }, errorItemBuilder: (context) {
                              return const InfiniteLoadingListItemError();
                            });
                          },
                          itemCount: helper.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
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
