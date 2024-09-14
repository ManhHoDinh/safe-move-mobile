import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import 'app_shimmer.dart';

class ImageLoading {
  const ImageLoading({
    this.width = double.infinity,
    this.height,
    this.borderRadius,
    this.imageLoadingBuilder,
    this.imageErrorBuilder,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;

  ImageLoading copyWith({
    double? width,
    double? height,
    BorderRadius? borderRadius,
    ImageLoadingBuilder? imageLoadingBuilder,
    ImageErrorWidgetBuilder? imageErrorBuilder,
  }) {
    return ImageLoading(
      width: width ?? this.width,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      imageLoadingBuilder: imageLoadingBuilder ?? this.imageLoadingBuilder,
      imageErrorBuilder: imageErrorBuilder ?? this.imageErrorBuilder,
    );
  }

  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (imageLoadingBuilder != null) {
      return imageLoadingBuilder!(context, child, loadingProgress);
    }
    if (loadingProgress == null) {
      return child;
    }
    return AppShimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget errorBuilder(
      BuildContext context, Object error, StackTrace? stackTrace) {
    if (imageErrorBuilder != null) {
      return imageErrorBuilder!(context, error, stackTrace);
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.gray.shade200,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
    );
  }
}
