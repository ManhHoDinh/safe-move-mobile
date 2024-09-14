// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'send_otp_request.dart';

class SendOTPRequestMapper extends ClassMapperBase<SendOTPRequest> {
  SendOTPRequestMapper._();

  static SendOTPRequestMapper? _instance;
  static SendOTPRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendOTPRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SendOTPRequest';

  static String _$phoneNumber(SendOTPRequest v) => v.phoneNumber;
  static const Field<SendOTPRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);

  @override
  final MappableFields<SendOTPRequest> fields = const {
    #phoneNumber: _f$phoneNumber,
  };

  static SendOTPRequest _instantiate(DecodingData data) {
    return SendOTPRequest(phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static SendOTPRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendOTPRequest>(map);
  }

  static SendOTPRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<SendOTPRequest>(json);
  }
}

mixin SendOTPRequestMappable {
  String toJsonString() {
    return SendOTPRequestMapper.ensureInitialized()
        .encodeJson<SendOTPRequest>(this as SendOTPRequest);
  }

  Map<String, dynamic> toJson() {
    return SendOTPRequestMapper.ensureInitialized()
        .encodeMap<SendOTPRequest>(this as SendOTPRequest);
  }

  SendOTPRequestCopyWith<SendOTPRequest, SendOTPRequest, SendOTPRequest>
      get copyWith => _SendOTPRequestCopyWithImpl(
          this as SendOTPRequest, $identity, $identity);
  @override
  String toString() {
    return SendOTPRequestMapper.ensureInitialized()
        .stringifyValue(this as SendOTPRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SendOTPRequestMapper.ensureInitialized()
                .isValueEqual(this as SendOTPRequest, other));
  }

  @override
  int get hashCode {
    return SendOTPRequestMapper.ensureInitialized()
        .hashValue(this as SendOTPRequest);
  }
}

extension SendOTPRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendOTPRequest, $Out> {
  SendOTPRequestCopyWith<$R, SendOTPRequest, $Out> get $asSendOTPRequest =>
      $base.as((v, t, t2) => _SendOTPRequestCopyWithImpl(v, t, t2));
}

abstract class SendOTPRequestCopyWith<$R, $In extends SendOTPRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? phoneNumber});
  SendOTPRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SendOTPRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendOTPRequest, $Out>
    implements SendOTPRequestCopyWith<$R, SendOTPRequest, $Out> {
  _SendOTPRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendOTPRequest> $mapper =
      SendOTPRequestMapper.ensureInitialized();
  @override
  $R call({String? phoneNumber}) => $apply(
      FieldCopyWithData({if (phoneNumber != null) #phoneNumber: phoneNumber}));
  @override
  SendOTPRequest $make(CopyWithData data) => SendOTPRequest(
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  SendOTPRequestCopyWith<$R2, SendOTPRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SendOTPRequestCopyWithImpl($value, $cast, t);
}
