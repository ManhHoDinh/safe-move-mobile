import 'package:dart_mappable/dart_mappable.dart';

part 'refresh_token_request.mapper.dart';

@MappableClass()
class RefreshTokenRequest with RefreshTokenRequestMappable {
  const RefreshTokenRequest({
    required this.refreshToken,
  });

  final String refreshToken;
}
