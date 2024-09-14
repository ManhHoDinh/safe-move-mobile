import 'package:dart_mappable/dart_mappable.dart';

part 'login_with_google_request.mapper.dart';

@MappableClass()
class LoginWithGoogleRequest with LoginWithGoogleRequestMappable {
  const LoginWithGoogleRequest({
    required this.idToken,
  });

  final String idToken;
}
