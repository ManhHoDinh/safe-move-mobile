// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'get_all_category_request.dart';

class GetAllCategoryRequestMapper
    extends ClassMapperBase<GetAllCategoryRequest> {
  GetAllCategoryRequestMapper._();

  static GetAllCategoryRequestMapper? _instance;
  static GetAllCategoryRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetAllCategoryRequestMapper._());
      CategoryTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GetAllCategoryRequest';

  static List<CategoryType> _$include(GetAllCategoryRequest v) => v.include;
  static const Field<GetAllCategoryRequest, List<CategoryType>> _f$include =
      Field('include', _$include);

  @override
  final MappableFields<GetAllCategoryRequest> fields = const {
    #include: _f$include,
  };

  static GetAllCategoryRequest _instantiate(DecodingData data) {
    return GetAllCategoryRequest(include: data.dec(_f$include));
  }

  @override
  final Function instantiate = _instantiate;

  static GetAllCategoryRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetAllCategoryRequest>(map);
  }

  static GetAllCategoryRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<GetAllCategoryRequest>(json);
  }
}

mixin GetAllCategoryRequestMappable {
  String toJsonString() {
    return GetAllCategoryRequestMapper.ensureInitialized()
        .encodeJson<GetAllCategoryRequest>(this as GetAllCategoryRequest);
  }

  Map<String, dynamic> toJson() {
    return GetAllCategoryRequestMapper.ensureInitialized()
        .encodeMap<GetAllCategoryRequest>(this as GetAllCategoryRequest);
  }

  GetAllCategoryRequestCopyWith<GetAllCategoryRequest, GetAllCategoryRequest,
          GetAllCategoryRequest>
      get copyWith => _GetAllCategoryRequestCopyWithImpl(
          this as GetAllCategoryRequest, $identity, $identity);
  @override
  String toString() {
    return GetAllCategoryRequestMapper.ensureInitialized()
        .stringifyValue(this as GetAllCategoryRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GetAllCategoryRequestMapper.ensureInitialized()
                .isValueEqual(this as GetAllCategoryRequest, other));
  }

  @override
  int get hashCode {
    return GetAllCategoryRequestMapper.ensureInitialized()
        .hashValue(this as GetAllCategoryRequest);
  }
}

extension GetAllCategoryRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetAllCategoryRequest, $Out> {
  GetAllCategoryRequestCopyWith<$R, GetAllCategoryRequest, $Out>
      get $asGetAllCategoryRequest =>
          $base.as((v, t, t2) => _GetAllCategoryRequestCopyWithImpl(v, t, t2));
}

abstract class GetAllCategoryRequestCopyWith<
    $R,
    $In extends GetAllCategoryRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, CategoryType, ObjectCopyWith<$R, CategoryType, CategoryType>>
      get include;
  $R call({List<CategoryType>? include});
  GetAllCategoryRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GetAllCategoryRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetAllCategoryRequest, $Out>
    implements GetAllCategoryRequestCopyWith<$R, GetAllCategoryRequest, $Out> {
  _GetAllCategoryRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetAllCategoryRequest> $mapper =
      GetAllCategoryRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, CategoryType, ObjectCopyWith<$R, CategoryType, CategoryType>>
      get include => ListCopyWith($value.include,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(include: v));
  @override
  $R call({List<CategoryType>? include}) =>
      $apply(FieldCopyWithData({if (include != null) #include: include}));
  @override
  GetAllCategoryRequest $make(CopyWithData data) =>
      GetAllCategoryRequest(include: data.get(#include, or: $value.include));

  @override
  GetAllCategoryRequestCopyWith<$R2, GetAllCategoryRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GetAllCategoryRequestCopyWithImpl($value, $cast, t);
}
