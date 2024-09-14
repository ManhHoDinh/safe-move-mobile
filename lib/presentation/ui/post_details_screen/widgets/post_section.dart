import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_embeds.dart';

import '../../../../application/services/common/common.dart';
import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../shared/theme/src/app_style.dart';
import 'number_react_section.dart';
import 'post_type_section.dart';
import 'writer_info_section.dart';

class PostSection extends StatefulWidget {
  const PostSection({
    super.key,
    this.loading = false,
    this.quillContent,
    this.mainCategory,
    this.subCategory,
    this.avatarUrl,
    this.author,
    this.createdAt,
    this.onProfilePressed,
    this.showProfileNavButton = true,
    this.postTitle,
    this.onReact,
    this.favoriteCount = 0,
    this.reacted = false,
    this.seenCount = 0,
    this.shouldShowReactionButton = false,
    this.thumbnailUrl,
    required this.postType,
  });

  final bool loading;
  final String? quillContent;
  final String? mainCategory;
  final String? subCategory;
  final String? avatarUrl;
  final String? author;
  final String? thumbnailUrl;
  final DateTime? createdAt;
  final VoidCallback? onProfilePressed;
  final bool showProfileNavButton;
  final String? postTitle;
  final VoidCallback? onReact;
  final bool reacted;
  final int seenCount;
  final int favoriteCount;
  final bool shouldShowReactionButton;
  final PostType postType;

  @override
  State<PostSection> createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {
  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    if (widget.quillContent != null) {
      final json = jsonDecode(widget.quillContent!.replaceAll('px', ''));

      _controller.document = Document.fromJson(json as List<dynamic>);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18)
          .copyWith(top: 8)
          .copyWith(bottom: 16),
      color: widget.loading ? Colors.transparent : AppColors.gray.shade70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PostTypeSection(
            category: widget.mainCategory,
            classification: widget.subCategory,
            loading: widget.loading,
          ),
          if (widget.postType == PostType.COMMUNITY)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: WriterInfoSection(
                loading: widget.loading,
                imageUrl: widget.avatarUrl,
                nameWriter: widget.author,
                createdAt: widget.createdAt,
                onProfilePressed: widget.onProfilePressed,
                showDetailsNav: widget.showProfileNavButton,
              ),
            )
          else
            const SizedBox.shrink(),
          const SizedBox(height: 32),
          if (widget.loading)
            Container(
              height: 28 * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black,
              ),
            )
          else
            SelectableText(
              widget.postTitle ?? '',
              style: Styles.s18()
                  .withWeight(FontWeight.w800)
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.main),
            ),

          if (widget.loading)
            const SizedBox.shrink()
          else if (widget.thumbnailUrl != null)
            GestureDetector(
              onLongPress: () async {
                await Clipboard.setData(
                    ClipboardData(text: widget.thumbnailUrl!));
              },
              child: Image.network(
                widget.thumbnailUrl!,
              ),
            ),
          //Content post (pending)

          if (widget.loading)
            Container(
              height: 1000,
              color: Colors.black,
            ),
          LayoutBuilder(builder: (context, constrain) {
            return SizedBox(
              width: constrain.maxWidth,
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  isOnTapOutsideEnabled: false,
                  showCursor: false,
                  controller: _controller,
                  readOnly: true,
                  sharedConfigurations: QuillSharedConfigurations(
                    locale: context.watch<LocaleCubit>().state,
                  ),
                  embedBuilders: FlutterQuillEmbeds.editorBuilders(),
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          NumberReactSection(
            loading: widget.loading,
            seen: widget.seenCount,
            favorite: widget.favoriteCount,
            isFavorited: widget.reacted,
            onFavorited: widget.onReact,
            shouldShowReactionButton: widget.shouldShowReactionButton,
          ),
        ],
      ),
    );
  }
}
