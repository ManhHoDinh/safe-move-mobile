import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../utilities/image_picker_func.dart';
import '../../theme/theme.dart';
import '../app_list_tile.dart';
import '../model_route_pages/bottom_sheet_page.dart';

enum ImageHandlingAction { camera, gallery, delete }

class StatusFile {
  StatusFile({this.file, required this.action});

  final File? file;
  final ImageHandlingAction action;
}

class SelectPhotoSheet {
  const SelectPhotoSheet._();

  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
  }) {
    return BottomSheetPage(
      key: key,
      contentBuilder: (_) {
        return const _SelectImageSheet();
      },
    );
  }
}

class _SelectImageSheet extends StatelessWidget {
  const _SelectImageSheet();

  Future<File?> _pickImage(BuildContext context, ImageSource source) async {
    final File? image = await pickSingleImage(source: source);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppListTile(
          title: Text(
            S.of(context).takePicture,
          ),
          titlePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          onTap: () async {
            final selected = await _pickImage(context, ImageSource.camera);
            if (selected == null && !context.mounted) {
              return;
            }
            context.pop(
                StatusFile(file: selected, action: ImageHandlingAction.camera));
          },
        ),
        AppListTile(
          title: Text(
            S.of(context).pickFromGallery,
          ),
          titlePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          onTap: () async {
            final selected = await _pickImage(context, ImageSource.gallery);
            if (selected == null && !context.mounted) {
              return;
            }
            context.pop(
                StatusFile(file: selected, action: ImageHandlingAction.camera));
          },
        ),
        AppListTile(
          title: Text(
            S.of(context).deletePhoto,
            style: Styles.s15().withColor(AppColors.red.shade600),
          ),
          titlePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          onTap: () {
            context.pop(StatusFile(action: ImageHandlingAction.delete));
          },
        ),
      ],
    );
  }
}
