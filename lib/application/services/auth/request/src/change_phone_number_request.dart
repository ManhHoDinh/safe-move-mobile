import 'package:dart_mappable/dart_mappable.dart';

part 'change_phone_number_request.mapper.dart';

@MappableClass()
class ChangePhoneNumberRequest with ChangePhoneNumberRequestMappable {
  const ChangePhoneNumberRequest({
    required this.sessionToken,
    required this.phoneNumber,
  });

  final String phoneNumber;
  final String sessionToken;
}
