import 'package:dart_mappable/dart_mappable.dart';

part 'check_exist_phone_number_request.mapper.dart';

@MappableClass()
class CheckExistPhoneNumberRequest with CheckExistPhoneNumberRequestMappable {
  const CheckExistPhoneNumberRequest({
    required this.phoneNumber,
  });

  final String phoneNumber;
}
