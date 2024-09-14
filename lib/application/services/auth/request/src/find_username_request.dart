import 'package:dart_mappable/dart_mappable.dart';

part 'find_username_request.mapper.dart';

@MappableClass()
class FindUsernameRequest with FindUsernameRequestMappable {
  const FindUsernameRequest({
    required this.sessionToken,
    required this.phoneNumber,
  });

  final String sessionToken;
  final String phoneNumber;
}
