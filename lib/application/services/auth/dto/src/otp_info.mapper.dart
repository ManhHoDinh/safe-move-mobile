// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'otp_info.dart';

class OTPInfoMapper extends ClassMapperBase<OTPInfo> {
  OTPInfoMapper._();

  static OTPInfoMapper? _instance;
  static OTPInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OTPInfoMapper._());
      AuthMethodMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OTPInfo';

  static String? _$address(OTPInfo v) => v.address;
  static const Field<OTPInfo, String> _f$address =
      Field('address', _$address, opt: true);
  static AuthMethod? _$type(OTPInfo v) => v.type;
  static const Field<OTPInfo, AuthMethod> _f$type =
      Field('type', _$type, opt: true);
  static int? _$expiredIn(OTPInfo v) => v.expiredIn;
  static const Field<OTPInfo, int> _f$expiredIn =
      Field('expiredIn', _$expiredIn, opt: true);
  static String? _$otpSessionId(OTPInfo v) => v.otpSessionId;
  static const Field<OTPInfo, String> _f$otpSessionId =
      Field('otpSessionId', _$otpSessionId, opt: true);

  @override
  final MappableFields<OTPInfo> fields = const {
    #address: _f$address,
    #type: _f$type,
    #expiredIn: _f$expiredIn,
    #otpSessionId: _f$otpSessionId,
  };

  static OTPInfo _instantiate(DecodingData data) {
    return OTPInfo(
        address: data.dec(_f$address),
        type: data.dec(_f$type),
        expiredIn: data.dec(_f$expiredIn),
        otpSessionId: data.dec(_f$otpSessionId));
  }

  @override
  final Function instantiate = _instantiate;

  static OTPInfo fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OTPInfo>(map);
  }

  static OTPInfo fromJsonString(String json) {
    return ensureInitialized().decodeJson<OTPInfo>(json);
  }
}

mixin OTPInfoMappable {
  String toJsonString() {
    return OTPInfoMapper.ensureInitialized()
        .encodeJson<OTPInfo>(this as OTPInfo);
  }

  Map<String, dynamic> toJson() {
    return OTPInfoMapper.ensureInitialized()
        .encodeMap<OTPInfo>(this as OTPInfo);
  }

  OTPInfoCopyWith<OTPInfo, OTPInfo, OTPInfo> get copyWith =>
      _OTPInfoCopyWithImpl(this as OTPInfo, $identity, $identity);
  @override
  String toString() {
    return OTPInfoMapper.ensureInitialized().stringifyValue(this as OTPInfo);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OTPInfoMapper.ensureInitialized()
                .isValueEqual(this as OTPInfo, other));
  }

  @override
  int get hashCode {
    return OTPInfoMapper.ensureInitialized().hashValue(this as OTPInfo);
  }
}

extension OTPInfoValueCopy<$R, $Out> on ObjectCopyWith<$R, OTPInfo, $Out> {
  OTPInfoCopyWith<$R, OTPInfo, $Out> get $asOTPInfo =>
      $base.as((v, t, t2) => _OTPInfoCopyWithImpl(v, t, t2));
}

abstract class OTPInfoCopyWith<$R, $In extends OTPInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? address,
      AuthMethod? type,
      int? expiredIn,
      String? otpSessionId});
  OTPInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OTPInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OTPInfo, $Out>
    implements OTPInfoCopyWith<$R, OTPInfo, $Out> {
  _OTPInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OTPInfo> $mapper =
      OTPInfoMapper.ensureInitialized();
  @override
  $R call(
          {Object? address = $none,
          Object? type = $none,
          Object? expiredIn = $none,
          Object? otpSessionId = $none}) =>
      $apply(FieldCopyWithData({
        if (address != $none) #address: address,
        if (type != $none) #type: type,
        if (expiredIn != $none) #expiredIn: expiredIn,
        if (otpSessionId != $none) #otpSessionId: otpSessionId
      }));
  @override
  OTPInfo $make(CopyWithData data) => OTPInfo(
      address: data.get(#address, or: $value.address),
      type: data.get(#type, or: $value.type),
      expiredIn: data.get(#expiredIn, or: $value.expiredIn),
      otpSessionId: data.get(#otpSessionId, or: $value.otpSessionId));

  @override
  OTPInfoCopyWith<$R2, OTPInfo, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OTPInfoCopyWithImpl($value, $cast, t);
}
