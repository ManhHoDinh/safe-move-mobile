import 'package:dart_mappable/dart_mappable.dart';

part 'find_username_response.mapper.dart';

@MappableClass()
class FindUsernameResponse with FindUsernameResponseMappable {
  const FindUsernameResponse({
    this.id,
    this.username,
  });

  factory FindUsernameResponse.fromJson(Map<String, dynamic> json) =>
      FindUsernameResponseMapper.fromJson(json);

  final int? id;
  final String? username;
}
