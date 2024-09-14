import 'dart:io' as io show File;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/extensions/controller_ext.dart';
import 'package:flutter_quill_extensions/utils/utils.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../bases/locale_cubit/locale_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../blocs/create_post_cubit.dart';

class ToolbarQuillSection extends StatefulWidget {
  const ToolbarQuillSection(
      {super.key, required this.controller, required this.contextCreatePost});

  final QuillController controller;
  final BuildContext contextCreatePost;
  @override
  State<ToolbarQuillSection> createState() => _ToolbarQuillSectionState();
}

class _ToolbarQuillSectionState extends State<ToolbarQuillSection> {
  Future<io.File?> onCropImage(String image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: S.of(widget.contextCreatePost).editPhoto,
          toolbarColor: AppColors.gray.shade70,
          statusBarColor: AppColors.gray.shade70,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: S.of(widget.contextCreatePost).editPhoto,
        ),
      ],
    );
    final newImage = croppedFile?.path;
    if (newImage == null) {
      return null;
    }
    return io.File(newImage);
  }

  Future<void> onImageInsert(String image, QuillController controller) async {
    if (isHttpBasedUrl(image)) {
      controller.insertImageBlock(imageSource: image);
      return;
    }
    // final newImage = await onCropImage(image, context);
    // if (newImage == null || !context.mounted) {
    //   return;
    // }
    final newImage = io.File(image);

    final newImageUrl = await uploadFileS3(newImage);
    if (newImageUrl == null) {
      return;
    }

    controller.insertImageBlock(imageSource: newImageUrl);
  }

  Future<String?> uploadFileS3(io.File image) async {
    //logic call api upload
    if (!widget.contextCreatePost.mounted) {
      return null;
    }
    final imageUrl = widget.contextCreatePost
        .read<CreatePostCubit>()
        .onUploadImageQuill(image);
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.gray.shade700,
            ),
          ),
          color: AppColors.gray.shade70),
      padding: const EdgeInsets.only(right: 5, bottom: 10, top: 5),
      child: QuillToolbar.simple(
        configurations: QuillSimpleToolbarConfigurations(
          multiRowsDisplay: false,
          controller: widget.controller,
          toolbarIconAlignment: WrapAlignment.start,
          toolbarIconCrossAlignment: WrapCrossAlignment.start,
          toolbarSectionSpacing: 0,
          showAlignmentButtons: true,
          showFontFamily: false,
          showInlineCode: false,
          showListCheck: false,
          showCodeBlock: false,
          showQuote: false,
          showIndent: false,
          showDividers: false,
          showUndo: false,
          showRedo: false,
          showClearFormat: false,
          showSubscript: false,
          showSuperscript: false,
          showBackgroundColorButton: false,
          showSearchButton: false,
          showHeaderStyle: false,
          fontSizesValues: const {
            '12px': '12.0',
            '14px': '14.0',
            '16px': '16.0',
            '18px': '18.0',
            '20px': '20.0',
            '24px': '24.0',
          },
          sharedConfigurations: QuillSharedConfigurations(
            locale: context.watch<LocaleCubit>().state,
          ),
          customButtons: [
            QuillToolbarCustomButtonOptions(
              icon: const Icon(Icons.image),
              onPressed: () async {
                // FocusManager.instance.primaryFocus?.unfocus();
                final List<File>? files =
                    await const ImagePickerRouteData(isMultiple: true)
                        .push(context);

                final List<Future<void>> futures = [];
                if (files != null && files.isNotEmpty) {
                  for (final file in files) {
                    futures.add(onImageInsert(file.path, widget.controller));
                  }
                  await Future.wait(futures);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
