import 'package:dart_mappable/dart_mappable.dart';

part 'login_with_naver_request.mapper.dart';

@MappableClass()
class LoginWithNaverRequest with LoginWithNaverRequestMappable {
  const LoginWithNaverRequest({
    required this.accessToken,
  });

  final String accessToken;
}
