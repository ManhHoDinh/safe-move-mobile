import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../application/services/category/category.dart';
import '../../../application/services/common/common.dart';
import '../../../application/services/post_comment/controller/controller.dart';
import '../../../application/services/post_community/post_community.dart';
import '../../../application/services/post_curator/post_curator.dart';
import '../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../application/services/user/user.dart';
import '../../../application/services/user_post_reaction/controller/controller.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/auth_cubit/auth_cubit.dart';
import '../../bases/user_cubit/user_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../router/router_config/routes/news_branch/news_branch.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../../shared/widgets/posts/post_stats_info.dart';
import '../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../utilities/category_name_resolver.dart';
import '../../utilities/share_link.dart';
import '../community_screen/widgets/post_loading_error.dart';
import 'cubit/post_comment_cubit.dart';
import 'cubit/post_detail_cubit.dart';
import 'widgets/comment_compose_section.dart';
import 'widgets/comment_count.dart';
import 'widgets/comment_section.dart';
import 'widgets/post_section.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    super.key,
    required this.postId,
    required this.postType,
  });

  final int postId;
  final PostType postType;

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.watch<UserCubit>().state.detail?.id;
    return BlocProvider<PostDetailsCubit>(
      create: (BuildContext context) {
        return PostDetailsCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          postType: postType,
          postSgmNewsController: context.read<PostSgmNewsController>(),
          postCuratorController: context.read<PostCuratorController>(),
          postCommunityController: context.read<PostCommunityController>(),
          id: postId,
          userPostReactionController:
              context.read<UserPostReactionController>(),
          loadingManager: context.read<LoadingManager>(),
          adminPostCuratorController:
              context.read<AdminPostCuratorController>(),
          adminPostSgmNewsController:
              context.read<AdminPostSgmNewsController>(),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(actions: [
          Builder(builder: (context) {
            final postDetailState = context.watch<PostDetailsCubit>().state;
            return AppIconButton(
              icon: Assets.svgs.uploadIcon.svg(),
              onTap: () async {
                String appLink = '';
                switch (postType) {
                  case PostType.COMMUNITY:
                    appLink =
                        CommunityPostDetailRouteData(postId: postId).location;
                    break;
                  case PostType.CURATOR:
                    appLink =
                        CuratorPostDetailRouteData(postId: postId).location;
                    break;
                  case PostType.SGM_NEWS:
                    appLink = NewsPostDetailRouteData(postId: postId).location;
                    break;
                }
                final result = await shareLink(appLink, context,
                    postDetailState.postResponse?.title ?? '');
                if (result != null && result && context.mounted) {
                  final AppSnackBar snackBar =
                      AppSnackBar(title: S.of(context).shareSuccessfully);
                  snackBar.showSnackBar(context);
                }
              },
            );
          }),
          Builder(builder: (context) {
            final userState = context.watch<UserCubit>().state;
            final postDetailState = context.watch<PostDetailsCubit>().state;
            return BlocListener<PostDetailsCubit, PostsDetailsState>(
                listener: (BuildContext context, state) {
                  if (state.postDeleted) {
                    context.pop(true);
                  }
                },
                child: postDetailState.apiStatus == ApiStatus.success &&
                        (userState.detail?.id ==
                                postDetailState.postResponse?.writer?.id ||
                            userState.detail?.role == Role.system ||
                            userState.detail?.role == Role.admin)
                    ? AppIconButton(
                        icon: Assets.svgs.dotsHorizontalIcon.svg(),
                        onTap: () async {
                          final returnData = await DropdownSheetRouteData(
                            $extra: [
                              if (postDetailState.postResponse?.writer?.id ==
                                  userState.detail?.id)
                                DropDownBarData(
                                  value: PostAction.edit,
                                  title: S.of(context).edit,
                                  textStyle: Styles.s13(),
                                ),
                              if (postDetailState.postResponse?.writer?.id ==
                                      userState.detail?.id ||
                                  userState.detail?.role == Role.admin ||
                                  userState.detail?.role == Role.system)
                                DropDownBarData(
                                  value: PostAction.delete,
                                  title: S.of(context).delete,
                                  textStyle:
                                      Styles.s13().withColor(AppColors.red),
                                ),
                            ],
                          ).push<PostAction>(context);
                          if (returnData == null || !context.mounted) {
                            return;
                          }
                          if (returnData == PostAction.delete) {
                            context.read<PostDetailsCubit>().deletePost();
                          }
                          if (returnData == PostAction.edit) {
                            final result = await EditPostRouteData(
                              categoryType: postType == PostType.SGM_NEWS
                                  ? CategoryType.sgmNews
                                  : postType == PostType.COMMUNITY
                                      ? CategoryType.community
                                      : CategoryType.curator,
                              postId: postId,
                            ).push<bool>(context);

                            if (!context.mounted) {
                              return;
                            }
                            if (result != null && result) {
                              context.read<PostDetailsCubit>().reload();
                            }
                          }
                        },
                      )
                    : ((postType == PostType.COMMUNITY)
                        ? AppIconButton(
                            icon: Assets.svgs.dotsHorizontalIcon.svg(),
                            onTap: () async {
                              final returnData = await DropdownSheetRouteData(
                                $extra: [
                                  DropDownBarData(
                                    value: PostAction.report,
                                    title: S.of(context).report,
                                    textStyle:
                                        Styles.s13().withColor(AppColors.red),
                                  ),
                                ],
                              ).push<PostAction>(context);
                              if (returnData == null || !context.mounted) {
                                return;
                              }
                              if (returnData == PostAction.report) {
                                final agreed = await ConfirmRouteData(
                                        content: S
                                            .of(context)
                                            .areYouSureToReportThisPost)
                                    .push<bool>(context);

                                if (agreed == null) {
                                  return;
                                }
                                if (agreed == true && context.mounted) {
                                  context.read<PostDetailsCubit>().reportPost();
                                }
                              }
                            },
                          )
                        : Container()));
          }),
        ]),
        body: BlocBuilder<PostDetailsCubit, PostsDetailsState>(
          builder: (context, state) {
            final apiStatus = state.apiStatus;
            if (apiStatus == ApiStatus.fail) {
              return const PostLoadingError();
            }
            if (apiStatus == ApiStatus.loading) {
              return AppShimmer(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: PostSection(
                    loading: true,
                    postType: postType,
                  ),
                ),
              );
            }
            return BlocProvider<PostCommentCubit>(
              create: (BuildContext context) {
                return PostCommentCubit(
                  controller: context.read<PostCommentController>(),
                  failureHandlerManager: context.read<FailureHandlerManager>(),
                  postId: postId,
                  loadingManager: context.read<LoadingManager>(),
                  postSgmNewsController: context.read<PostSgmNewsController>(),
                  postCuratorController: context.read<PostCuratorController>(),
                  postCommunityController:
                      context.read<PostCommunityController>(),
                  postType: postType,
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
                    child: RefreshIndicator(
                      notificationPredicate: (notification) {
                        return notification.depth == 1;
                      },
                      onRefresh: () async {
                        context.read<PostDetailsCubit>().reload();
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: NestedScrollView(
                              headerSliverBuilder: (context, isInnerScrolled) =>
                                  [
                                SliverToBoxAdapter(
                                  child: PostSection(
                                    postType: postType,
                                    thumbnailUrl: state
                                        .postResponse?.thumbnail?.previewUrl,
                                    quillContent: state.postResponse?.content,
                                    mainCategory: resolveSubCategoryName(
                                      context,
                                      state.postResponse?.category?.parent,
                                    ),
                                    subCategory: resolvePostCategoryName(
                                      context,
                                      state.postResponse?.category,
                                    ),
                                    avatarUrl:
                                        state.postResponse?.writer?.avatarUrl,
                                    author: state.postResponse?.writer?.name,
                                    createdAt: state.postResponse?.createdAt,
                                    onProfilePressed: () {
                                      ProfileDetailsRouteData(
                                              userId: state.postResponse?.writer
                                                      ?.id ??
                                                  0)
                                          .push(context);
                                    },
                                    showProfileNavButton:
                                        currentUserId != null &&
                                            currentUserId !=
                                                state.postResponse?.writer?.id,
                                    postTitle: state.postResponse?.title,
                                    onReact: () {
                                      context
                                          .read<PostDetailsCubit>()
                                          .reactToggle();
                                    },
                                    reacted: state.isReacted,
                                    favoriteCount: state.reactionCount,
                                    seenCount:
                                        state.postResponse?.viewCounter ?? 0,
                                    shouldShowReactionButton: context
                                        .watch<AuthCubit>()
                                        .state is AuthStatusLoggedInState,
                                  ),
                                ),
                                SliverPersistentHeader(
                                  pinned: true,
                                  delegate:
                                      CommentCountPersistentHeaderDelegate(),
                                ),
                              ],
                              body: CommentSection(
                                authorId: state.postResponse?.writer?.id,
                              ),
                            ),
                          ),
                          if (context.watch<AuthCubit>().state
                              is AuthStatusLoggedInState)
                            const CommentComposeSection()
                          else
                            const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
