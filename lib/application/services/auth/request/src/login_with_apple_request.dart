import 'package:dart_mappable/dart_mappable.dart';

part 'login_with_apple_request.mapper.dart';

@MappableClass()
class LoginWithAppleRequest with LoginWithAppleRequestMappable {
  const LoginWithAppleRequest({
    required this.idToken,
  });

  final String idToken;
}
