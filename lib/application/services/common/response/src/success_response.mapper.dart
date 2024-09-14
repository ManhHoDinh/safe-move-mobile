// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'success_response.dart';

class SuccessResponseMapper extends ClassMapperBase<SuccessResponse> {
  SuccessResponseMapper._();

  static SuccessResponseMapper? _instance;
  static SuccessResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SuccessResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SuccessResponse';

  static bool? _$success(SuccessResponse v) => v.success;
  static const Field<SuccessResponse, bool> _f$success =
      Field('success', _$success, opt: true);

  @override
  final MappableFields<SuccessResponse> fields = const {
    #success: _f$success,
  };

  static SuccessResponse _instantiate(DecodingData data) {
    return SuccessResponse(success: data.dec(_f$success));
  }

  @override
  final Function instantiate = _instantiate;

  static SuccessResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SuccessResponse>(map);
  }

  static SuccessResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<SuccessResponse>(json);
  }
}

mixin SuccessResponseMappable {
  String toJsonString() {
    return SuccessResponseMapper.ensureInitialized()
        .encodeJson<SuccessResponse>(this as SuccessResponse);
  }

  Map<String, dynamic> toJson() {
    return SuccessResponseMapper.ensureInitialized()
        .encodeMap<SuccessResponse>(this as SuccessResponse);
  }

  SuccessResponseCopyWith<SuccessResponse, SuccessResponse, SuccessResponse>
      get copyWith => _SuccessResponseCopyWithImpl(
          this as SuccessResponse, $identity, $identity);
  @override
  String toString() {
    return SuccessResponseMapper.ensureInitialized()
        .stringifyValue(this as SuccessResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SuccessResponseMapper.ensureInitialized()
                .isValueEqual(this as SuccessResponse, other));
  }

  @override
  int get hashCode {
    return SuccessResponseMapper.ensureInitialized()
        .hashValue(this as SuccessResponse);
  }
}

extension SuccessResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SuccessResponse, $Out> {
  SuccessResponseCopyWith<$R, SuccessResponse, $Out> get $asSuccessResponse =>
      $base.as((v, t, t2) => _SuccessResponseCopyWithImpl(v, t, t2));
}

abstract class SuccessResponseCopyWith<$R, $In extends SuccessResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? success});
  SuccessResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SuccessResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SuccessResponse, $Out>
    implements SuccessResponseCopyWith<$R, SuccessResponse, $Out> {
  _SuccessResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SuccessResponse> $mapper =
      SuccessResponseMapper.ensureInitialized();
  @override
  $R call({Object? success = $none}) =>
      $apply(FieldCopyWithData({if (success != $none) #success: success}));
  @override
  SuccessResponse $make(CopyWithData data) =>
      SuccessResponse(success: data.get(#success, or: $value.success));

  @override
  SuccessResponseCopyWith<$R2, SuccessResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SuccessResponseCopyWithImpl($value, $cast, t);
}
