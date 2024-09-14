import 'package:dart_mappable/dart_mappable.dart';

import '../../../file/response/response.dart';

part 'profile_url_response.mapper.dart';

@MappableClass()
class ProfileUrlResponse with ProfileUrlResponseMappable {
  const ProfileUrlResponse({
    this.id,
    this.content,
    this.url,
    this.image,
  });

  factory ProfileUrlResponse.fromJson(Map<String, dynamic> json) =>
      ProfileUrlResponseMapper.fromJson(json);

  final int? id;
  final String? content;
  final String? url;
  final FileResponse? image;
}
