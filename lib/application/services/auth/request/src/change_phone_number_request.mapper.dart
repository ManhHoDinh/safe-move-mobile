// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'change_phone_number_request.dart';

class ChangePhoneNumberRequestMapper
    extends ClassMapperBase<ChangePhoneNumberRequest> {
  ChangePhoneNumberRequestMapper._();

  static ChangePhoneNumberRequestMapper? _instance;
  static ChangePhoneNumberRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ChangePhoneNumberRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChangePhoneNumberRequest';

  static String _$sessionToken(ChangePhoneNumberRequest v) => v.sessionToken;
  static const Field<ChangePhoneNumberRequest, String> _f$sessionToken =
      Field('sessionToken', _$sessionToken);
  static String _$phoneNumber(ChangePhoneNumberRequest v) => v.phoneNumber;
  static const Field<ChangePhoneNumberRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);

  @override
  final MappableFields<ChangePhoneNumberRequest> fields = const {
    #sessionToken: _f$sessionToken,
    #phoneNumber: _f$phoneNumber,
  };

  static ChangePhoneNumberRequest _instantiate(DecodingData data) {
    return ChangePhoneNumberRequest(
        sessionToken: data.dec(_f$sessionToken),
        phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static ChangePhoneNumberRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangePhoneNumberRequest>(map);
  }

  static ChangePhoneNumberRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChangePhoneNumberRequest>(json);
  }
}

mixin ChangePhoneNumberRequestMappable {
  String toJsonString() {
    return ChangePhoneNumberRequestMapper.ensureInitialized()
        .encodeJson<ChangePhoneNumberRequest>(this as ChangePhoneNumberRequest);
  }

  Map<String, dynamic> toJson() {
    return ChangePhoneNumberRequestMapper.ensureInitialized()
        .encodeMap<ChangePhoneNumberRequest>(this as ChangePhoneNumberRequest);
  }

  ChangePhoneNumberRequestCopyWith<ChangePhoneNumberRequest,
          ChangePhoneNumberRequest, ChangePhoneNumberRequest>
      get copyWith => _ChangePhoneNumberRequestCopyWithImpl(
          this as ChangePhoneNumberRequest, $identity, $identity);
  @override
  String toString() {
    return ChangePhoneNumberRequestMapper.ensureInitialized()
        .stringifyValue(this as ChangePhoneNumberRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ChangePhoneNumberRequestMapper.ensureInitialized()
                .isValueEqual(this as ChangePhoneNumberRequest, other));
  }

  @override
  int get hashCode {
    return ChangePhoneNumberRequestMapper.ensureInitialized()
        .hashValue(this as ChangePhoneNumberRequest);
  }
}

extension ChangePhoneNumberRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangePhoneNumberRequest, $Out> {
  ChangePhoneNumberRequestCopyWith<$R, ChangePhoneNumberRequest, $Out>
      get $asChangePhoneNumberRequest => $base
          .as((v, t, t2) => _ChangePhoneNumberRequestCopyWithImpl(v, t, t2));
}

abstract class ChangePhoneNumberRequestCopyWith<
    $R,
    $In extends ChangePhoneNumberRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? sessionToken, String? phoneNumber});
  ChangePhoneNumberRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChangePhoneNumberRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangePhoneNumberRequest, $Out>
    implements
        ChangePhoneNumberRequestCopyWith<$R, ChangePhoneNumberRequest, $Out> {
  _ChangePhoneNumberRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangePhoneNumberRequest> $mapper =
      ChangePhoneNumberRequestMapper.ensureInitialized();
  @override
  $R call({String? sessionToken, String? phoneNumber}) =>
      $apply(FieldCopyWithData({
        if (sessionToken != null) #sessionToken: sessionToken,
        if (phoneNumber != null) #phoneNumber: phoneNumber
      }));
  @override
  ChangePhoneNumberRequest $make(CopyWithData data) => ChangePhoneNumberRequest(
      sessionToken: data.get(#sessionToken, or: $value.sessionToken),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  ChangePhoneNumberRequestCopyWith<$R2, ChangePhoneNumberRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChangePhoneNumberRequestCopyWithImpl($value, $cast, t);
}
