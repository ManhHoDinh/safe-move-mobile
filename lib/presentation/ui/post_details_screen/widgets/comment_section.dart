import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/post_comment/post_comment.dart';
import '../../../../application/services/user/dto/src/user_dto.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/routes_gen/routes_gen.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../cubit/post_comment_cubit.dart';
import 'item_comment.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key, required this.authorId});

  final int? authorId;

  @override
  Widget build(BuildContext context) {
    final List<CommentLayout> itemComments = [
      CommentLayout(
        name: '댓글작성자',
        content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
        createdAt: DateTime(2023, 2, 20),
        isWriter: true,
        loading: true,
        isRoot: true,
        replies: [
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: false,
            loading: true,
          ),
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: true,
            loading: true,
          ),
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: false,
            loading: true,
          ),
        ],
      ),
      CommentLayout(
        name: '댓글작성자',
        content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
        createdAt: DateTime(2023, 2, 20),
        isWriter: true,
        loading: true,
        isRoot: true,
        replies: [
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: false,
            loading: true,
          ),
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: true,
            loading: true,
          ),
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: false,
            loading: true,
          ),
        ],
      ),
      CommentLayout(
        name: '댓글작성자',
        content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
        createdAt: DateTime(2023, 2, 20),
        isWriter: true,
        loading: true,
        isRoot: true,
        replies: [
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: false,
            loading: true,
          ),
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: true,
            loading: true,
          ),
          CommentLayout(
            name: '댓글작성자',
            content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
            createdAt: DateTime(2023, 2, 20),
            isWriter: false,
            loading: true,
          ),
        ],
      ),
      CommentLayout(
        name: '댓글작성자',
        content: '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
        createdAt: DateTime(2023, 2, 20),
        isWriter: false,
        loading: true,
        isRoot: true,
      )
    ];
    return InfiniteLoaderUnControlledWrapper<PostCommentCubit,
        PostCommentState>.value(
      value: context.read<PostCommentCubit>(),
      builder: (context, state) {
        final helper = InfiniteLoaderCalculatorHelper(state);
        if (helper.firstLoadInProgress) {
          return AppShimmer(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CommentItemWrapper(
                  child: itemComments[index],
                );
              },
              itemCount: itemComments.length,
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            if (helper.firstLoadError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    S.of(context).someThingWentWrong,
                  ),
                ),
              );
            }
            if (helper.emptyResult) {
              return const SizedBox.shrink();
            }
            return ListView.builder(
              itemCount: helper.length,
              itemBuilder: (BuildContext context, int index) {
                return helper.renderItem(
                  context,
                  index,
                  loadingItemBuilder: (context) {
                    return CommentItemWrapper(
                      child: CommentLayout(
                        name: '댓글작성자',
                        content:
                            '댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용',
                        createdAt: DateTime(2023, 2, 20),
                        isWriter: false,
                        loading: true,
                        isRoot: true,
                      ),
                    );
                  },
                  itemBuilder: (context) {
                    final data = state.data[index];
                    final authority = <ItemCommentAction>{};
                    final isCommentAuthor = data.user?.id ==
                        context.read<UserCubit>().state.detail?.id;
                    final currentRole =
                        context.read<UserCubit>().state.detail?.role;
                    final isAdmin =
                        currentRole != null && currentRole != Role.member;

                    if (isAdmin) {
                      authority.add(ItemCommentAction.delete);
                    } else if (isCommentAuthor) {
                      authority.add(ItemCommentAction.edit);
                      authority.add(ItemCommentAction.delete);
                    } else {
                      authority.add(ItemCommentAction.report);
                    }

                    return CommentItemWrapper(
                      child: CommentLayout(
                        highLight: state.replyingIndex == index ||
                            state.editing?.id == data.id,
                        availableActions: authority,
                        onAction: (action) async {
                          if (action == ItemCommentAction.delete) {
                            context
                                .read<PostCommentCubit>()
                                .deleteComment(index);
                          }
                          if (action == ItemCommentAction.edit) {
                            context.read<PostCommentCubit>().setEdit(
                                ChildCommentResponse.fromComment(data), index);
                          }
                          if (action == ItemCommentAction.report) {
                            final agreed = await ConfirmRouteData(
                                    content: S
                                        .of(context)
                                        .areYouSureToReportThisComment)
                                .push<bool>(context);

                            if (agreed == null) {
                              return;
                            }
                            if (agreed == true && context.mounted) {
                              context
                                  .read<PostCommentCubit>()
                                  .reportComment(index);
                            }
                          }
                        },
                        imageUrl: data.user?.avatarUrl,
                        name: data.user?.name ?? '',
                        content: data.content ?? '',
                        createdAt: data.createdAt ?? DateTime.now(),
                        isWriter: data.user?.id == authorId && authorId != null,
                        isRoot: true,
                        onReplyPressed: () {
                          context
                              .read<PostCommentCubit>()
                              .setReply(data, index);
                        },
                        replies: (data.childComments ?? [])
                            .asMap()
                            .entries
                            .map((entries) {
                          final e = entries.value;
                          final childIndex = entries.key;
                          final authority = <ItemCommentAction>{};
                          final isSubCommentAuthor = e.user?.id ==
                              context.read<UserCubit>().state.detail?.id;

                          if (isAdmin) {
                            authority.add(ItemCommentAction.delete);
                          } else if (isSubCommentAuthor) {
                            authority.add(ItemCommentAction.edit);
                            authority.add(ItemCommentAction.delete);
                          } else {
                            authority.add(ItemCommentAction.report);
                          }
                          return CommentLayout(
                            highLight: state.editing?.id == e.id,
                            availableActions: authority,
                            onAction: (action) async {
                              if (action == ItemCommentAction.delete) {
                                context.read<PostCommentCubit>().deleteComment(
                                    childIndex,
                                    parentIndex: index);
                              }
                              if (action == ItemCommentAction.edit) {
                                context
                                    .read<PostCommentCubit>()
                                    .setEdit(e, childIndex, parentIndex: index);
                              }
                              if (action == ItemCommentAction.report) {
                                final agreed = await ConfirmRouteData(
                                        content: S
                                            .of(context)
                                            .areYouSureToReportThisComment)
                                    .push<bool>(context);

                                if (agreed == null) {
                                  return;
                                }
                                if (agreed == true && context.mounted) {
                                  context
                                      .read<PostCommentCubit>()
                                      .reportComment(childIndex,
                                          parentIndex: index);
                                }
                              }
                            },
                            imageUrl: e.user?.avatarUrl,
                            name: e.user?.name ?? '',
                            content: e.content ?? '',
                            createdAt: e.createdAt ?? DateTime.now(),
                            isWriter:
                                e.user?.id == authorId && authorId != null,
                          );
                        }).toList(),
                      ),
                    );
                  },
                  errorItemBuilder: (context) {
                    return const InfiniteLoadingListItemError();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

class CommentItemWrapper extends StatelessWidget {
  const CommentItemWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 10),
          child: child,
        ),
        Divider(
          height: 32,
          thickness: 1,
          color: AppColors.gray.shade100,
        ),
      ],
    );
  }
}

class CommentLayout extends StatelessWidget {
  const CommentLayout({
    super.key,
    this.imageUrl,
    required this.name,
    required this.createdAt,
    required this.content,
    required this.isWriter,
    this.replies = const [],
    this.loading = false,
    this.isRoot = false,
    this.onReplyPressed,
    this.availableActions,
    this.onAction,
    this.highLight = false,
  });

  final String? imageUrl;
  final String name;
  final DateTime createdAt;
  final String content;
  final bool isWriter;
  final List<CommentLayout> replies;
  final bool loading;
  final bool isRoot;
  final VoidCallback? onReplyPressed;
  final Set<ItemCommentAction>? availableActions;
  final ValueChanged<ItemCommentAction>? onAction;
  final bool highLight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemComment(
          availableActions: availableActions ?? {},
          onAction: onAction,
          imageUrl: imageUrl,
          name: name,
          content: content,
          createdAt: createdAt,
          isWriter: isWriter,
          isRoot: isRoot,
          loading: loading,
          onReplyPressed: onReplyPressed,
          highLight: highLight,
        ),
        if (replies.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 16),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return replies[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemCount: replies.length,
            ),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}
