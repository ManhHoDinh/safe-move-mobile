import 'package:dart_mappable/dart_mappable.dart';

part 'address_request.mapper.dart';

@MappableClass()
class AddressRequest with AddressRequestMappable {
  const AddressRequest({
    required this.zipcode,
    required this.mainAddress,
    this.detailAddress,
    required this.phoneNumber,
    required this.name,
    this.isDefaults,
  });

  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      AddressRequestMapper.fromJson(json);

  final String zipcode;
  final String mainAddress;
  final String? detailAddress;
  final String phoneNumber;
  final String name;
  final bool? isDefaults;
}
