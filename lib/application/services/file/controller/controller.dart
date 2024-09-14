import 'dart:io';

import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../response/src/presigned_url_upload_response.dart';

mixin FileController {
  Future<Result<Failure, PresignedUrlUploadResponse>> getAwsS3UploadUrl({
    required String fileName,
  });

  Future<Result<Failure, dynamic>> uploadFileToS3({
    required String uploadUrl,
    required File file,
  });
}
