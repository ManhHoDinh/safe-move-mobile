// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_dto.dart';

class RoleMapper extends EnumMapper<Role> {
  RoleMapper._();

  static RoleMapper? _instance;
  static RoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleMapper._());
    }
    return _instance!;
  }

  static Role fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Role decode(dynamic value) {
    switch (value) {
      case 'ADMIN':
        return Role.admin;
      case 'MEMBER':
        return Role.member;
      case 'SYSTEM':
        return Role.system;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Role self) {
    switch (self) {
      case Role.admin:
        return 'ADMIN';
      case Role.member:
        return 'MEMBER';
      case Role.system:
        return 'SYSTEM';
    }
  }
}

extension RoleMapperExtension on Role {
  String toValue() {
    RoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Role>(this) as String;
  }
}

class AccountTypeMapper extends EnumMapper<AccountType> {
  AccountTypeMapper._();

  static AccountTypeMapper? _instance;
  static AccountTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountTypeMapper._());
    }
    return _instance!;
  }

  static AccountType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AccountType decode(dynamic value) {
    switch (value) {
      case 'NORMAL':
        return AccountType.normal;
      case 'GOOGLE':
        return AccountType.google;
      case 'APPLE':
        return AccountType.apple;
      case 'KAKAO':
        return AccountType.kakao;
      case 'NAVER':
        return AccountType.naver;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AccountType self) {
    switch (self) {
      case AccountType.normal:
        return 'NORMAL';
      case AccountType.google:
        return 'GOOGLE';
      case AccountType.apple:
        return 'APPLE';
      case AccountType.kakao:
        return 'KAKAO';
      case AccountType.naver:
        return 'NAVER';
    }
  }
}

extension AccountTypeMapperExtension on AccountType {
  String toValue() {
    AccountTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AccountType>(this) as String;
  }
}

class UserDTOMapper extends ClassMapperBase<UserDTO> {
  UserDTOMapper._();

  static UserDTOMapper? _instance;
  static UserDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDTOMapper._());
      RoleMapper.ensureInitialized();
      AccountTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDTO';

  static int? _$id(UserDTO v) => v.id;
  static const Field<UserDTO, int> _f$id = Field('id', _$id, opt: true);
  static String? _$phoneNumber(UserDTO v) => v.phoneNumber;
  static const Field<UserDTO, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$name(UserDTO v) => v.name;
  static const Field<UserDTO, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$email(UserDTO v) => v.email;
  static const Field<UserDTO, String> _f$email =
      Field('email', _$email, opt: true);
  static Role? _$role(UserDTO v) => v.role;
  static const Field<UserDTO, Role> _f$role = Field('role', _$role, opt: true);
  static AccountType? _$accountType(UserDTO v) => v.accountType;
  static const Field<UserDTO, AccountType> _f$accountType =
      Field('accountType', _$accountType, opt: true);
  static String? _$avatarUrl(UserDTO v) => v.avatarUrl;
  static const Field<UserDTO, String> _f$avatarUrl =
      Field('avatarUrl', _$avatarUrl, opt: true);
  static int? _$point(UserDTO v) => v.point;
  static const Field<UserDTO, int> _f$point =
      Field('point', _$point, opt: true);
  static String? _$bio(UserDTO v) => v.bio;
  static const Field<UserDTO, String> _f$bio = Field('bio', _$bio, opt: true);
  static String? _$username(UserDTO v) => v.username;
  static const Field<UserDTO, String> _f$username =
      Field('username', _$username, opt: true);

  @override
  final MappableFields<UserDTO> fields = const {
    #id: _f$id,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
    #email: _f$email,
    #role: _f$role,
    #accountType: _f$accountType,
    #avatarUrl: _f$avatarUrl,
    #point: _f$point,
    #bio: _f$bio,
    #username: _f$username,
  };

  static UserDTO _instantiate(DecodingData data) {
    return UserDTO(
        id: data.dec(_f$id),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        role: data.dec(_f$role),
        accountType: data.dec(_f$accountType),
        avatarUrl: data.dec(_f$avatarUrl),
        point: data.dec(_f$point),
        bio: data.dec(_f$bio),
        username: data.dec(_f$username));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDTO>(map);
  }

  static UserDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserDTO>(json);
  }
}

mixin UserDTOMappable {
  String toJsonString() {
    return UserDTOMapper.ensureInitialized()
        .encodeJson<UserDTO>(this as UserDTO);
  }

  Map<String, dynamic> toJson() {
    return UserDTOMapper.ensureInitialized()
        .encodeMap<UserDTO>(this as UserDTO);
  }

  UserDTOCopyWith<UserDTO, UserDTO, UserDTO> get copyWith =>
      _UserDTOCopyWithImpl(this as UserDTO, $identity, $identity);
  @override
  String toString() {
    return UserDTOMapper.ensureInitialized().stringifyValue(this as UserDTO);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserDTOMapper.ensureInitialized()
                .isValueEqual(this as UserDTO, other));
  }

  @override
  int get hashCode {
    return UserDTOMapper.ensureInitialized().hashValue(this as UserDTO);
  }
}

extension UserDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, UserDTO, $Out> {
  UserDTOCopyWith<$R, UserDTO, $Out> get $asUserDTO =>
      $base.as((v, t, t2) => _UserDTOCopyWithImpl(v, t, t2));
}

