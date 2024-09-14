import 'dart:io';

import '../../application/services/file/controller/controller.dart';
import '../../application/services/user/user.dart';
import '../shared/handlers/failure_handler/failure_handler_manager.dart';

class ImageUploader {
  ImageUploader({
    required this.fileController,
    required this.failureHandlerManager,
  });
  final FileController fileController;
  final FailureHandlerManager failureHandlerManager;

  Future<List<FileRequest>> uploadImages(List<File> files) async {
    final List<FileRequest> result = [];
    final List<FileRequest?> images = await Future.wait(
      files.map((file) {
        final image = uploadImage(file);
        return image;
      }).toList(),
    );

    for (final element in images) {
      if (element != null) {
        result.add(element);
      }
    }

    return result;
  }

  Future<FileRequest?> uploadImage(File file) async {
    final getUrlResult = await fileController.getAwsS3UploadUrl(
      fileName: file.path.split('/').last,
    );
    if (getUrlResult.isLeft) {
      failureHandlerManager.handle(getUrlResult.left);
      return null;
    }
    final uploadUrl = getUrlResult.right.uploadUrl;

    final uploadFileToS3 = await fileController.uploadFileToS3(
      uploadUrl: uploadUrl ?? '',
      file: file,
    );

    uploadFileToS3.handleLeft((value) {
      failureHandlerManager.handle(uploadFileToS3.left);
    });

    if (uploadFileToS3.isRight) {
      return FileRequest(
        fileKey: getUrlResult.right.fileKey ?? '',
        previewUrl: getUrlResult.right.previewUrl ?? '',
      );
    }
    return null;
  }
}
