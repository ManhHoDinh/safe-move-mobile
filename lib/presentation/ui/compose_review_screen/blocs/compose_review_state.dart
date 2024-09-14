import 'dart:io';

class ComposeReviewState {
  const ComposeReviewState({
    this.ratingPoint = 5,
    this.fileImages = const [],
    this.content,
    this.isSuccess = false,
  });

  final int ratingPoint;
  final List<File> fileImages;
  final String? content;
  final bool isSuccess;

  ComposeReviewState copyWith({
    int? ratingPoint,
    List<File>? fileImages,
    String? content,
    bool? isSuccess,
  }) {
    return ComposeReviewState(
      ratingPoint: ratingPoint ?? this.ratingPoint,
      fileImages: fileImages ?? this.fileImages,
      content: content ?? this.content,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