abstract class UserDTOCopyWith<$R, $In extends UserDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? phoneNumber,
      String? name,
      String? email,
      Role? role,
      AccountType? accountType,
      String? avatarUrl,
      int? point,
      String? bio,
      String? username});
  UserDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDTO, $Out>
    implements UserDTOCopyWith<$R, UserDTO, $Out> {
  _UserDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDTO> $mapper =
      UserDTOMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? phoneNumber = $none,
          Object? name = $none,
          Object? email = $none,
          Object? role = $none,
          Object? accountType = $none,
          Object? avatarUrl = $none,
          Object? point = $none,
          Object? bio = $none,
          Object? username = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (name != $none) #name: name,
        if (email != $none) #email: email,
        if (role != $none) #role: role,
        if (accountType != $none) #accountType: accountType,
        if (avatarUrl != $none) #avatarUrl: avatarUrl,
        if (point != $none) #point: point,
        if (bio != $none) #bio: bio,
        if (username != $none) #username: username
      }));
  @override
  UserDTO $make(CopyWithData data) => UserDTO(
      id: data.get(#id, or: $value.id),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      role: data.get(#role, or: $value.role),
      accountType: data.get(#accountType, or: $value.accountType),
      avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
      point: data.get(#point, or: $value.point),
      bio: data.get(#bio, or: $value.bio),
      username: data.get(#username, or: $value.username));

  @override
  UserDTOCopyWith<$R2, UserDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserDTOCopyWithImpl($value, $cast, t);
}

class UserDetailDTOMapper extends ClassMapperBase<UserDetailDTO> {
  UserDetailDTOMapper._();

  static UserDetailDTOMapper? _instance;
  static UserDetailDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailDTO';

  static int? _$id(UserDetailDTO v) => v.id;
  static const Field<UserDetailDTO, int> _f$id = Field('id', _$id, opt: true);
  static String? _$phoneNumber(UserDetailDTO v) => v.phoneNumber;
  static const Field<UserDetailDTO, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$name(UserDetailDTO v) => v.name;
  static const Field<UserDetailDTO, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$email(UserDetailDTO v) => v.email;
  static const Field<UserDetailDTO, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$avatarUrl(UserDetailDTO v) => v.avatarUrl;
  static const Field<UserDetailDTO, String> _f$avatarUrl =
      Field('avatarUrl', _$avatarUrl, opt: true);
  static String? _$bio(UserDetailDTO v) => v.bio;
  static const Field<UserDetailDTO, String> _f$bio =
      Field('bio', _$bio, opt: true);
  static bool? _$isFollowing(UserDetailDTO v) => v.isFollowing;
  static const Field<UserDetailDTO, bool> _f$isFollowing =
      Field('isFollowing', _$isFollowing, opt: true);

  @override
  final MappableFields<UserDetailDTO> fields = const {
    #id: _f$id,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
    #email: _f$email,
    #avatarUrl: _f$avatarUrl,
    #bio: _f$bio,
    #isFollowing: _f$isFollowing,
  };

  static UserDetailDTO _instantiate(DecodingData data) {
    return UserDetailDTO(
        id: data.dec(_f$id),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        avatarUrl: data.dec(_f$avatarUrl),
        bio: data.dec(_f$bio),
        isFollowing: data.dec(_f$isFollowing));
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailDTO fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailDTO>(map);
  }

  static UserDetailDTO fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserDetailDTO>(json);
  }
}

mixin UserDetailDTOMappable {
  String toJsonString() {
    return UserDetailDTOMapper.ensureInitialized()
        .encodeJson<UserDetailDTO>(this as UserDetailDTO);
  }

  Map<String, dynamic> toJson() {
    return UserDetailDTOMapper.ensureInitialized()
        .encodeMap<UserDetailDTO>(this as UserDetailDTO);
  }

  UserDetailDTOCopyWith<UserDetailDTO, UserDetailDTO, UserDetailDTO>
      get copyWith => _UserDetailDTOCopyWithImpl(
          this as UserDetailDTO, $identity, $identity);
  @override
  String toString() {
    return UserDetailDTOMapper.ensureInitialized()
        .stringifyValue(this as UserDetailDTO);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserDetailDTOMapper.ensureInitialized()
                .isValueEqual(this as UserDetailDTO, other));
  }

  @override
  int get hashCode {
    return UserDetailDTOMapper.ensureInitialized()
        .hashValue(this as UserDetailDTO);
  }
}

extension UserDetailDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetailDTO, $Out> {
  UserDetailDTOCopyWith<$R, UserDetailDTO, $Out> get $asUserDetailDTO =>
      $base.as((v, t, t2) => _UserDetailDTOCopyWithImpl(v, t, t2));
}

abstract class UserDetailDTOCopyWith<$R, $In extends UserDetailDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? phoneNumber,
      String? name,
      String? email,
      String? avatarUrl,
      String? bio,
      bool? isFollowing});
  UserDetailDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserDetailDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetailDTO, $Out>
    implements UserDetailDTOCopyWith<$R, UserDetailDTO, $Out> {
  _UserDetailDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetailDTO> $mapper =
      UserDetailDTOMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? phoneNumber = $none,
          Object? name = $none,
          Object? email = $none,
          Object? avatarUrl = $none,
          Object? bio = $none,
          Object? isFollowing = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (name != $none) #name: name,
        if (email != $none) #email: email,
        if (avatarUrl != $none) #avatarUrl: avatarUrl,
        if (bio != $none) #bio: bio,
        if (isFollowing != $none) #isFollowing: isFollowing
      }));
  @override
  UserDetailDTO $make(CopyWithData data) => UserDetailDTO(
      id: data.get(#id, or: $value.id),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
      bio: data.get(#bio, or: $value.bio),
      isFollowing: data.get(#isFollowing, or: $value.isFollowing));

  @override
  UserDetailDTOCopyWith<$R2, UserDetailDTO, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserDetailDTOCopyWithImpl($value, $cast, t);
}
