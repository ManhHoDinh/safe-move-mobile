// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address_request.dart';

class AddressRequestMapper extends ClassMapperBase<AddressRequest> {
  AddressRequestMapper._();

  static AddressRequestMapper? _instance;
  static AddressRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AddressRequest';

  static String _$zipcode(AddressRequest v) => v.zipcode;
  static const Field<AddressRequest, String> _f$zipcode =
      Field('zipcode', _$zipcode);
  static String _$mainAddress(AddressRequest v) => v.mainAddress;
  static const Field<AddressRequest, String> _f$mainAddress =
      Field('mainAddress', _$mainAddress);
  static String? _$detailAddress(AddressRequest v) => v.detailAddress;
  static const Field<AddressRequest, String> _f$detailAddress =
      Field('detailAddress', _$detailAddress, opt: true);
  static String _$phoneNumber(AddressRequest v) => v.phoneNumber;
  static const Field<AddressRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);
  static String _$name(AddressRequest v) => v.name;
  static const Field<AddressRequest, String> _f$name = Field('name', _$name);
  static bool? _$isDefaults(AddressRequest v) => v.isDefaults;
  static const Field<AddressRequest, bool> _f$isDefaults =
      Field('isDefaults', _$isDefaults, opt: true);

  @override
  final MappableFields<AddressRequest> fields = const {
    #zipcode: _f$zipcode,
    #mainAddress: _f$mainAddress,
    #detailAddress: _f$detailAddress,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
    #isDefaults: _f$isDefaults,
  };

  static AddressRequest _instantiate(DecodingData data) {
    return AddressRequest(
        zipcode: data.dec(_f$zipcode),
        mainAddress: data.dec(_f$mainAddress),
        detailAddress: data.dec(_f$detailAddress),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name),
        isDefaults: data.dec(_f$isDefaults));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressRequest>(map);
  }

  static AddressRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<AddressRequest>(json);
  }
}

mixin AddressRequestMappable {
  String toJsonString() {
    return AddressRequestMapper.ensureInitialized()
        .encodeJson<AddressRequest>(this as AddressRequest);
  }

  Map<String, dynamic> toJson() {
    return AddressRequestMapper.ensureInitialized()
        .encodeMap<AddressRequest>(this as AddressRequest);
  }

  AddressRequestCopyWith<AddressRequest, AddressRequest, AddressRequest>
      get copyWith => _AddressRequestCopyWithImpl(
          this as AddressRequest, $identity, $identity);
  @override
  String toString() {
    return AddressRequestMapper.ensureInitialized()
        .stringifyValue(this as AddressRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressRequestMapper.ensureInitialized()
                .isValueEqual(this as AddressRequest, other));
  }

  @override
  int get hashCode {
    return AddressRequestMapper.ensureInitialized()
        .hashValue(this as AddressRequest);
  }
}

extension AddressRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressRequest, $Out> {
  AddressRequestCopyWith<$R, AddressRequest, $Out> get $asAddressRequest =>
      $base.as((v, t, t2) => _AddressRequestCopyWithImpl(v, t, t2));
}

abstract class AddressRequestCopyWith<$R, $In extends AddressRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? zipcode,
      String? mainAddress,
      String? detailAddress,
      String? phoneNumber,
      String? name,
      bool? isDefaults});
  AddressRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddressRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressRequest, $Out>
    implements AddressRequestCopyWith<$R, AddressRequest, $Out> {
  _AddressRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressRequest> $mapper =
      AddressRequestMapper.ensureInitialized();
  @override
  $R call(
          {String? zipcode,
          String? mainAddress,
          Object? detailAddress = $none,
          String? phoneNumber,
          String? name,
          Object? isDefaults = $none}) =>
      $apply(FieldCopyWithData({
        if (zipcode != null) #zipcode: zipcode,
        if (mainAddress != null) #mainAddress: mainAddress,
        if (detailAddress != $none) #detailAddress: detailAddress,
        if (phoneNumber != null) #phoneNumber: phoneNumber,
        if (name != null) #name: name,
        if (isDefaults != $none) #isDefaults: isDefaults
      }));
  @override
  AddressRequest $make(CopyWithData data) => AddressRequest(
      zipcode: data.get(#zipcode, or: $value.zipcode),
      mainAddress: data.get(#mainAddress, or: $value.mainAddress),
      detailAddress: data.get(#detailAddress, or: $value.detailAddress),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name),
      isDefaults: data.get(#isDefaults, or: $value.isDefaults));

  @override
  AddressRequestCopyWith<$R2, AddressRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressRequestCopyWithImpl($value, $cast, t);
}
