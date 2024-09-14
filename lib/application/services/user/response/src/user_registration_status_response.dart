import 'package:dart_mappable/dart_mappable.dart';

part 'user_registration_status_response.mapper.dart';

@MappableClass()
class UserRegistrationStatusResponse
    with UserRegistrationStatusResponseMappable {
  const UserRegistrationStatusResponse({
    this.registrationCompleted,
  });

  factory UserRegistrationStatusResponse.fromJson(Map<String, dynamic> json) =>
      UserRegistrationStatusResponseMapper.fromJson(json);

  final bool? registrationCompleted;
}
