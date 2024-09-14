import 'package:dart_mappable/dart_mappable.dart';

part 'jwt_response.mapper.dart';

@MappableClass()
class JwtResponse with JwtResponseMappable {
  const JwtResponse({
    this.createdAt,
    this.expiredAt,
    this.refreshCreateAt,
    this.refreshExpiredAt,
    this.refreshToken,
    this.token,
    this.userId,
  });

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      JwtResponseMapper.fromJson(json);

  final String? token;
  final DateTime? createdAt;
  final DateTime? expiredAt;
  final String? refreshToken;
  final DateTime? refreshCreateAt;
  final DateTime? refreshExpiredAt;
  final int? userId;
}
