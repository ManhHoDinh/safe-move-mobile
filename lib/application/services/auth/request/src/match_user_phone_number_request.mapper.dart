// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_user_phone_number_request.dart';

class MatchUserPhoneNumberRequestMapper
    extends ClassMapperBase<MatchUserPhoneNumberRequest> {
  MatchUserPhoneNumberRequestMapper._();

  static MatchUserPhoneNumberRequestMapper? _instance;
  static MatchUserPhoneNumberRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MatchUserPhoneNumberRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MatchUserPhoneNumberRequest';

  static String _$username(MatchUserPhoneNumberRequest v) => v.username;
  static const Field<MatchUserPhoneNumberRequest, String> _f$username =
      Field('username', _$username);
  static String _$phoneNumber(MatchUserPhoneNumberRequest v) => v.phoneNumber;
  static const Field<MatchUserPhoneNumberRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);

  @override
  final MappableFields<MatchUserPhoneNumberRequest> fields = const {
    #username: _f$username,
    #phoneNumber: _f$phoneNumber,
  };

  static MatchUserPhoneNumberRequest _instantiate(DecodingData data) {
    return MatchUserPhoneNumberRequest(
        username: data.dec(_f$username), phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchUserPhoneNumberRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchUserPhoneNumberRequest>(map);
  }

  static MatchUserPhoneNumberRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<MatchUserPhoneNumberRequest>(json);
  }
}

mixin MatchUserPhoneNumberRequestMappable {
  String toJsonString() {
    return MatchUserPhoneNumberRequestMapper.ensureInitialized()
        .encodeJson<MatchUserPhoneNumberRequest>(
            this as MatchUserPhoneNumberRequest);
  }

  Map<String, dynamic> toJson() {
    return MatchUserPhoneNumberRequestMapper.ensureInitialized()
        .encodeMap<MatchUserPhoneNumberRequest>(
            this as MatchUserPhoneNumberRequest);
  }

  MatchUserPhoneNumberRequestCopyWith<MatchUserPhoneNumberRequest,
          MatchUserPhoneNumberRequest, MatchUserPhoneNumberRequest>
      get copyWith => _MatchUserPhoneNumberRequestCopyWithImpl(
          this as MatchUserPhoneNumberRequest, $identity, $identity);
  @override
  String toString() {
    return MatchUserPhoneNumberRequestMapper.ensureInitialized()
        .stringifyValue(this as MatchUserPhoneNumberRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MatchUserPhoneNumberRequestMapper.ensureInitialized()
                .isValueEqual(this as MatchUserPhoneNumberRequest, other));
  }

  @override
  int get hashCode {
    return MatchUserPhoneNumberRequestMapper.ensureInitialized()
        .hashValue(this as MatchUserPhoneNumberRequest);
  }
}

extension MatchUserPhoneNumberRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchUserPhoneNumberRequest, $Out> {
  MatchUserPhoneNumberRequestCopyWith<$R, MatchUserPhoneNumberRequest, $Out>
      get $asMatchUserPhoneNumberRequest => $base
          .as((v, t, t2) => _MatchUserPhoneNumberRequestCopyWithImpl(v, t, t2));
}

abstract class MatchUserPhoneNumberRequestCopyWith<
    $R,
    $In extends MatchUserPhoneNumberRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? username, String? phoneNumber});
  MatchUserPhoneNumberRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MatchUserPhoneNumberRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchUserPhoneNumberRequest, $Out>
    implements
        MatchUserPhoneNumberRequestCopyWith<$R, MatchUserPhoneNumberRequest,
            $Out> {
  _MatchUserPhoneNumberRequestCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchUserPhoneNumberRequest> $mapper =
      MatchUserPhoneNumberRequestMapper.ensureInitialized();
  @override
  $R call({String? username, String? phoneNumber}) => $apply(FieldCopyWithData({
        if (username != null) #username: username,
        if (phoneNumber != null) #phoneNumber: phoneNumber
      }));
  @override
  MatchUserPhoneNumberRequest $make(CopyWithData data) =>
      MatchUserPhoneNumberRequest(
          username: data.get(#username, or: $value.username),
          phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  MatchUserPhoneNumberRequestCopyWith<$R2, MatchUserPhoneNumberRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MatchUserPhoneNumberRequestCopyWithImpl($value, $cast, t);
}
