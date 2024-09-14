// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_detail_session_response.dart';

class OrderDetailSessionResponseMapper
    extends ClassMapperBase<OrderDetailSessionResponse> {
  OrderDetailSessionResponseMapper._();

  static OrderDetailSessionResponseMapper? _instance;
  static OrderDetailSessionResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OrderDetailSessionResponseMapper._());
      ProductResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderDetailSessionResponse';

  static int? _$id(OrderDetailSessionResponse v) => v.id;
  static const Field<OrderDetailSessionResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static ProductResponse? _$productResponse(OrderDetailSessionResponse v) =>
      v.productResponse;
  static const Field<OrderDetailSessionResponse, ProductResponse>
      _f$productResponse =
      Field('productResponse', _$productResponse, opt: true);
  static double? _$currentPrice(OrderDetailSessionResponse v) => v.currentPrice;
  static const Field<OrderDetailSessionResponse, double> _f$currentPrice =
      Field('currentPrice', _$currentPrice, opt: true);
  static int? _$quantity(OrderDetailSessionResponse v) => v.quantity;
  static const Field<OrderDetailSessionResponse, int> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static DateTime? _$createdAt(OrderDetailSessionResponse v) => v.createdAt;
  static const Field<OrderDetailSessionResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(OrderDetailSessionResponse v) => v.updatedAt;
  static const Field<OrderDetailSessionResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<OrderDetailSessionResponse> fields = const {
    #id: _f$id,
    #productResponse: _f$productResponse,
    #currentPrice: _f$currentPrice,
    #quantity: _f$quantity,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static OrderDetailSessionResponse _instantiate(DecodingData data) {
    return OrderDetailSessionResponse(
        id: data.dec(_f$id),
        productResponse: data.dec(_f$productResponse),
        currentPrice: data.dec(_f$currentPrice),
        quantity: data.dec(_f$quantity),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderDetailSessionResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderDetailSessionResponse>(map);
  }

  static OrderDetailSessionResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<OrderDetailSessionResponse>(json);
  }
}

mixin OrderDetailSessionResponseMappable {
  String toJsonString() {
    return OrderDetailSessionResponseMapper.ensureInitialized()
        .encodeJson<OrderDetailSessionResponse>(
            this as OrderDetailSessionResponse);
  }

  Map<String, dynamic> toJson() {
    return OrderDetailSessionResponseMapper.ensureInitialized()
        .encodeMap<OrderDetailSessionResponse>(
            this as OrderDetailSessionResponse);
  }

  OrderDetailSessionResponseCopyWith<OrderDetailSessionResponse,
          OrderDetailSessionResponse, OrderDetailSessionResponse>
      get copyWith => _OrderDetailSessionResponseCopyWithImpl(
          this as OrderDetailSessionResponse, $identity, $identity);
  @override
  String toString() {
    return OrderDetailSessionResponseMapper.ensureInitialized()
        .stringifyValue(this as OrderDetailSessionResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderDetailSessionResponseMapper.ensureInitialized()
                .isValueEqual(this as OrderDetailSessionResponse, other));
  }

  @override
  int get hashCode {
    return OrderDetailSessionResponseMapper.ensureInitialized()
        .hashValue(this as OrderDetailSessionResponse);
  }
}

extension OrderDetailSessionResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderDetailSessionResponse, $Out> {
  OrderDetailSessionResponseCopyWith<$R, OrderDetailSessionResponse, $Out>
      get $asOrderDetailSessionResponse => $base
          .as((v, t, t2) => _OrderDetailSessionResponseCopyWithImpl(v, t, t2));
}

abstract class OrderDetailSessionResponseCopyWith<
    $R,
    $In extends OrderDetailSessionResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ProductResponseCopyWith<$R, ProductResponse, ProductResponse>?
      get productResponse;
  $R call(
      {int? id,
      ProductResponse? productResponse,
      double? currentPrice,
      int? quantity,
      DateTime? createdAt,
      DateTime? updatedAt});
  OrderDetailSessionResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OrderDetailSessionResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderDetailSessionResponse, $Out>
    implements
        OrderDetailSessionResponseCopyWith<$R, OrderDetailSessionResponse,
            $Out> {
  _OrderDetailSessionResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderDetailSessionResponse> $mapper =
      OrderDetailSessionResponseMapper.ensureInitialized();
  @override
  ProductResponseCopyWith<$R, ProductResponse, ProductResponse>?
      get productResponse => $value.productResponse?.copyWith
          .$chain((v) => call(productResponse: v));
  @override
  $R call(
          {Object? id = $none,
          Object? productResponse = $none,
          Object? currentPrice = $none,
          Object? quantity = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (productResponse != $none) #productResponse: productResponse,
        if (currentPrice != $none) #currentPrice: currentPrice,
        if (quantity != $none) #quantity: quantity,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  OrderDetailSessionResponse $make(CopyWithData data) =>
      OrderDetailSessionResponse(
          id: data.get(#id, or: $value.id),
          productResponse:
              data.get(#productResponse, or: $value.productResponse),
          currentPrice: data.get(#currentPrice, or: $value.currentPrice),
          quantity: data.get(#quantity, or: $value.quantity),
          createdAt: data.get(#createdAt, or: $value.createdAt),
          updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  OrderDetailSessionResponseCopyWith<$R2, OrderDetailSessionResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OrderDetailSessionResponseCopyWithImpl($value, $cast, t);
}
