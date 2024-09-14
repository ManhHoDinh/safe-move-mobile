import 'package:dart_mappable/dart_mappable.dart';

part 'check_exist_username_request.mapper.dart';

@MappableClass()
class CheckExistUsernameRequest with CheckExistUsernameRequestMappable {
  const CheckExistUsernameRequest({
    required this.username,
  });

  final String username;
}
