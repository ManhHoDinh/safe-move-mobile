// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'verify_otp_request.dart';

class VerifyOTPRequestMapper extends ClassMapperBase<VerifyOTPRequest> {
  VerifyOTPRequestMapper._();

  static VerifyOTPRequestMapper? _instance;
  static VerifyOTPRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerifyOTPRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyOTPRequest';

  static String _$otpSessionId(VerifyOTPRequest v) => v.otpSessionId;
  static const Field<VerifyOTPRequest, String> _f$otpSessionId =
      Field('otpSessionId', _$otpSessionId);
  static String _$otp(VerifyOTPRequest v) => v.otp;
  static const Field<VerifyOTPRequest, String> _f$otp = Field('otp', _$otp);

  @override
  final MappableFields<VerifyOTPRequest> fields = const {
    #otpSessionId: _f$otpSessionId,
    #otp: _f$otp,
  };

  static VerifyOTPRequest _instantiate(DecodingData data) {
    return VerifyOTPRequest(
        otpSessionId: data.dec(_f$otpSessionId), otp: data.dec(_f$otp));
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyOTPRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyOTPRequest>(map);
  }

  static VerifyOTPRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<VerifyOTPRequest>(json);
  }
}

mixin VerifyOTPRequestMappable {
  String toJsonString() {
    return VerifyOTPRequestMapper.ensureInitialized()
        .encodeJson<VerifyOTPRequest>(this as VerifyOTPRequest);
  }

  Map<String, dynamic> toJson() {
    return VerifyOTPRequestMapper.ensureInitialized()
        .encodeMap<VerifyOTPRequest>(this as VerifyOTPRequest);
  }

  VerifyOTPRequestCopyWith<VerifyOTPRequest, VerifyOTPRequest, VerifyOTPRequest>
      get copyWith => _VerifyOTPRequestCopyWithImpl(
          this as VerifyOTPRequest, $identity, $identity);
  @override
  String toString() {
    return VerifyOTPRequestMapper.ensureInitialized()
        .stringifyValue(this as VerifyOTPRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            VerifyOTPRequestMapper.ensureInitialized()
                .isValueEqual(this as VerifyOTPRequest, other));
  }

  @override
  int get hashCode {
    return VerifyOTPRequestMapper.ensureInitialized()
        .hashValue(this as VerifyOTPRequest);
  }
}

extension VerifyOTPRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyOTPRequest, $Out> {
  VerifyOTPRequestCopyWith<$R, VerifyOTPRequest, $Out>
      get $asVerifyOTPRequest =>
          $base.as((v, t, t2) => _VerifyOTPRequestCopyWithImpl(v, t, t2));
}

abstract class VerifyOTPRequestCopyWith<$R, $In extends VerifyOTPRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? otpSessionId, String? otp});
  VerifyOTPRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VerifyOTPRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyOTPRequest, $Out>
    implements VerifyOTPRequestCopyWith<$R, VerifyOTPRequest, $Out> {
  _VerifyOTPRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyOTPRequest> $mapper =
      VerifyOTPRequestMapper.ensureInitialized();
  @override
  $R call({String? otpSessionId, String? otp}) => $apply(FieldCopyWithData({
        if (otpSessionId != null) #otpSessionId: otpSessionId,
        if (otp != null) #otp: otp
      }));
  @override
  VerifyOTPRequest $make(CopyWithData data) => VerifyOTPRequest(
      otpSessionId: data.get(#otpSessionId, or: $value.otpSessionId),
      otp: data.get(#otp, or: $value.otp));

  @override
  VerifyOTPRequestCopyWith<$R2, VerifyOTPRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VerifyOTPRequestCopyWithImpl($value, $cast, t);
}
