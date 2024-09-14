// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'check_exist_phone_number_request.dart';

class CheckExistPhoneNumberRequestMapper
    extends ClassMapperBase<CheckExistPhoneNumberRequest> {
  CheckExistPhoneNumberRequestMapper._();

  static CheckExistPhoneNumberRequestMapper? _instance;
  static CheckExistPhoneNumberRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CheckExistPhoneNumberRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CheckExistPhoneNumberRequest';

  static String _$phoneNumber(CheckExistPhoneNumberRequest v) => v.phoneNumber;
  static const Field<CheckExistPhoneNumberRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);

  @override
  final MappableFields<CheckExistPhoneNumberRequest> fields = const {
    #phoneNumber: _f$phoneNumber,
  };

  static CheckExistPhoneNumberRequest _instantiate(DecodingData data) {
    return CheckExistPhoneNumberRequest(phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static CheckExistPhoneNumberRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CheckExistPhoneNumberRequest>(map);
  }

  static CheckExistPhoneNumberRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CheckExistPhoneNumberRequest>(json);
  }
}

mixin CheckExistPhoneNumberRequestMappable {
  String toJsonString() {
    return CheckExistPhoneNumberRequestMapper.ensureInitialized()
        .encodeJson<CheckExistPhoneNumberRequest>(
            this as CheckExistPhoneNumberRequest);
  }

  Map<String, dynamic> toJson() {
    return CheckExistPhoneNumberRequestMapper.ensureInitialized()
        .encodeMap<CheckExistPhoneNumberRequest>(
            this as CheckExistPhoneNumberRequest);
  }

  CheckExistPhoneNumberRequestCopyWith<CheckExistPhoneNumberRequest,
          CheckExistPhoneNumberRequest, CheckExistPhoneNumberRequest>
      get copyWith => _CheckExistPhoneNumberRequestCopyWithImpl(
          this as CheckExistPhoneNumberRequest, $identity, $identity);
  @override
  String toString() {
    return CheckExistPhoneNumberRequestMapper.ensureInitialized()
        .stringifyValue(this as CheckExistPhoneNumberRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CheckExistPhoneNumberRequestMapper.ensureInitialized()
                .isValueEqual(this as CheckExistPhoneNumberRequest, other));
  }

  @override
  int get hashCode {
    return CheckExistPhoneNumberRequestMapper.ensureInitialized()
        .hashValue(this as CheckExistPhoneNumberRequest);
  }
}

extension CheckExistPhoneNumberRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckExistPhoneNumberRequest, $Out> {
  CheckExistPhoneNumberRequestCopyWith<$R, CheckExistPhoneNumberRequest, $Out>
      get $asCheckExistPhoneNumberRequest => $base.as(
          (v, t, t2) => _CheckExistPhoneNumberRequestCopyWithImpl(v, t, t2));
}

abstract class CheckExistPhoneNumberRequestCopyWith<
    $R,
    $In extends CheckExistPhoneNumberRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? phoneNumber});
  CheckExistPhoneNumberRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CheckExistPhoneNumberRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckExistPhoneNumberRequest, $Out>
    implements
        CheckExistPhoneNumberRequestCopyWith<$R, CheckExistPhoneNumberRequest,
            $Out> {
  _CheckExistPhoneNumberRequestCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckExistPhoneNumberRequest> $mapper =
      CheckExistPhoneNumberRequestMapper.ensureInitialized();
  @override
  $R call({String? phoneNumber}) => $apply(
      FieldCopyWithData({if (phoneNumber != null) #phoneNumber: phoneNumber}));
  @override
  CheckExistPhoneNumberRequest $make(CopyWithData data) =>
      CheckExistPhoneNumberRequest(
          phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  CheckExistPhoneNumberRequestCopyWith<$R2, CheckExistPhoneNumberRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CheckExistPhoneNumberRequestCopyWithImpl($value, $cast, t);
}
