import 'package:dart_mappable/dart_mappable.dart';

part 'verify_password_request.mapper.dart';

@MappableClass()
class VerifyPasswordRequest with VerifyPasswordRequestMappable {
  const VerifyPasswordRequest({
    required this.password,
  });

  final String password;
}
