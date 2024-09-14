import 'dart:io';

import '../../../../application/services/file/file.dart';
import '../../../../application/services/rating/rating.dart';
import '../../../../application/services/user/user.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../utilities/image_uploader.dart';
import 'compose_review_state.dart';

class ComposeReviewCubit extends SafeCubit<ComposeReviewState> {
  ComposeReviewCubit({
    required this.fileController,
    required this.failureHandlerManager,
    required this.productId,
    required this.ratingController,
    required this.loadingManager,
  }) : super(const ComposeReviewState());

  final FileController fileController;
  final RatingController ratingController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final int productId;

  void onRatingChanged(int value) {
    emit(state.copyWith(ratingPoint: value));
  }

  void onReviewChanged(String value) {
    emit(state.copyWith(content: value));
  }

  void upLoadImage(File file) {
    emit(state.copyWith(fileImages: [...state.fileImages, file]));
  }

  void deleteImage(int index) {
    final images = state.fileImages;
    images.removeAt(index);
    emit(state.copyWith(fileImages: images));
  }

  void onSubmit() async {
    final result = await loadingManager.startLoading(future: resultSubmit());
    if (result.isRight) {
      emit(state.copyWith(isSuccess: true));
    }
  }

  Future<Result<Failure, RatingResponse>> resultSubmit() async {
    final String? content = state.content;
    final imageUploader = ImageUploader(
      fileController: fileController,
      failureHandlerManager: failureHandlerManager,
    );
    final List<FileRequest> images =
        await imageUploader.uploadImages(state.fileImages);
    final ratingResult = await ratingController.addRating(RatingRequest(
      productId: productId,
      content: content,
      ratingPoint: state.ratingPoint,
      images: images,
    ));

    ratingResult.handleLeft((value) {
      failureHandlerManager.handle(ratingResult.left);
    });
    return ratingResult;
  }
}
