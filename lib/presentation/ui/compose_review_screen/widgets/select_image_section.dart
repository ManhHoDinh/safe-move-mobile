import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/theme.dart';
import '../blocs/compose_review_cubit.dart';
import '../blocs/compose_review_state.dart';

class SelectImageSection extends StatefulWidget {
  const SelectImageSection({super.key});

  @override
  State<SelectImageSection> createState() => _SelectImageSectionState();
}

class _SelectImageSectionState extends State<SelectImageSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComposeReviewCubit, ComposeReviewState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              S.of(context).uploadImage,
              style: Styles.s18()
                  .withHeight(1)
                  .withLetterSpacing(-2.5 / 100)
                  .withWeight(FontWeight.w600)
                  .withColor(AppColors.text.main),
            ),
          ),
          LayoutBuilder(builder: (context, constraint) {
            return SizedBox(
              height: 88 + 16,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                scrollDirection: Axis.horizontal,
                itemExtent: 88 + 16 + 8,
                itemCount: state.fileImages.length + 1,
                itemBuilder: (context, index) {
                  if (index < state.fileImages.length) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: _ImagePreview(
                        image: state.fileImages[index],
                        onRemove: () {
                          context.read<ComposeReviewCubit>().deleteImage(index);
                        },
                      ),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: _ReviewImagePicker(
                      onPickImage: (image) {
                        context.read<ComposeReviewCubit>().upLoadImage(image);
                      },
                    ),
                  );
                },
              ),
            );
          }),
        ],
      );
    });
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({
    required this.image,
    this.onRemove,
  });

  final File image;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, right: 16),
          child: Container(
            width: 88,
            height: 88,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
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
        ),
      ],
    );
  }
}

class _ReviewImagePicker extends StatelessWidget {
  const _ReviewImagePicker({
    this.onPickImage,
  });

  final ValueChanged<File>? onPickImage;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 16),
        alignment: Alignment.center,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () async {
            final File? file = await const ImagePickerRouteData().push(context);
            if (file != null) {
              onPickImage?.call(file);
            }
          },
          child: Container(
            width: 88,
            height: 88,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.gray.shade30,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    S.of(context).uploadImage,
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
    );
  }
}
