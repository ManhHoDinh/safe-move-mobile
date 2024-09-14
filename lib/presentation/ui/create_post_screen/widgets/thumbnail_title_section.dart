import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/request/request.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../blocs/create_post_cubit.dart';
import '../blocs/create_post_state.dart';
import 'input_subject_section.dart';

class ThumbnailTitleSection extends StatefulWidget {
  const ThumbnailTitleSection({super.key});

  @override
  State<ThumbnailTitleSection> createState() => _ThumbnailTitleSectionState();
}

class _ThumbnailTitleSectionState extends State<ThumbnailTitleSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CreatePostCubit, CreatePostState>(buildWhen: (prev, curr) {
          return prev.localThumbnail != curr.localThumbnail;
        }, builder: (context, state) {
          return _ThumbnailPicker(
            onPickImage: (image) {
              context
                  .read<CreatePostCubit>()
                  .onLocalThumbnailChanged(image, null);
            },
            loaclThumbnail: state.localThumbnail,
            thumbnailRequest: state.thumbnail,
            onRemove: () {
              context
                  .read<CreatePostCubit>()
                  .onLocalThumbnailChanged(null, null);
            },
          );
        }),
        const Expanded(child: InputSubjectSection()),
      ],
    );
  }
}

class _ThumbnailPicker extends StatelessWidget {
  const _ThumbnailPicker({
    this.onPickImage,
    this.loaclThumbnail,
    this.onRemove,
    this.thumbnailRequest,
  });

  final ValueChanged<File>? onPickImage;
  final VoidCallback? onRemove;
  final File? loaclThumbnail;
  final FileRequest? thumbnailRequest;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () async {
                final File? file =
                    await const ImagePickerRouteData().push(context);
                if (file != null) {
                  onPickImage?.call(file);
                }
              },
              child: Container(
                width: 88,
                height: 88,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.gray.shade30,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: loaclThumbnail != null
                    ? Image.file(
                        loaclThumbnail!,
                        fit: BoxFit.fill,
                      )
                    : thumbnailRequest != null
                        ? Image.network(
                            thumbnailRequest!.previewUrl,
                            fit: BoxFit.fill,
                          )
                        : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AutoSizeText(
                                  S.of(context).addThumbnail,
                                  minFontSize: 8,
                                  style: Styles.s13()
                                      .withWeight(FontWeight.w500)
                                      .withLetterSpacing(-2.5 / 100)
                                      .withColor(AppColors.text.common),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Assets.svgs.pickerAddIcon.svg(),
                              ],
                            ),
                          ),
              ),
            ),
          ),
        ),
        if (loaclThumbnail != null || thumbnailRequest != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gray.shade300,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onRemove,
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
