import 'package:dart_mappable/dart_mappable.dart';

part 'change_password_request.mapper.dart';

@MappableClass()
class ChangePasswordRequest with ChangePasswordRequestMappable {
  const ChangePasswordRequest({
    required this.sessionToken,
    required this.username,
    required this.newPassword,
  });

  final String sessionToken;
  final String username;
  final String newPassword;
}
