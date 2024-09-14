// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'logout_request.dart';

class LogoutRequestMapper extends ClassMapperBase<LogoutRequest> {
  LogoutRequestMapper._();

  static LogoutRequestMapper? _instance;
  static LogoutRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LogoutRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LogoutRequest';

  static String _$refreshToken(LogoutRequest v) => v.refreshToken;
  static const Field<LogoutRequest, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken);

  @override
  final MappableFields<LogoutRequest> fields = const {
    #refreshToken: _f$refreshToken,
  };

  static LogoutRequest _instantiate(DecodingData data) {
    return LogoutRequest(refreshToken: data.dec(_f$refreshToken));
  }

  @override
  final Function instantiate = _instantiate;

  static LogoutRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LogoutRequest>(map);
  }

  static LogoutRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<LogoutRequest>(json);
  }
}

mixin LogoutRequestMappable {
  String toJsonString() {
    return LogoutRequestMapper.ensureInitialized()
        .encodeJson<LogoutRequest>(this as LogoutRequest);
  }

  Map<String, dynamic> toJson() {
    return LogoutRequestMapper.ensureInitialized()
        .encodeMap<LogoutRequest>(this as LogoutRequest);
  }

  LogoutRequestCopyWith<LogoutRequest, LogoutRequest, LogoutRequest>
      get copyWith => _LogoutRequestCopyWithImpl(
          this as LogoutRequest, $identity, $identity);
  @override
  String toString() {
    return LogoutRequestMapper.ensureInitialized()
        .stringifyValue(this as LogoutRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LogoutRequestMapper.ensureInitialized()
                .isValueEqual(this as LogoutRequest, other));
  }

  @override
  int get hashCode {
    return LogoutRequestMapper.ensureInitialized()
        .hashValue(this as LogoutRequest);
  }
}

extension LogoutRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LogoutRequest, $Out> {
  LogoutRequestCopyWith<$R, LogoutRequest, $Out> get $asLogoutRequest =>
      $base.as((v, t, t2) => _LogoutRequestCopyWithImpl(v, t, t2));
}

abstract class LogoutRequestCopyWith<$R, $In extends LogoutRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? refreshToken});
  LogoutRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LogoutRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LogoutRequest, $Out>
    implements LogoutRequestCopyWith<$R, LogoutRequest, $Out> {
  _LogoutRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LogoutRequest> $mapper =
      LogoutRequestMapper.ensureInitialized();
  @override
  $R call({String? refreshToken}) => $apply(FieldCopyWithData(
      {if (refreshToken != null) #refreshToken: refreshToken}));
  @override
  LogoutRequest $make(CopyWithData data) => LogoutRequest(
      refreshToken: data.get(#refreshToken, or: $value.refreshToken));

  @override
  LogoutRequestCopyWith<$R2, LogoutRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LogoutRequestCopyWithImpl($value, $cast, t);
}
