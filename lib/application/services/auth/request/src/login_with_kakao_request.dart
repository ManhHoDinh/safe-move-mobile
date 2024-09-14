import 'package:dart_mappable/dart_mappable.dart';

part 'login_with_kakao_request.mapper.dart';

@MappableClass()
class LoginWithKakaoRequest with LoginWithKakaoRequestMappable {
  const LoginWithKakaoRequest({
    required this.accessToken,
  });

  final String accessToken;
}
