import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../application/services/post_comment/post_comment.dart';
import '../../../application/services/post_community/post_community.dart';
import '../../../application/services/post_curator/post_curator.dart';
import '../../../application/services/post_sgm_news/controller/controller.dart';
import '../../../application/services/youtube_client_service/youtube_video_controller.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/auth_cubit/auth_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../router/router_config/routes/news_branch/news_branch.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../utilities/share_link.dart';
import '../community_screen/widgets/post_loading_error.dart';
import '../post_details_screen/cubit/post_comment_cubit.dart';
import '../post_details_screen/widgets/comment_compose_section.dart';
import '../post_details_screen/widgets/comment_count.dart';
import '../post_details_screen/widgets/comment_section.dart';
import 'blocs/youtube_video_comments_cubit.dart';
import 'blocs/youtube_video_details_cubit.dart';
import 'widgets/youtube_video_section.dart';

class YoutubeVideoDetailsScreen extends StatelessWidget {
  const YoutubeVideoDetailsScreen({
    super.key,
    required this.postId,
  });

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<YoutubeVideoDetailsCubit>(
      create: (BuildContext context) {
        return YoutubeVideoDetailsCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          loadingManager: context.read<LoadingManager>(),
          youtubeVideoController: context.read<YoutubeVideoController>(),
          id: postId,
        );
      },
      child: BlocBuilder<YoutubeVideoDetailsCubit, YoutubeVideoDetailsState>(
          builder: (context, state) {
        final apiStatus = state.apiStatus;
        if (apiStatus == ApiStatus.fail) {
          return const Scaffold(
            appBar: CommonAppBar(),
            body: PostLoadingError(),
          );
        }
        if (apiStatus == ApiStatus.loading) {
          return const Scaffold(
            appBar: CommonAppBar(),
            body: AppShimmer(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: YoutubeVideoSection(
                  loading: true,
                ),
              ),
            ),
          );
        }
        return BlocProvider<PostCommentCubit>(
          create: (BuildContext context) {
            return YoutubeVideoCommentCubit(
              controller: context.read<PostCommentController>(),
              failureHandlerManager: context.read<FailureHandlerManager>(),
              postId: postId,
              loadingManager: context.read<LoadingManager>(),
              postSgmNewsController: context.read<PostSgmNewsController>(),
              postCuratorController: context.read<PostCuratorController>(),
              postCommunityController: context.read<PostCommunityController>(),
              youtubeVideoController: context.read<YoutubeVideoController>(),
            );
          },
          child: Builder(
            builder: (context) {
              final editing =
                  context.watch<PostCommentCubit>().state.editing == null;
              final replying =
                  context.watch<PostCommentCubit>().state.replying == null;
              return PopScope(
                canPop: editing && replying,
                onPopInvoked: (didPop) {
                  if (didPop) {
                    return;
                  }
                  if (editing) {
                    context.read<PostCommentCubit>().unSetEdit();
                  }
                  if (replying) {
                    context.read<PostCommentCubit>().cancelReply();
                  }
                },
                child: const _YoutubeFullScreenHolder(),
              );
            },
          ),
        );
      }),
    );
  }
}

class _YoutubeFullScreenHolder extends StatefulWidget {
  const _YoutubeFullScreenHolder();

  @override
  State<_YoutubeFullScreenHolder> createState() =>
      _YoutubeFullScreenHolderState();
}

class _YoutubeFullScreenHolderState extends State<_YoutubeFullScreenHolder> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final state = context.read<YoutubeVideoDetailsCubit>().state;
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(state.youtubeResponse?.videoUrl ?? '') ??
              '',
      flags: const YoutubePlayerFlags(
        forceHD: true,
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<YoutubeVideoDetailsCubit>().state;
    return YoutubePlayerBuilder(
      builder: (context, player) {
        return Scaffold(
          appBar: CommonAppBar(actions: [
            AppIconButton(
              icon: Assets.svgs.uploadIcon.svg(),
              onTap: () async {
                final String appLink = YoutubePostDetailRouteData(
                  postId: state.youtubeResponse?.id ?? 0,
                ).location;
                final result = await shareLink(
                    appLink, context, state.youtubeResponse?.title ?? '');
                if (result != null && result && context.mounted) {
                  final AppSnackBar snackBar =
                      AppSnackBar(title: S.of(context).shareSuccessfully);
                  snackBar.showSnackBar(context);
                }
              },
            ),
          ]),
          body: RefreshIndicator(
            notificationPredicate: (notification) {
              return notification.depth == 1;
            },
            onRefresh: () async {
              context.read<YoutubeVideoDetailsCubit>().reload();
            },
            child: Column(
              children: [
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder: (context, isInnerScrolled) => [
                      SliverToBoxAdapter(
                        child: YoutubeVideoSection(
                          mainCategory: 'Youtube video',
                          player: player,
                          createdAt: state.youtubeResponse?.createdAt,
                          postTitle: state.youtubeResponse?.title,
                          onReact: () {
                            context
                                .read<YoutubeVideoDetailsCubit>()
                                .reactToggle();
                          },
                          reacted: state.isReacted,
                          favoriteCount: state.reactionCount,
                          seenCount: state.youtubeResponse?.viewCounter ?? 0,
                          shouldShowReactionButton: context
                              .watch<AuthCubit>()
                              .state is AuthStatusLoggedInState,
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: CommentCountPersistentHeaderDelegate(),
                      ),
                    ],
                    body: const CommentSection(
                      authorId: null,
                    ),
                  ),
                ),
                if (context.watch<AuthCubit>().state is AuthStatusLoggedInState)
                  const CommentComposeSection()
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.blue.shade500,
        progressColors: ProgressBarColors(
          playedColor: AppColors.blue.shade500,
          handleColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
