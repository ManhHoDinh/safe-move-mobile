import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../shared/widgets/gap_items.dart';
import '../../../shared/widgets/select_image_sheet/select_image_sheet.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../../../shared/widgets/textfields/ouline_button_textfield.dart';
import '../blocs/social_media_content_cubit.dart';
import '../blocs/social_media_content_state.dart';

class SocialMediaContentList extends StatefulWidget {
  const SocialMediaContentList({super.key});

  @override
  State<SocialMediaContentList> createState() => _SocialMediaContentListState();
}

class _SocialMediaContentListState extends State<SocialMediaContentList> {
  String? renderFieldError(BuildContext context, SocialMediaError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case SocialMediaError.empty:
        return S.of(context).empty;
      case SocialMediaError.urlInvalid:
        return S.of(context).urlInvalid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaContentCubit, SocialMediaContentState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).title,
            style: Styles.s18()
                .withWeight(FontWeight.w600)
                .withHeight(18 / 18)
                .withLetterSpacing(-2.5 / 100),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final bool checkedEdit =
                  index == state.socialMediaContentList.length - 1;
              final socialMediaItem = state.socialMediaContentList[index];
              return _Item(
                number: index + 1,
                enabled: checkedEdit,
                errorTextUrl: checkedEdit
                    ? renderFieldError(context, state.url.error)
                    : null,
                errorTextContent: checkedEdit
                    ? renderFieldError(context, state.content.error)
                    : null,
                onChangedContent: (value) {
                  context
                      .read<SocialMediaContentCubit>()
                      .onContentChanged(value);
                },
                onChangedUrl: (value) {
                  context
                      .read<SocialMediaContentCubit>()
                      .onContentUrlChanged(value);
                },
                onChangedFile: (value) {
                  context.read<SocialMediaContentCubit>().onFileChanged(value);
                },
                initialContent: state.socialMediaContentList[index].content,
                initialUrl: state.socialMediaContentList[index].url,
                fileName: socialMediaItem.fileUrl?.split('/').last,
                fileUrl: socialMediaItem.fileUrl,
                file: socialMediaItem.fileRequest,
                onDeleteItem: () {
                  context
                      .read<SocialMediaContentCubit>()
                      .deleteSocialMedia(index);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 32);
            },
            itemCount: state.socialMediaContentList.length,
          ),
          const SizedBox(height: 24),
          AppOutlinedButton(
            onPressed: () {
              context.read<SocialMediaContentCubit>().onAddSocialMedia();
            },
            trailing: Align(
                child: Assets.svgs.pickerAddIcon.svg(
                    color: AppColors.blue.shade500, width: 24, height: 24)),
            title: S.of(context).addition,
          )
        ],
      );
    });
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.number,
    this.onDeleteItem,
    this.onChangedUrl,
    this.onChangedContent,
    this.onChangedFile,
    this.initialUrl,
    this.fileName,
    this.fileUrl,
    this.initialContent,
    this.enabled = true,
    this.file,
    this.errorTextUrl,
    this.errorTextContent,
  });
  final int number;
  final VoidCallback? onDeleteItem;
  final Function(String)? onChangedUrl;
  final Function(String)? onChangedContent;
  final Function(File?)? onChangedFile;
  final String? initialUrl;
  final String? initialContent;
  final String? fileName;
  final String? fileUrl;
  final File? file;
  final bool enabled;
  final String? errorTextUrl;
  final String? errorTextContent;

  @override
  Widget build(BuildContext context) {
    const helper = ImageLoading(
      height: 88,
      width: 88,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${S.of(context).list} $number',
          style: Styles.s18()
              .withWeight(FontWeight.w600)
              .withHeight(18 / 18)
              .withLetterSpacing(-2.5 / 100),
        ),
        const SizedBox(height: 16),
        GapItems(
          items: [
            OutlineButtonTextField(
              childLeft:
                  !enabled ? _textFieldContainer(initialContent ?? '') : null,
              buttonTitle: S.of(context).delete,
              errorText: errorTextContent,
              initialValue: initialContent,
              borderActiveColor: AppColors.red.shade600,
              textStyleButton: Styles.s15()
                  .withLetterSpacing(-2.5 / 100)
                  .withWeight(FontWeight.w600)
                  .withColor(AppColors.red.shade600),
              leadingButton:
                  Assets.svgs.subtractionIcon.svg(width: 24, height: 24),
              hintText: S.of(context).title,
              onPressedButton: onDeleteItem,
              onChanged: enabled
                  ? (value) {
                      onChangedContent!(value);
                    }
                  : null,
            ),
            if (!enabled)
              _textFieldContainer(initialUrl ?? '')
            else
              CommonTextField(
                hintText: S.of(context).linkUrl,
                keyboardType: TextInputType.url,
                errorText: errorTextUrl,
                onChanged: onChangedUrl,
                initialValue: initialUrl,
              ),
            OutlineButtonTextField(
              childLeft: _textFieldContainer(fileName ?? ''),
              buttonTitle: S.of(context).fileAttach,
              trailingButton: Assets.svgs.pickerAddIcon.svg(),
              paddingButton:
                  const EdgeInsets.symmetric(horizontal: 15.5, vertical: 8),
              backgroundColorButton: AppColors.gray.shade300,
              onPressedButton: enabled
                  ? () async {
                      final status = await const SelectImageRouteData()
                          .push<StatusFile>(context);
                      if (status?.action != ImageHandlingAction.delete) {
                        onChangedFile!(status!.file);
                        return;
                      }
                      onChangedFile!(null);
                    }
                  : null,
            ),
            if (file != null || fileUrl != null)
              Container(
                width: 88,
                height: 88,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: file != null
                    ? Image.file(
                        file!,
                        fit: BoxFit.cover,
                      )
                    : fileUrl != null
                        ? Image.network(
                            fileUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: helper.loadingBuilder,
                            errorBuilder: helper.errorBuilder,
                          )
                        : null,
              ),
          ],
        ),
      ],
    );
  }

  Widget _textFieldContainer(String text) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gray.shade500,
        ),
        color: AppColors.gray.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: Styles.s15()
            .withColor(AppColors.text.common)
            .withLetterSpacing(-2.5 / 100),
      ),
    );
  }
}
