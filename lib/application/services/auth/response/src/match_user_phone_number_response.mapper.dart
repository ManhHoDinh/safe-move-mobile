// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_user_phone_number_response.dart';

class MatchUserPhoneNumberResponseMapper
    extends ClassMapperBase<MatchUserPhoneNumberResponse> {
  MatchUserPhoneNumberResponseMapper._();

  static MatchUserPhoneNumberResponseMapper? _instance;
  static MatchUserPhoneNumberResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MatchUserPhoneNumberResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MatchUserPhoneNumberResponse';

  static bool? _$matched(MatchUserPhoneNumberResponse v) => v.matched;
  static const Field<MatchUserPhoneNumberResponse, bool> _f$matched =
      Field('matched', _$matched, opt: true);

  @override
  final MappableFields<MatchUserPhoneNumberResponse> fields = const {
    #matched: _f$matched,
  };

  static MatchUserPhoneNumberResponse _instantiate(DecodingData data) {
    return MatchUserPhoneNumberResponse(matched: data.dec(_f$matched));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchUserPhoneNumberResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchUserPhoneNumberResponse>(map);
  }

  static MatchUserPhoneNumberResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<MatchUserPhoneNumberResponse>(json);
  }
}

mixin MatchUserPhoneNumberResponseMappable {
  String toJsonString() {
    return MatchUserPhoneNumberResponseMapper.ensureInitialized()
        .encodeJson<MatchUserPhoneNumberResponse>(
            this as MatchUserPhoneNumberResponse);
  }

  Map<String, dynamic> toJson() {
    return MatchUserPhoneNumberResponseMapper.ensureInitialized()
        .encodeMap<MatchUserPhoneNumberResponse>(
            this as MatchUserPhoneNumberResponse);
  }

  MatchUserPhoneNumberResponseCopyWith<MatchUserPhoneNumberResponse,
          MatchUserPhoneNumberResponse, MatchUserPhoneNumberResponse>
      get copyWith => _MatchUserPhoneNumberResponseCopyWithImpl(
          this as MatchUserPhoneNumberResponse, $identity, $identity);
  @override
  String toString() {
    return MatchUserPhoneNumberResponseMapper.ensureInitialized()
        .stringifyValue(this as MatchUserPhoneNumberResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MatchUserPhoneNumberResponseMapper.ensureInitialized()
                .isValueEqual(this as MatchUserPhoneNumberResponse, other));
  }

  @override
  int get hashCode {
    return MatchUserPhoneNumberResponseMapper.ensureInitialized()
        .hashValue(this as MatchUserPhoneNumberResponse);
  }
}

extension MatchUserPhoneNumberResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchUserPhoneNumberResponse, $Out> {
  MatchUserPhoneNumberResponseCopyWith<$R, MatchUserPhoneNumberResponse, $Out>
      get $asMatchUserPhoneNumberResponse => $base.as(
          (v, t, t2) => _MatchUserPhoneNumberResponseCopyWithImpl(v, t, t2));
}

abstract class MatchUserPhoneNumberResponseCopyWith<
    $R,
    $In extends MatchUserPhoneNumberResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? matched});
  MatchUserPhoneNumberResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MatchUserPhoneNumberResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchUserPhoneNumberResponse, $Out>
    implements
        MatchUserPhoneNumberResponseCopyWith<$R, MatchUserPhoneNumberResponse,
            $Out> {
  _MatchUserPhoneNumberResponseCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchUserPhoneNumberResponse> $mapper =
      MatchUserPhoneNumberResponseMapper.ensureInitialized();
  @override
  $R call({Object? matched = $none}) =>
      $apply(FieldCopyWithData({if (matched != $none) #matched: matched}));
  @override
  MatchUserPhoneNumberResponse $make(CopyWithData data) =>
      MatchUserPhoneNumberResponse(
          matched: data.get(#matched, or: $value.matched));

  @override
  MatchUserPhoneNumberResponseCopyWith<$R2, MatchUserPhoneNumberResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MatchUserPhoneNumberResponseCopyWithImpl($value, $cast, t);
}
