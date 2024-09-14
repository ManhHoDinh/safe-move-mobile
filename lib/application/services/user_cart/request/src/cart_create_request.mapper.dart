// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cart_create_request.dart';

class CartCreateRequestMapper extends ClassMapperBase<CartCreateRequest> {
  CartCreateRequestMapper._();

  static CartCreateRequestMapper? _instance;
  static CartCreateRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CartCreateRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CartCreateRequest';

  static int _$productId(CartCreateRequest v) => v.productId;
  static const Field<CartCreateRequest, int> _f$productId =
      Field('productId', _$productId);
  static int _$quantity(CartCreateRequest v) => v.quantity;
  static const Field<CartCreateRequest, int> _f$quantity =
      Field('quantity', _$quantity);

  @override
  final MappableFields<CartCreateRequest> fields = const {
    #productId: _f$productId,
    #quantity: _f$quantity,
  };

  static CartCreateRequest _instantiate(DecodingData data) {
    return CartCreateRequest(
        productId: data.dec(_f$productId), quantity: data.dec(_f$quantity));
  }

  @override
  final Function instantiate = _instantiate;

  static CartCreateRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CartCreateRequest>(map);
  }

  static CartCreateRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CartCreateRequest>(json);
  }
}

mixin CartCreateRequestMappable {
  String toJsonString() {
    return CartCreateRequestMapper.ensureInitialized()
        .encodeJson<CartCreateRequest>(this as CartCreateRequest);
  }

  Map<String, dynamic> toJson() {
    return CartCreateRequestMapper.ensureInitialized()
        .encodeMap<CartCreateRequest>(this as CartCreateRequest);
  }

  CartCreateRequestCopyWith<CartCreateRequest, CartCreateRequest,
          CartCreateRequest>
      get copyWith => _CartCreateRequestCopyWithImpl(
          this as CartCreateRequest, $identity, $identity);
  @override
  String toString() {
    return CartCreateRequestMapper.ensureInitialized()
        .stringifyValue(this as CartCreateRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CartCreateRequestMapper.ensureInitialized()
                .isValueEqual(this as CartCreateRequest, other));
  }

  @override
  int get hashCode {
    return CartCreateRequestMapper.ensureInitialized()
        .hashValue(this as CartCreateRequest);
  }
}

extension CartCreateRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CartCreateRequest, $Out> {
  CartCreateRequestCopyWith<$R, CartCreateRequest, $Out>
      get $asCartCreateRequest =>
          $base.as((v, t, t2) => _CartCreateRequestCopyWithImpl(v, t, t2));
}

abstract class CartCreateRequestCopyWith<$R, $In extends CartCreateRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? productId, int? quantity});
  CartCreateRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CartCreateRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CartCreateRequest, $Out>
    implements CartCreateRequestCopyWith<$R, CartCreateRequest, $Out> {
  _CartCreateRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CartCreateRequest> $mapper =
      CartCreateRequestMapper.ensureInitialized();
  @override
  $R call({int? productId, int? quantity}) => $apply(FieldCopyWithData({
        if (productId != null) #productId: productId,
        if (quantity != null) #quantity: quantity
      }));
  @override
  CartCreateRequest $make(CopyWithData data) => CartCreateRequest(
      productId: data.get(#productId, or: $value.productId),
      quantity: data.get(#quantity, or: $value.quantity));

  @override
  CartCreateRequestCopyWith<$R2, CartCreateRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CartCreateRequestCopyWithImpl($value, $cast, t);
}
