import 'package:dart_mappable/dart_mappable.dart';

part 'presigned_url_upload_response.mapper.dart';

@MappableClass()
class PresignedUrlUploadResponse with PresignedUrlUploadResponseMappable {
  const PresignedUrlUploadResponse({
    this.uploadUrl,
    this.fileKey,
    this.previewUrl,
  });

  factory PresignedUrlUploadResponse.fromJson(Map<String, dynamic> json) =>
      PresignedUrlUploadResponseMapper.fromJson(json);

  final String? uploadUrl;
  final String? fileKey;
  final String? previewUrl;
}
