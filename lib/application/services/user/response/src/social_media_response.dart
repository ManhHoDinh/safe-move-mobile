import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/src/social_media_type.dart';

part 'social_media_response.mapper.dart';

@MappableClass()
class SocialMediaResponse with SocialMediaResponseMappable {
  const SocialMediaResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.socialType,
    this.url,
  });

  factory SocialMediaResponse.fromJson(Map<String, dynamic> json) =>
      SocialMediaResponseMapper.fromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SocialMediaType? socialType;
  final String? url;
}
