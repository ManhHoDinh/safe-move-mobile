import 'package:dart_mappable/dart_mappable.dart';

part 'session_token_response.mapper.dart';

@MappableClass()
class SessionTokenResponse with SessionTokenResponseMappable {
  const SessionTokenResponse({
    this.token,
    this.createdAt,
    this.expiredAt,
  });

  factory SessionTokenResponse.fromJson(Map<String, dynamic> json) =>
      SessionTokenResponseMapper.fromJson(json);

  final String? token;
  final String? createdAt;
  final String? expiredAt;
}
