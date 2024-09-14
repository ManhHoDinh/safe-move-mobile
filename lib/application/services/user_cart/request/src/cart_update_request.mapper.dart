// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cart_update_request.dart';

class CartUpdateRequestMapper extends ClassMapperBase<CartUpdateRequest> {
  CartUpdateRequestMapper._();

  static CartUpdateRequestMapper? _instance;
  static CartUpdateRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CartUpdateRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CartUpdateRequest';

  static int _$quantity(CartUpdateRequest v) => v.quantity;
  static const Field<CartUpdateRequest, int> _f$quantity =
      Field('quantity', _$quantity);

  @override
  final MappableFields<CartUpdateRequest> fields = const {
    #quantity: _f$quantity,
  };

  static CartUpdateRequest _instantiate(DecodingData data) {
    return CartUpdateRequest(quantity: data.dec(_f$quantity));
  }

  @override
  final Function instantiate = _instantiate;

  static CartUpdateRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CartUpdateRequest>(map);
  }

  static CartUpdateRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CartUpdateRequest>(json);
  }
}

mixin CartUpdateRequestMappable {
  String toJsonString() {
    return CartUpdateRequestMapper.ensureInitialized()
        .encodeJson<CartUpdateRequest>(this as CartUpdateRequest);
  }

  Map<String, dynamic> toJson() {
    return CartUpdateRequestMapper.ensureInitialized()
        .encodeMap<CartUpdateRequest>(this as CartUpdateRequest);
  }

  CartUpdateRequestCopyWith<CartUpdateRequest, CartUpdateRequest,
          CartUpdateRequest>
      get copyWith => _CartUpdateRequestCopyWithImpl(
          this as CartUpdateRequest, $identity, $identity);
  @override
  String toString() {
    return CartUpdateRequestMapper.ensureInitialized()
        .stringifyValue(this as CartUpdateRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CartUpdateRequestMapper.ensureInitialized()
                .isValueEqual(this as CartUpdateRequest, other));
  }

  @override
  int get hashCode {
    return CartUpdateRequestMapper.ensureInitialized()
        .hashValue(this as CartUpdateRequest);
  }
}

extension CartUpdateRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CartUpdateRequest, $Out> {
  CartUpdateRequestCopyWith<$R, CartUpdateRequest, $Out>
      get $asCartUpdateRequest =>
          $base.as((v, t, t2) => _CartUpdateRequestCopyWithImpl(v, t, t2));
}

abstract class CartUpdateRequestCopyWith<$R, $In extends CartUpdateRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? quantity});
  CartUpdateRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CartUpdateRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CartUpdateRequest, $Out>
    implements CartUpdateRequestCopyWith<$R, CartUpdateRequest, $Out> {
  _CartUpdateRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CartUpdateRequest> $mapper =
      CartUpdateRequestMapper.ensureInitialized();
  @override
  $R call({int? quantity}) =>
      $apply(FieldCopyWithData({if (quantity != null) #quantity: quantity}));
  @override
  CartUpdateRequest $make(CopyWithData data) =>
      CartUpdateRequest(quantity: data.get(#quantity, or: $value.quantity));

  @override
  CartUpdateRequestCopyWith<$R2, CartUpdateRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CartUpdateRequestCopyWithImpl($value, $cast, t);
}
