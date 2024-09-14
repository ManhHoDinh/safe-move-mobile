// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'favorite_category_request.dart';

class FavoriteCategoryRequestMapper
    extends ClassMapperBase<FavoriteCategoryRequest> {
  FavoriteCategoryRequestMapper._();

  static FavoriteCategoryRequestMapper? _instance;
  static FavoriteCategoryRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FavoriteCategoryRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FavoriteCategoryRequest';

  static bool _$isFavorite(FavoriteCategoryRequest v) => v.isFavorite;
  static const Field<FavoriteCategoryRequest, bool> _f$isFavorite =
      Field('isFavorite', _$isFavorite);

  @override
  final MappableFields<FavoriteCategoryRequest> fields = const {
    #isFavorite: _f$isFavorite,
  };

  static FavoriteCategoryRequest _instantiate(DecodingData data) {
    return FavoriteCategoryRequest(isFavorite: data.dec(_f$isFavorite));
  }

  @override
  final Function instantiate = _instantiate;

  static FavoriteCategoryRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FavoriteCategoryRequest>(map);
  }

  static FavoriteCategoryRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<FavoriteCategoryRequest>(json);
  }
}

mixin FavoriteCategoryRequestMappable {
  String toJsonString() {
    return FavoriteCategoryRequestMapper.ensureInitialized()
        .encodeJson<FavoriteCategoryRequest>(this as FavoriteCategoryRequest);
  }

  Map<String, dynamic> toJson() {
    return FavoriteCategoryRequestMapper.ensureInitialized()
        .encodeMap<FavoriteCategoryRequest>(this as FavoriteCategoryRequest);
  }

  FavoriteCategoryRequestCopyWith<FavoriteCategoryRequest,
          FavoriteCategoryRequest, FavoriteCategoryRequest>
      get copyWith => _FavoriteCategoryRequestCopyWithImpl(
          this as FavoriteCategoryRequest, $identity, $identity);
  @override
  String toString() {
    return FavoriteCategoryRequestMapper.ensureInitialized()
        .stringifyValue(this as FavoriteCategoryRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FavoriteCategoryRequestMapper.ensureInitialized()
                .isValueEqual(this as FavoriteCategoryRequest, other));
  }

  @override
  int get hashCode {
    return FavoriteCategoryRequestMapper.ensureInitialized()
        .hashValue(this as FavoriteCategoryRequest);
  }
}

extension FavoriteCategoryRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FavoriteCategoryRequest, $Out> {
  FavoriteCategoryRequestCopyWith<$R, FavoriteCategoryRequest, $Out>
      get $asFavoriteCategoryRequest => $base
          .as((v, t, t2) => _FavoriteCategoryRequestCopyWithImpl(v, t, t2));
}

abstract class FavoriteCategoryRequestCopyWith<
    $R,
    $In extends FavoriteCategoryRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isFavorite});
  FavoriteCategoryRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FavoriteCategoryRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FavoriteCategoryRequest, $Out>
    implements
        FavoriteCategoryRequestCopyWith<$R, FavoriteCategoryRequest, $Out> {
  _FavoriteCategoryRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FavoriteCategoryRequest> $mapper =
      FavoriteCategoryRequestMapper.ensureInitialized();
  @override
  $R call({bool? isFavorite}) => $apply(
      FieldCopyWithData({if (isFavorite != null) #isFavorite: isFavorite}));
  @override
  FavoriteCategoryRequest $make(CopyWithData data) => FavoriteCategoryRequest(
      isFavorite: data.get(#isFavorite, or: $value.isFavorite));

  @override
  FavoriteCategoryRequestCopyWith<$R2, FavoriteCategoryRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FavoriteCategoryRequestCopyWithImpl($value, $cast, t);
}
