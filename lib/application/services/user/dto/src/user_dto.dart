import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'user_dto.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum Role { admin, member, system }

@MappableEnum(caseStyle: enumCaseStyle)
enum AccountType { normal, google, apple, kakao, naver }

@MappableClass()
class UserDTO with UserDTOMappable {
  const UserDTO({
    this.id,
    this.phoneNumber,
    this.name,
    this.email,
    this.role,
    this.accountType,
    this.avatarUrl,
    this.point,
    this.bio,
    this.username,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      UserDTOMapper.fromJson(json);

  final int? id;
  final Role? role;
  final String? email;
  final String? phoneNumber;
  final String? username;
  final String? name;
  final String? bio;
  final AccountType? accountType;
  final String? avatarUrl;
  final int? point;
}

@MappableClass()
class UserDetailDTO with UserDetailDTOMappable {
  const UserDetailDTO({
    this.id,
    this.phoneNumber,
    this.name,
    this.email,
    this.avatarUrl,
    this.bio,
    this.isFollowing,
  });

  factory UserDetailDTO.fromJson(Map<String, dynamic> json) =>
      UserDetailDTOMapper.fromJson(json);

  final int? id;
  final String? email;
  final String? phoneNumber;
  final String? name;
  final String? bio;
  final String? avatarUrl;
  final bool? isFollowing;
}
