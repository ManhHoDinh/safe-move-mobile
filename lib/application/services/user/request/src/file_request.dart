import 'package:dart_mappable/dart_mappable.dart';

part 'file_request.mapper.dart';

@MappableClass()
class FileRequest with FileRequestMappable {
  const FileRequest({
    required this.fileKey,
    required this.previewUrl,
  });

  factory FileRequest.fromJson(Map<String, dynamic> json) =>
      FileRequestMapper.fromJson(json);

  final String fileKey;
  final String previewUrl;
}
