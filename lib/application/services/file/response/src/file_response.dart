import 'package:dart_mappable/dart_mappable.dart';

part 'file_response.mapper.dart';

@MappableClass()
class FileResponse with FileResponseMappable {
  const FileResponse({
    this.fileKey,
    this.previewUrl,
  });

  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      FileResponseMapper.fromJson(json);

  final String? fileKey;
  final String? previewUrl;
}
