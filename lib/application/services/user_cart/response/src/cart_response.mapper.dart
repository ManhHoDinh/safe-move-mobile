// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cart_response.dart';

class CartResponseMapper extends ClassMapperBase<CartResponse> {
  CartResponseMapper._();

  static CartResponseMapper? _instance;
  static CartResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CartResponseMapper._());
      UserDTOMapper.ensureInitialized();
      ProductResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CartResponse';

  static int? _$id(CartResponse v) => v.id;
  static const Field<CartResponse, int> _f$id = Field('id', _$id, opt: true);
  static UserDTO? _$user(CartResponse v) => v.user;
  static const Field<CartResponse, UserDTO> _f$user =
      Field('user', _$user, opt: true);
  static ProductResponse? _$product(CartResponse v) => v.product;
  static const Field<CartResponse, ProductResponse> _f$product =
      Field('product', _$product, opt: true);
  static int? _$quantity(CartResponse v) => v.quantity;
  static const Field<CartResponse, int> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static DateTime? _$createdAt(CartResponse v) => v.createdAt;
  static const Field<CartResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(CartResponse v) => v.updatedAt;
  static const Field<CartResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<CartResponse> fields = const {
    #id: _f$id,
    #user: _f$user,
    #product: _f$product,
    #quantity: _f$quantity,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static CartResponse _instantiate(DecodingData data) {
    return CartResponse(
        id: data.dec(_f$id),
        user: data.dec(_f$user),
        product: data.dec(_f$product),
        quantity: data.dec(_f$quantity),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static CartResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CartResponse>(map);
  }

  static CartResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<CartResponse>(json);
  }
}

mixin CartResponseMappable {
  String toJsonString() {
    return CartResponseMapper.ensureInitialized()
        .encodeJson<CartResponse>(this as CartResponse);
  }

  Map<String, dynamic> toJson() {
    return CartResponseMapper.ensureInitialized()
        .encodeMap<CartResponse>(this as CartResponse);
  }

  CartResponseCopyWith<CartResponse, CartResponse, CartResponse> get copyWith =>
      _CartResponseCopyWithImpl(this as CartResponse, $identity, $identity);
  @override
  String toString() {
    return CartResponseMapper.ensureInitialized()
        .stringifyValue(this as CartResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CartResponseMapper.ensureInitialized()
                .isValueEqual(this as CartResponse, other));
  }

  @override
  int get hashCode {
    return CartResponseMapper.ensureInitialized()
        .hashValue(this as CartResponse);
  }
}

extension CartResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CartResponse, $Out> {
  CartResponseCopyWith<$R, CartResponse, $Out> get $asCartResponse =>
      $base.as((v, t, t2) => _CartResponseCopyWithImpl(v, t, t2));
}

abstract class CartResponseCopyWith<$R, $In extends CartResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user;
  ProductResponseCopyWith<$R, ProductResponse, ProductResponse>? get product;
  $R call(
      {int? id,
      UserDTO? user,
      ProductResponse? product,
      int? quantity,
      DateTime? createdAt,
      DateTime? updatedAt});
  CartResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CartResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CartResponse, $Out>
    implements CartResponseCopyWith<$R, CartResponse, $Out> {
  _CartResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CartResponse> $mapper =
      CartResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  ProductResponseCopyWith<$R, ProductResponse, ProductResponse>? get product =>
      $value.product?.copyWith.$chain((v) => call(product: v));
  @override
  $R call(
          {Object? id = $none,
          Object? user = $none,
          Object? product = $none,
          Object? quantity = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (user != $none) #user: user,
        if (product != $none) #product: product,
        if (quantity != $none) #quantity: quantity,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  CartResponse $make(CopyWithData data) => CartResponse(
      id: data.get(#id, or: $value.id),
      user: data.get(#user, or: $value.user),
      product: data.get(#product, or: $value.product),
      quantity: data.get(#quantity, or: $value.quantity),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  CartResponseCopyWith<$R2, CartResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CartResponseCopyWithImpl($value, $cast, t);
}
