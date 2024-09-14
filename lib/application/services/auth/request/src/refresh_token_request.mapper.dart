// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'refresh_token_request.dart';

class RefreshTokenRequestMapper extends ClassMapperBase<RefreshTokenRequest> {
  RefreshTokenRequestMapper._();

  static RefreshTokenRequestMapper? _instance;
  static RefreshTokenRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RefreshTokenRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RefreshTokenRequest';

  static String _$refreshToken(RefreshTokenRequest v) => v.refreshToken;
  static const Field<RefreshTokenRequest, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken);

  @override
  final MappableFields<RefreshTokenRequest> fields = const {
    #refreshToken: _f$refreshToken,
  };

  static RefreshTokenRequest _instantiate(DecodingData data) {
    return RefreshTokenRequest(refreshToken: data.dec(_f$refreshToken));
  }

  @override
  final Function instantiate = _instantiate;

  static RefreshTokenRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RefreshTokenRequest>(map);
  }

  static RefreshTokenRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<RefreshTokenRequest>(json);
  }
}

mixin RefreshTokenRequestMappable {
  String toJsonString() {
    return RefreshTokenRequestMapper.ensureInitialized()
        .encodeJson<RefreshTokenRequest>(this as RefreshTokenRequest);
  }

  Map<String, dynamic> toJson() {
    return RefreshTokenRequestMapper.ensureInitialized()
        .encodeMap<RefreshTokenRequest>(this as RefreshTokenRequest);
  }

  RefreshTokenRequestCopyWith<RefreshTokenRequest, RefreshTokenRequest,
          RefreshTokenRequest>
      get copyWith => _RefreshTokenRequestCopyWithImpl(
          this as RefreshTokenRequest, $identity, $identity);
  @override
  String toString() {
    return RefreshTokenRequestMapper.ensureInitialized()
        .stringifyValue(this as RefreshTokenRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RefreshTokenRequestMapper.ensureInitialized()
                .isValueEqual(this as RefreshTokenRequest, other));
  }

  @override
  int get hashCode {
    return RefreshTokenRequestMapper.ensureInitialized()
        .hashValue(this as RefreshTokenRequest);
  }
}

extension RefreshTokenRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RefreshTokenRequest, $Out> {
  RefreshTokenRequestCopyWith<$R, RefreshTokenRequest, $Out>
      get $asRefreshTokenRequest =>
          $base.as((v, t, t2) => _RefreshTokenRequestCopyWithImpl(v, t, t2));
}

abstract class RefreshTokenRequestCopyWith<$R, $In extends RefreshTokenRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? refreshToken});
  RefreshTokenRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RefreshTokenRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RefreshTokenRequest, $Out>
    implements RefreshTokenRequestCopyWith<$R, RefreshTokenRequest, $Out> {
  _RefreshTokenRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RefreshTokenRequest> $mapper =
      RefreshTokenRequestMapper.ensureInitialized();
  @override
  $R call({String? refreshToken}) => $apply(FieldCopyWithData(
      {if (refreshToken != null) #refreshToken: refreshToken}));
  @override
  RefreshTokenRequest $make(CopyWithData data) => RefreshTokenRequest(
      refreshToken: data.get(#refreshToken, or: $value.refreshToken));

  @override
  RefreshTokenRequestCopyWith<$R2, RefreshTokenRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _RefreshTokenRequestCopyWithImpl($value, $cast, t);
}
