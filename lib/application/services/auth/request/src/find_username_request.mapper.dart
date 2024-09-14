// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'find_username_request.dart';

class FindUsernameRequestMapper extends ClassMapperBase<FindUsernameRequest> {
  FindUsernameRequestMapper._();

  static FindUsernameRequestMapper? _instance;
  static FindUsernameRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FindUsernameRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FindUsernameRequest';

  static String _$sessionToken(FindUsernameRequest v) => v.sessionToken;
  static const Field<FindUsernameRequest, String> _f$sessionToken =
      Field('sessionToken', _$sessionToken);
  static String _$phoneNumber(FindUsernameRequest v) => v.phoneNumber;
  static const Field<FindUsernameRequest, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber);

  @override
  final MappableFields<FindUsernameRequest> fields = const {
    #sessionToken: _f$sessionToken,
    #phoneNumber: _f$phoneNumber,
  };

  static FindUsernameRequest _instantiate(DecodingData data) {
    return FindUsernameRequest(
        sessionToken: data.dec(_f$sessionToken),
        phoneNumber: data.dec(_f$phoneNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static FindUsernameRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FindUsernameRequest>(map);
  }

  static FindUsernameRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<FindUsernameRequest>(json);
  }
}

mixin FindUsernameRequestMappable {
  String toJsonString() {
    return FindUsernameRequestMapper.ensureInitialized()
        .encodeJson<FindUsernameRequest>(this as FindUsernameRequest);
  }

  Map<String, dynamic> toJson() {
    return FindUsernameRequestMapper.ensureInitialized()
        .encodeMap<FindUsernameRequest>(this as FindUsernameRequest);
  }

  FindUsernameRequestCopyWith<FindUsernameRequest, FindUsernameRequest,
          FindUsernameRequest>
      get copyWith => _FindUsernameRequestCopyWithImpl(
          this as FindUsernameRequest, $identity, $identity);
  @override
  String toString() {
    return FindUsernameRequestMapper.ensureInitialized()
        .stringifyValue(this as FindUsernameRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FindUsernameRequestMapper.ensureInitialized()
                .isValueEqual(this as FindUsernameRequest, other));
  }

  @override
  int get hashCode {
    return FindUsernameRequestMapper.ensureInitialized()
        .hashValue(this as FindUsernameRequest);
  }
}

extension FindUsernameRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FindUsernameRequest, $Out> {
  FindUsernameRequestCopyWith<$R, FindUsernameRequest, $Out>
      get $asFindUsernameRequest =>
          $base.as((v, t, t2) => _FindUsernameRequestCopyWithImpl(v, t, t2));
}

abstract class FindUsernameRequestCopyWith<$R, $In extends FindUsernameRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? sessionToken, String? phoneNumber});
  FindUsernameRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FindUsernameRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FindUsernameRequest, $Out>
    implements FindUsernameRequestCopyWith<$R, FindUsernameRequest, $Out> {
  _FindUsernameRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FindUsernameRequest> $mapper =
      FindUsernameRequestMapper.ensureInitialized();
  @override
  $R call({String? sessionToken, String? phoneNumber}) =>
      $apply(FieldCopyWithData({
        if (sessionToken != null) #sessionToken: sessionToken,
        if (phoneNumber != null) #phoneNumber: phoneNumber
      }));
  @override
  FindUsernameRequest $make(CopyWithData data) => FindUsernameRequest(
      sessionToken: data.get(#sessionToken, or: $value.sessionToken),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber));

  @override
  FindUsernameRequestCopyWith<$R2, FindUsernameRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FindUsernameRequestCopyWithImpl($value, $cast, t);
}
