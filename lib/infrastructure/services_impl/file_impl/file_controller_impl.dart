import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

import '../../../application/failures/generic/generic_failure.dart';
import '../../../application/services/file/file.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class FileControllerImpl with FileController, DataSourceErrorHandler {
  const FileControllerImpl({
    required this.fileDataSource,
    required this.dio,
  });

  final FileDataSource fileDataSource;
  final Dio dio;

  @override
  Future<Result<Failure, PresignedUrlUploadResponse>> getAwsS3UploadUrl({
    required String fileName,
  }) {
    return handleApiResult(
        future: () => fileDataSource.getAwsS3UploadUrl(filename: fileName));
  }

  @override
  Future<Result<Failure, dynamic>> uploadFileToS3(
      {required String uploadUrl, required File file}) async {
    try {
      final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';

      await dio.put(
        uploadUrl,
        data: file.openRead(),
        options: Options(
          contentType: mimeType,
          headers: {
            'Content-Length': file.lengthSync(),
          },
        ),
      );
      await Future.delayed(const Duration(milliseconds: 100));
      return const Right(null);
    } catch (error) {
      return const Left(GenericFailure());
    }
  }
}
