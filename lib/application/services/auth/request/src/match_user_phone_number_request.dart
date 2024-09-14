import 'package:dart_mappable/dart_mappable.dart';

part 'match_user_phone_number_request.mapper.dart';

@MappableClass()
class MatchUserPhoneNumberRequest with MatchUserPhoneNumberRequestMappable {
  const MatchUserPhoneNumberRequest({
    required this.username,
    required this.phoneNumber,
  });

  final String username;
  final String phoneNumber;
}
