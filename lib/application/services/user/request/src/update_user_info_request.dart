import 'package:dart_mappable/dart_mappable.dart';

part 'update_user_info_request.mapper.dart';

@MappableClass()
class UpdateUserInfoRequest with UpdateUserInfoRequestMappable {
  const UpdateUserInfoRequest({
    required this.name,
    this.email,
    this.bio,
  });

  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      UpdateUserInfoRequestMapper.fromJson(json);

  final String name;
  final String? bio;
  final String? email;
}
