import 'package:dart_mappable/dart_mappable.dart';

part 'register_with_phone_number_request.mapper.dart';

@MappableClass()
class RegisterWithPhoneNumberRequest
    with RegisterWithPhoneNumberRequestMappable {
  const RegisterWithPhoneNumberRequest({
    required this.username,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.sessionToken,
    this.referrerPhoneNumber,
  });

  final String username;
  final String password;
  final String name;
  final String phoneNumber;
  final String sessionToken;
  final String? referrerPhoneNumber;
}
