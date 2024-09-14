import 'package:dart_mappable/dart_mappable.dart';

import '../request.dart';

part 'profile_url_request.mapper.dart';

@MappableClass()
class ProfileUrlRequest with ProfileUrlRequestMappable {
  const ProfileUrlRequest({
    this.id,
    required this.content,
    required this.url,
    this.image,
  });

  factory ProfileUrlRequest.fromJson(Map<String, dynamic> json) =>
      ProfileUrlRequestMapper.fromJson(json);

  final int? id;
  final String content;
  final String url;
  final FileRequest? image;
}
