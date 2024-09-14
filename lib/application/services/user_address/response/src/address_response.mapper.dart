// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address_response.dart';

class AddressResponseMapper extends ClassMapperBase<AddressResponse> {
  AddressResponseMapper._();

  static AddressResponseMapper? _instance;
  static AddressResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressResponseMapper._());
      UserDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AddressResponse';

  static int? _$id(AddressResponse v) => v.id;
  static const Field<AddressResponse, int> _f$id = Field('id', _$id, opt: true);
  static String? _$zipcode(AddressResponse v) => v.zipcode;
  static const Field<AddressResponse, String> _f$zipcode =
      Field('zipcode', _$zipcode, opt: true);
  static String? _$mainAddress(AddressResponse v) => v.mainAddress;
  static const Field<AddressResponse, String> _f$mainAddress =
      Field('mainAddress', _$mainAddress, opt: true);
  static String? _$detailAddress(AddressResponse v) => v.detailAddress;
  static const Field<AddressResponse, String> _f$detailAddress =
      Field('detailAddress', _$detailAddress, opt: true);
  static String? _$phoneNumber(AddressResponse v) => v.phoneNumber;
  static const Field<AddressResponse, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$name(AddressResponse v) => v.name;
  static const Field<AddressResponse, String> _f$name =
      Field('name', _$name, opt: true);
  static bool? _$isDefaults(AddressResponse v) => v.isDefaults;
  static const Field<AddressResponse, bool> _f$isDefaults =
      Field('isDefaults', _$isDefaults, opt: true);
  static UserDTO? _$user(AddressResponse v) => v.user;
  static const Field<AddressResponse, UserDTO> _f$user =
      Field('user', _$user, opt: true);
  static DateTime? _$createdAt(AddressResponse v) => v.createdAt;
  static const Field<AddressResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(AddressResponse v) => v.updatedAt;
  static const Field<AddressResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<AddressResponse> fields = const {
    #id: _f$id,
    #zipcode: _f$zipcode,
    #mainAddress: _f$mainAddress,
    #detailAddress: _f$detailAddress,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
    #isDefaults: _f$isDefaults,
    #user: _f$user,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static AddressResponse _instantiate(DecodingData data) {
    return AddressResponse(
        id: data.dec(_f$id),
        zipcode: data.dec(_f$zipcode),
        mainAddress: data.dec(_f$mainAddress),
        detailAddress: data.dec(_f$detailAddress),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name),
        isDefaults: data.dec(_f$isDefaults),
        user: data.dec(_f$user),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressResponse>(map);
  }

  static AddressResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<AddressResponse>(json);
  }
}

mixin AddressResponseMappable {
  String toJsonString() {
    return AddressResponseMapper.ensureInitialized()
        .encodeJson<AddressResponse>(this as AddressResponse);
  }

  Map<String, dynamic> toJson() {
    return AddressResponseMapper.ensureInitialized()
        .encodeMap<AddressResponse>(this as AddressResponse);
  }

  AddressResponseCopyWith<AddressResponse, AddressResponse, AddressResponse>
      get copyWith => _AddressResponseCopyWithImpl(
          this as AddressResponse, $identity, $identity);
  @override
  String toString() {
    return AddressResponseMapper.ensureInitialized()
        .stringifyValue(this as AddressResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressResponseMapper.ensureInitialized()
                .isValueEqual(this as AddressResponse, other));
  }

  @override
  int get hashCode {
    return AddressResponseMapper.ensureInitialized()
        .hashValue(this as AddressResponse);
  }
}

extension AddressResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressResponse, $Out> {
  AddressResponseCopyWith<$R, AddressResponse, $Out> get $asAddressResponse =>
      $base.as((v, t, t2) => _AddressResponseCopyWithImpl(v, t, t2));
}

abstract class AddressResponseCopyWith<$R, $In extends AddressResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user;
  $R call(
      {int? id,
      String? zipcode,
      String? mainAddress,
      String? detailAddress,
      String? phoneNumber,
      String? name,
      bool? isDefaults,
      UserDTO? user,
      DateTime? createdAt,
      DateTime? updatedAt});
  AddressResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddressResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressResponse, $Out>
    implements AddressResponseCopyWith<$R, AddressResponse, $Out> {
  _AddressResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressResponse> $mapper =
      AddressResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  $R call(
          {Object? id = $none,
          Object? zipcode = $none,
          Object? mainAddress = $none,
          Object? detailAddress = $none,
          Object? phoneNumber = $none,
          Object? name = $none,
          Object? isDefaults = $none,
          Object? user = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (zipcode != $none) #zipcode: zipcode,
        if (mainAddress != $none) #mainAddress: mainAddress,
        if (detailAddress != $none) #detailAddress: detailAddress,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (name != $none) #name: name,
        if (isDefaults != $none) #isDefaults: isDefaults,
        if (user != $none) #user: user,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  AddressResponse $make(CopyWithData data) => AddressResponse(
      id: data.get(#id, or: $value.id),
      zipcode: data.get(#zipcode, or: $value.zipcode),
      mainAddress: data.get(#mainAddress, or: $value.mainAddress),
      detailAddress: data.get(#detailAddress, or: $value.detailAddress),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name),
      isDefaults: data.get(#isDefaults, or: $value.isDefaults),
      user: data.get(#user, or: $value.user),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  AddressResponseCopyWith<$R2, AddressResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressResponseCopyWithImpl($value, $cast, t);
}
