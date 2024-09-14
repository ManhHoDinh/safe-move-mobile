import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/admin_post_curator/admin_post_curator.dart';
import '../../../application/services/admin_post_sgm_news/admin_post_sgm_news.dart';
import '../../../application/services/app/post_history/post_manager.dart';
import '../../../application/services/category/category.dart';
import '../../../application/services/file/controller/controller.dart';
import '../../../application/services/post_community/post_community.dart';
import '../../../application/services/post_curator/post_curator.dart';
import '../../../application/services/post_sgm_news/post_sgm_news.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/locale_cubit/locale_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/routes_gen/routes_gen.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/item_divider.dart';
import 'blocs/create_post_cubit.dart';
import 'blocs/create_post_state.dart';
import 'widgets/select_category.dart';
import 'widgets/select_language_section.dart';
import 'widgets/thumbnail_title_section.dart';
import 'widgets/toolbar_quill_section.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, required this.categoryType, this.postId});

  final CategoryType categoryType;
  final int? postId;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final QuillController controller = QuillController.basic();
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 1000.0,
  );
  final FocusNode _focusNode = FocusNode();
  bool _isEditorFocused = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isEditorFocused = _focusNode.hasFocus;
      });
    });
  }

  Widget _loadingShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatePostCubit>(
        lazy: false,
        create: (BuildContext context) {
          return CreatePostCubit(
            postCuratorController: context.read<PostCuratorController>(),
            postSgmNewsController: context.read<PostSgmNewsController>(),
            adminPostSgmNewsController:
                context.read<AdminPostSgmNewsController>(),
            adminPostCuratorController:
                context.read<AdminPostCuratorController>(),
            postCommunityController: context.read<PostCommunityController>(),
            fileController: context.read<FileController>(),
            categoryController: context.read<CategoryController>(),
            failureHandlerManager: context.read<FailureHandlerManager>(),
            loadingManager: context.read<LoadingManager>(),
            categoryType: widget.categoryType,
            postId: widget.postId,
            postManager: context.read<PostManager>(),
          );
        },
        child: BlocListener<CreatePostCubit, CreatePostState>(
          listenWhen: (prev, curr) {
            return prev.createPostFlowCompleted !=
                    curr.createPostFlowCompleted ||
                prev.contentPost != curr.contentPost;
          },
          listener: (BuildContext context, CreatePostState state) async {
            _focusNode.unfocus();
            await Future.delayed(const Duration(milliseconds: 50));
            if (state.createPostFlowCompleted && context.mounted) {
              context.pop(true);
            }
            if (state.contentPost != null) {
              controller.document = state.contentPost!;
            }
          },
          child: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: CommonAppBar(
                  actions: [
                    if (widget.postId != null)
                      const SizedBox.shrink()
                    else
                      BlocBuilder<CreatePostCubit, CreatePostState>(
                          builder: (context, state) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {
                            final encoded = jsonEncode(
                              controller.document.toDelta().toJson(),
                            );

                            context
                                .read<CreatePostCubit>()
                                .onSavePostToLocalStorage(encoded, context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              S.of(context).temporaryStorage,
                              style: Styles.s13()
                                  .withWeight(FontWeight.w500)
                                  .withLetterSpacing(-2.5 / 100)
                                  .withColor(AppColors.text.common),
                            ),
                          ),
                        );
                      }),
                    BlocBuilder<CreatePostCubit, CreatePostState>(
                        buildWhen: (prev, curr) {
                      return prev.canCreatePost != curr.canCreatePost;
                    }, builder: (context, state) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: state.canCreatePost
                            ? () async {
                                final agreed = await ConfirmRouteData(
                                        content: S
                                            .of(context)
                                            .wouldYouLikeUploadPost)
                                    .push<bool>(context);

                                if (agreed == null) {
                                  return;
                                }
                                if (agreed == true && context.mounted) {
                                  final encoded = jsonEncode(
                                    controller.document.toDelta().toJson(),
                                  );

                                  widget.postId != null
                                      ? context
                                          .read<CreatePostCubit>()
                                          .onUpdatePost(
                                            encoded,
                                            controller.document
                                                .toPlainText()
                                                .replaceAll(
                                                    Embed
                                                        .kObjectReplacementCharacter,
                                                    '')
                                                .replaceAll('\n', ''),
                                            isDraft: false,
                                          )
                                      : context
                                          .read<CreatePostCubit>()
                                          .onCreatePost(
                                            encoded,
                                            controller.document
                                                .toPlainText()
                                                .replaceAll(
                                                    Embed
                                                        .kObjectReplacementCharacter,
                                                    '')
                                                .replaceAll('\n', ''),
                                            isDraft: false,
                                          );
                                }
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.postId != null
                                ? S.of(context).save
                                : S.of(context).registration,
                            style: Styles.s13()
                                .withWeight(FontWeight.w500)
                                .withLetterSpacing(-2.5 / 100)
                                .withColor(state.canCreatePost
                                    ? AppColors.blue.shade500
                                    : AppColors.gray.shade600),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                body: BlocBuilder<CreatePostCubit, CreatePostState>(
                    builder: (context, state) {
                  return state.postDetailLoadingStatus == ApiStatus.success
                      ? Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                reverse: true,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SelectLanguage(),
                                    const ItemDivider(
                                      thickness: 1,
                                      padding: EdgeInsets.zero,
                                    ),
                                    if (widget.categoryType ==
                                        CategoryType.sgmNews)
                                      const SizedBox.shrink()
                                    else
                                      const SelectCategory(),
                                    const ThumbnailTitleSection(),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: AppColors.gray.shade700,
                                          ),
                                        ),
                                      ),
                                      child: QuillEditor.basic(
                                        focusNode: _focusNode,
                                        configurations:
                                            QuillEditorConfigurations(
                                          showCursor: true,
                                          placeholder: S.of(context).content,
                                          isOnTapOutsideEnabled: false,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 8),
                                          controller: controller,
                                          minHeight: 600,
                                          scrollable: false,
                                          scrollPhysics:
                                              const NeverScrollableScrollPhysics(),
                                          sharedConfigurations:
                                              QuillSharedConfigurations(
                                            locale: context
                                                .watch<LocaleCubit>()
                                                .state,
                                          ),
                                          embedBuilders: FlutterQuillEmbeds
                                              .editorBuilders(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_isEditorFocused)
                              SafeArea(
                                  top: false,
                                  child: ToolbarQuillSection(
                                    controller: controller,
                                    contextCreatePost: context,
                                  ))
                          ],
                        )
                      : AppShimmer(child: _loadingShimmer());
                }),
              ),
            );
          }),
        ));
  }
}
// ToolbarQuillSection(controller: controller)
