// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_category_by_id_request.dart';

class GetCategoryByIdRequestMapper
    extends ClassMapperBase<GetCategoryByIdRequest> {
  GetCategoryByIdRequestMapper._();

  static GetCategoryByIdRequestMapper? _instance;
  static GetCategoryByIdRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetCategoryByIdRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GetCategoryByIdRequest';

  static int _$id(GetCategoryByIdRequest v) => v.id;
  static const Field<GetCategoryByIdRequest, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<GetCategoryByIdRequest> fields = const {
    #id: _f$id,
  };

  static GetCategoryByIdRequest _instantiate(DecodingData data) {
    return GetCategoryByIdRequest(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static GetCategoryByIdRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetCategoryByIdRequest>(map);
  }

  static GetCategoryByIdRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<GetCategoryByIdRequest>(json);
  }
}

mixin GetCategoryByIdRequestMappable {
  String toJsonString() {
    return GetCategoryByIdRequestMapper.ensureInitialized()
        .encodeJson<GetCategoryByIdRequest>(this as GetCategoryByIdRequest);
  }

  Map<String, dynamic> toJson() {
    return GetCategoryByIdRequestMapper.ensureInitialized()
        .encodeMap<GetCategoryByIdRequest>(this as GetCategoryByIdRequest);
  }

  GetCategoryByIdRequestCopyWith<GetCategoryByIdRequest, GetCategoryByIdRequest,
          GetCategoryByIdRequest>
      get copyWith => _GetCategoryByIdRequestCopyWithImpl(
          this as GetCategoryByIdRequest, $identity, $identity);
  @override
  String toString() {
    return GetCategoryByIdRequestMapper.ensureInitialized()
        .stringifyValue(this as GetCategoryByIdRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GetCategoryByIdRequestMapper.ensureInitialized()
                .isValueEqual(this as GetCategoryByIdRequest, other));
  }

  @override
  int get hashCode {
    return GetCategoryByIdRequestMapper.ensureInitialized()
        .hashValue(this as GetCategoryByIdRequest);
  }
}

extension GetCategoryByIdRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetCategoryByIdRequest, $Out> {
  GetCategoryByIdRequestCopyWith<$R, GetCategoryByIdRequest, $Out>
      get $asGetCategoryByIdRequest =>
          $base.as((v, t, t2) => _GetCategoryByIdRequestCopyWithImpl(v, t, t2));
}

abstract class GetCategoryByIdRequestCopyWith<
    $R,
    $In extends GetCategoryByIdRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id});
  GetCategoryByIdRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetCategoryByIdRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetCategoryByIdRequest, $Out>
    implements
        GetCategoryByIdRequestCopyWith<$R, GetCategoryByIdRequest, $Out> {
  _GetCategoryByIdRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetCategoryByIdRequest> $mapper =
      GetCategoryByIdRequestMapper.ensureInitialized();
  @override
  $R call({int? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  GetCategoryByIdRequest $make(CopyWithData data) =>
      GetCategoryByIdRequest(id: data.get(#id, or: $value.id));

  @override
  GetCategoryByIdRequestCopyWith<$R2, GetCategoryByIdRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetCategoryByIdRequestCopyWithImpl($value, $cast, t);
}
