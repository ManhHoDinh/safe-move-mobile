import 'package:dart_mappable/dart_mappable.dart';
part 'supplement_user_information_request.mapper.dart';

@MappableClass()
class SupplementUserInformationRequest
    with SupplementUserInformationRequestMappable {
  const SupplementUserInformationRequest({
    required this.name,
    required this.phoneNumber,
    required this.sessionToken,
    this.referralPhoneNumber,
  });

  factory SupplementUserInformationRequest.fromJson(
          Map<String, dynamic> json) =>
      SupplementUserInformationRequestMapper.fromJson(json);

  final String name;
  final String phoneNumber;
  final String sessionToken;
  final String? referralPhoneNumber;
}
