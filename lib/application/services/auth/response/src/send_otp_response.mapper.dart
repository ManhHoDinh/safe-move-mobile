// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'send_otp_response.dart';

class SendOTPResponseMapper extends ClassMapperBase<SendOTPResponse> {
  SendOTPResponseMapper._();

  static SendOTPResponseMapper? _instance;
  static SendOTPResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendOTPResponseMapper._());
      AuthMethodMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SendOTPResponse';

  static String? _$otpSessionId(SendOTPResponse v) => v.otpSessionId;
  static const Field<SendOTPResponse, String> _f$otpSessionId =
      Field('otpSessionId', _$otpSessionId, opt: true);
  static AuthMethod? _$type(SendOTPResponse v) => v.type;
  static const Field<SendOTPResponse, AuthMethod> _f$type =
      Field('type', _$type, opt: true);
  static String? _$address(SendOTPResponse v) => v.address;
  static const Field<SendOTPResponse, String> _f$address =
      Field('address', _$address, opt: true);
  static int? _$expiredIn(SendOTPResponse v) => v.expiredIn;
  static const Field<SendOTPResponse, int> _f$expiredIn =
      Field('expiredIn', _$expiredIn, opt: true);

  @override
  final MappableFields<SendOTPResponse> fields = const {
    #otpSessionId: _f$otpSessionId,
    #type: _f$type,
    #address: _f$address,
    #expiredIn: _f$expiredIn,
  };

  static SendOTPResponse _instantiate(DecodingData data) {
    return SendOTPResponse(
        otpSessionId: data.dec(_f$otpSessionId),
        type: data.dec(_f$type),
        address: data.dec(_f$address),
        expiredIn: data.dec(_f$expiredIn));
  }

  @override
  final Function instantiate = _instantiate;

  static SendOTPResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendOTPResponse>(map);
  }

  static SendOTPResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<SendOTPResponse>(json);
  }
}

mixin SendOTPResponseMappable {
  String toJsonString() {
    return SendOTPResponseMapper.ensureInitialized()
        .encodeJson<SendOTPResponse>(this as SendOTPResponse);
  }

  Map<String, dynamic> toJson() {
    return SendOTPResponseMapper.ensureInitialized()
        .encodeMap<SendOTPResponse>(this as SendOTPResponse);
  }

  SendOTPResponseCopyWith<SendOTPResponse, SendOTPResponse, SendOTPResponse>
      get copyWith => _SendOTPResponseCopyWithImpl(
          this as SendOTPResponse, $identity, $identity);
  @override
  String toString() {
    return SendOTPResponseMapper.ensureInitialized()
        .stringifyValue(this as SendOTPResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SendOTPResponseMapper.ensureInitialized()
                .isValueEqual(this as SendOTPResponse, other));
  }

  @override
  int get hashCode {
    return SendOTPResponseMapper.ensureInitialized()
        .hashValue(this as SendOTPResponse);
  }
}

extension SendOTPResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendOTPResponse, $Out> {
  SendOTPResponseCopyWith<$R, SendOTPResponse, $Out> get $asSendOTPResponse =>
      $base.as((v, t, t2) => _SendOTPResponseCopyWithImpl(v, t, t2));
}

abstract class SendOTPResponseCopyWith<$R, $In extends SendOTPResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? otpSessionId,
      AuthMethod? type,
      String? address,
      int? expiredIn});
  SendOTPResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SendOTPResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendOTPResponse, $Out>
    implements SendOTPResponseCopyWith<$R, SendOTPResponse, $Out> {
  _SendOTPResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendOTPResponse> $mapper =
      SendOTPResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? otpSessionId = $none,
          Object? type = $none,
          Object? address = $none,
          Object? expiredIn = $none}) =>
      $apply(FieldCopyWithData({
        if (otpSessionId != $none) #otpSessionId: otpSessionId,
        if (type != $none) #type: type,
        if (address != $none) #address: address,
        if (expiredIn != $none) #expiredIn: expiredIn
      }));
  @override
  SendOTPResponse $make(CopyWithData data) => SendOTPResponse(
      otpSessionId: data.get(#otpSessionId, or: $value.otpSessionId),
      type: data.get(#type, or: $value.type),
      address: data.get(#address, or: $value.address),
      expiredIn: data.get(#expiredIn, or: $value.expiredIn));

  @override
  SendOTPResponseCopyWith<$R2, SendOTPResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SendOTPResponseCopyWithImpl($value, $cast, t);
}
