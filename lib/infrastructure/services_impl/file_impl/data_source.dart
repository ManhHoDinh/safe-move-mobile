import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../application/services/file/file.dart';

part 'data_source.g.dart';

@RestApi()
abstract class FileDataSource {
  factory FileDataSource(Dio dio, {String baseUrl}) = _FileDataSource;

  @GET('/v1/user/files/upload-url')
  Future<PresignedUrlUploadResponse> getAwsS3UploadUrl({
    @Query('filename') required String filename,
  });
}
