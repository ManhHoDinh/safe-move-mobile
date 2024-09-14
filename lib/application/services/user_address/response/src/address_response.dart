import 'package:dart_mappable/dart_mappable.dart';

import '../../../user/dto/dto.dart';

part 'address_response.mapper.dart';

@MappableClass()
class AddressResponse with AddressResponseMappable {
  const AddressResponse({
    this.id,
    this.zipcode,
    this.mainAddress,
    this.detailAddress,
    this.phoneNumber,
    this.name,
    this.isDefaults,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponseMapper.fromJson(json);

  final int? id;
  final String? zipcode;
  final String? mainAddress;
  final String? detailAddress;
  final String? phoneNumber;
  final String? name;
  final bool? isDefaults;
  final UserDTO? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
