import 'package:dart_mappable/dart_mappable.dart';

part 'change_my_password_request.mapper.dart';

@MappableClass()
class ChangeMyPasswordRequest with ChangeMyPasswordRequestMappable {
  const ChangeMyPasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;
}
