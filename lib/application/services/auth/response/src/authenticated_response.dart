import 'package:dart_mappable/dart_mappable.dart';

import 'jwt_response.dart';

part 'authenticated_response.mapper.dart';

@MappableClass()
class AuthenticatedResponse with AuthenticatedResponseMappable {
  const AuthenticatedResponse({
    this.tokenInfo,
    this.userId,
  });

  factory AuthenticatedResponse.fromJson(Map<String, dynamic> json) =>
      AuthenticatedResponseMapper.fromJson(json);

  final JwtResponse? tokenInfo;
  final int? userId;
}
