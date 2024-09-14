import 'package:dart_mappable/dart_mappable.dart';
import '../../dto/dto.dart';

part 'social_media_request.mapper.dart';

@MappableClass()
class SocialMediaRequest with SocialMediaRequestMappable {
  const SocialMediaRequest({
    this.id,
    required this.type,
    required this.url,
  });

  factory SocialMediaRequest.fromJson(Map<String, dynamic> json) =>
      SocialMediaRequestMapper.fromJson(json);

  final int? id;
  final SocialMediaType type;
  final String url;
}
