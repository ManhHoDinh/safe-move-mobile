import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../cubit/post_comment_cubit.dart';

class CommentComposeSection extends StatefulWidget {
  const CommentComposeSection({super.key});

  @override
  State<CommentComposeSection> createState() => _CommentComposeSectionState();
}

class _CommentComposeSectionState extends State<CommentComposeSection> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_textControllerTicked);
  }

  @override
  void dispose() {
    _controller.removeListener(_textControllerTicked);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _textControllerTicked() {
    setState(() {});
  }

  bool get canSubmit {
    return _controller.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final replyingTo = context.watch<PostCommentCubit>().state.replying;
    final editing = context.watch<PostCommentCubit>().state.editing;
    return BlocListener<PostCommentCubit, PostCommentState>(
      listener: (BuildContext context, state) {
        if (state.needEditContentSync) {
          context.read<PostCommentCubit>().synced();
          _controller.text = state.editing?.content ?? '';
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18)
            .copyWith(top: 10, bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.gray.shade70,
          border: Border(
            top: BorderSide(
              color: AppColors.gray.shade200,
            ),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (editing != null)
                _ExtraActionTitle(
                  title: S.of(context).editingComment,
                  onTap: () {
                    context.read<PostCommentCubit>().unSetEdit();
                  },
                )
              else
                const SizedBox.shrink(),
              if (replyingTo != null)
                _ExtraActionTitle(
                  title: '${S.of(context).replyingTo}${replyingTo.user?.name}',
                  onTap: () {
                    context.read<PostCommentCubit>().cancelReply();
                  },
                )
              else
                const SizedBox.shrink(),
              CommonTextField(
                textEditingController: _controller,
                focusNode: _focusNode,
                minLines: 1,
                maxLines: 3,
                hintText: S.of(context).leaveAComment,
                useClearIcon: false,
                suffix: canSubmit
                    ? Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            context
                                .read<PostCommentCubit>()
                                .submitComment(_controller.text);
                            _controller.text = '';
                            _focusNode.unfocus();
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                            child: Assets.svgs.sendCommentIcon.svg(),
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExtraActionTitle extends StatelessWidget {
  const _ExtraActionTitle({
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Styles.s12(),
            ),
            const SizedBox(width: 10),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: onTap,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    S.of(context).cancel,
                    style: Styles.s12()
                        .withColor(AppColors.blue.shade500)
                        .withWeight(FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
