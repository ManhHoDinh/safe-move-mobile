import 'package:dart_mappable/dart_mappable.dart';

part 'logout_request.mapper.dart';

@MappableClass()
class LogoutRequest with LogoutRequestMappable {
  const LogoutRequest({
    required this.refreshToken,
  });

  final String refreshToken;
}
