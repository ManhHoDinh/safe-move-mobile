// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cart_delete_request.dart';

class CartDeleteRequestMapper extends ClassMapperBase<CartDeleteRequest> {
  CartDeleteRequestMapper._();

  static CartDeleteRequestMapper? _instance;
  static CartDeleteRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CartDeleteRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CartDeleteRequest';

  static List<int> _$ids(CartDeleteRequest v) => v.ids;
  static const Field<CartDeleteRequest, List<int>> _f$ids = Field('ids', _$ids);

  @override
  final MappableFields<CartDeleteRequest> fields = const {
    #ids: _f$ids,
  };

  static CartDeleteRequest _instantiate(DecodingData data) {
    return CartDeleteRequest(ids: data.dec(_f$ids));
  }

  @override
  final Function instantiate = _instantiate;

  static CartDeleteRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CartDeleteRequest>(map);
  }

  static CartDeleteRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CartDeleteRequest>(json);
  }
}

mixin CartDeleteRequestMappable {
  String toJsonString() {
    return CartDeleteRequestMapper.ensureInitialized()
        .encodeJson<CartDeleteRequest>(this as CartDeleteRequest);
  }

  Map<String, dynamic> toJson() {
    return CartDeleteRequestMapper.ensureInitialized()
        .encodeMap<CartDeleteRequest>(this as CartDeleteRequest);
  }

  CartDeleteRequestCopyWith<CartDeleteRequest, CartDeleteRequest,
          CartDeleteRequest>
      get copyWith => _CartDeleteRequestCopyWithImpl(
          this as CartDeleteRequest, $identity, $identity);
  @override
  String toString() {
    return CartDeleteRequestMapper.ensureInitialized()
        .stringifyValue(this as CartDeleteRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CartDeleteRequestMapper.ensureInitialized()
                .isValueEqual(this as CartDeleteRequest, other));
  }

  @override
  int get hashCode {
    return CartDeleteRequestMapper.ensureInitialized()
        .hashValue(this as CartDeleteRequest);
  }
}

extension CartDeleteRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CartDeleteRequest, $Out> {
  CartDeleteRequestCopyWith<$R, CartDeleteRequest, $Out>
      get $asCartDeleteRequest =>
          $base.as((v, t, t2) => _CartDeleteRequestCopyWithImpl(v, t, t2));
}

abstract class CartDeleteRequestCopyWith<$R, $In extends CartDeleteRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get ids;
  $R call({List<int>? ids});
  CartDeleteRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CartDeleteRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CartDeleteRequest, $Out>
    implements CartDeleteRequestCopyWith<$R, CartDeleteRequest, $Out> {
  _CartDeleteRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CartDeleteRequest> $mapper =
      CartDeleteRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get ids => ListCopyWith(
      $value.ids,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(ids: v));
  @override
  $R call({List<int>? ids}) =>
      $apply(FieldCopyWithData({if (ids != null) #ids: ids}));
  @override
  CartDeleteRequest $make(CopyWithData data) =>
      CartDeleteRequest(ids: data.get(#ids, or: $value.ids));

  @override
  CartDeleteRequestCopyWith<$R2, CartDeleteRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CartDeleteRequestCopyWithImpl($value, $cast, t);
}
