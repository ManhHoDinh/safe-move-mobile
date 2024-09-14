// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_details_session_create_request.dart';

class OrderDetailsSessionCreateRequestMapper
    extends ClassMapperBase<OrderDetailsSessionCreateRequest> {
  OrderDetailsSessionCreateRequestMapper._();

  static OrderDetailsSessionCreateRequestMapper? _instance;
  static OrderDetailsSessionCreateRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OrderDetailsSessionCreateRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OrderDetailsSessionCreateRequest';

  static int _$productId(OrderDetailsSessionCreateRequest v) => v.productId;
  static const Field<OrderDetailsSessionCreateRequest, int> _f$productId =
      Field('productId', _$productId);
  static double _$currentPrice(OrderDetailsSessionCreateRequest v) =>
      v.currentPrice;
  static const Field<OrderDetailsSessionCreateRequest, double> _f$currentPrice =
      Field('currentPrice', _$currentPrice);
  static int _$quantity(OrderDetailsSessionCreateRequest v) => v.quantity;
  static const Field<OrderDetailsSessionCreateRequest, int> _f$quantity =
      Field('quantity', _$quantity);

  @override
  final MappableFields<OrderDetailsSessionCreateRequest> fields = const {
    #productId: _f$productId,
    #currentPrice: _f$currentPrice,
    #quantity: _f$quantity,
  };

  static OrderDetailsSessionCreateRequest _instantiate(DecodingData data) {
    return OrderDetailsSessionCreateRequest(
        productId: data.dec(_f$productId),
        currentPrice: data.dec(_f$currentPrice),
        quantity: data.dec(_f$quantity));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderDetailsSessionCreateRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderDetailsSessionCreateRequest>(map);
  }

  static OrderDetailsSessionCreateRequest fromJsonString(String json) {
    return ensureInitialized()
        .decodeJson<OrderDetailsSessionCreateRequest>(json);
  }
}

mixin OrderDetailsSessionCreateRequestMappable {
  String toJsonString() {
    return OrderDetailsSessionCreateRequestMapper.ensureInitialized()
        .encodeJson<OrderDetailsSessionCreateRequest>(
            this as OrderDetailsSessionCreateRequest);
  }

  Map<String, dynamic> toJson() {
    return OrderDetailsSessionCreateRequestMapper.ensureInitialized()
        .encodeMap<OrderDetailsSessionCreateRequest>(
            this as OrderDetailsSessionCreateRequest);
  }

  OrderDetailsSessionCreateRequestCopyWith<OrderDetailsSessionCreateRequest,
          OrderDetailsSessionCreateRequest, OrderDetailsSessionCreateRequest>
      get copyWith => _OrderDetailsSessionCreateRequestCopyWithImpl(
          this as OrderDetailsSessionCreateRequest, $identity, $identity);
  @override
  String toString() {
    return OrderDetailsSessionCreateRequestMapper.ensureInitialized()
        .stringifyValue(this as OrderDetailsSessionCreateRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderDetailsSessionCreateRequestMapper.ensureInitialized()
                .isValueEqual(this as OrderDetailsSessionCreateRequest, other));
  }

  @override
  int get hashCode {
    return OrderDetailsSessionCreateRequestMapper.ensureInitialized()
        .hashValue(this as OrderDetailsSessionCreateRequest);
  }
}

extension OrderDetailsSessionCreateRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderDetailsSessionCreateRequest, $Out> {
  OrderDetailsSessionCreateRequestCopyWith<$R, OrderDetailsSessionCreateRequest,
          $Out>
      get $asOrderDetailsSessionCreateRequest => $base.as((v, t, t2) =>
          _OrderDetailsSessionCreateRequestCopyWithImpl(v, t, t2));
}

abstract class OrderDetailsSessionCreateRequestCopyWith<
    $R,
    $In extends OrderDetailsSessionCreateRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? productId, double? currentPrice, int? quantity});
  OrderDetailsSessionCreateRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OrderDetailsSessionCreateRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderDetailsSessionCreateRequest, $Out>
    implements
        OrderDetailsSessionCreateRequestCopyWith<$R,
            OrderDetailsSessionCreateRequest, $Out> {
  _OrderDetailsSessionCreateRequestCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderDetailsSessionCreateRequest> $mapper =
      OrderDetailsSessionCreateRequestMapper.ensureInitialized();
  @override
  $R call({int? productId, double? currentPrice, int? quantity}) =>
      $apply(FieldCopyWithData({
        if (productId != null) #productId: productId,
        if (currentPrice != null) #currentPrice: currentPrice,
        if (quantity != null) #quantity: quantity
      }));
  @override
  OrderDetailsSessionCreateRequest $make(CopyWithData data) =>
      OrderDetailsSessionCreateRequest(
          productId: data.get(#productId, or: $value.productId),
          currentPrice: data.get(#currentPrice, or: $value.currentPrice),
          quantity: data.get(#quantity, or: $value.quantity));

  @override
  OrderDetailsSessionCreateRequestCopyWith<$R2,
      OrderDetailsSessionCreateRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderDetailsSessionCreateRequestCopyWithImpl($value, $cast, t);
}
