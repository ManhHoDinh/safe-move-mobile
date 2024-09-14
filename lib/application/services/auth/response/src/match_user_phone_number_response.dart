import 'package:dart_mappable/dart_mappable.dart';

part 'match_user_phone_number_response.mapper.dart';

@MappableClass()
class MatchUserPhoneNumberResponse with MatchUserPhoneNumberResponseMappable {
  const MatchUserPhoneNumberResponse({
    this.matched,
  });

  factory MatchUserPhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      MatchUserPhoneNumberResponseMapper.fromJson(json);

  final bool? matched;
}
