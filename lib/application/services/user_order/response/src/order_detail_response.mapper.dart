// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_detail_response.dart';

class OrderDetailResponseMapper extends ClassMapperBase<OrderDetailResponse> {
  OrderDetailResponseMapper._();

  static OrderDetailResponseMapper? _instance;
  static OrderDetailResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderDetailResponseMapper._());
      ProductResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderDetailResponse';

  static int? _$id(OrderDetailResponse v) => v.id;
  static const Field<OrderDetailResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static ProductResponse? _$productResponse(OrderDetailResponse v) =>
      v.productResponse;
  static const Field<OrderDetailResponse, ProductResponse> _f$productResponse =
      Field('productResponse', _$productResponse, opt: true);
  static double? _$currentPrice(OrderDetailResponse v) => v.currentPrice;
  static const Field<OrderDetailResponse, double> _f$currentPrice =
      Field('currentPrice', _$currentPrice, opt: true);
  static int? _$quantity(OrderDetailResponse v) => v.quantity;
  static const Field<OrderDetailResponse, int> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static DateTime? _$createdAt(OrderDetailResponse v) => v.createdAt;
  static const Field<OrderDetailResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(OrderDetailResponse v) => v.updatedAt;
  static const Field<OrderDetailResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<OrderDetailResponse> fields = const {
    #id: _f$id,
    #productResponse: _f$productResponse,
    #currentPrice: _f$currentPrice,
    #quantity: _f$quantity,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static OrderDetailResponse _instantiate(DecodingData data) {
    return OrderDetailResponse(
        id: data.dec(_f$id),
        productResponse: data.dec(_f$productResponse),
        currentPrice: data.dec(_f$currentPrice),
        quantity: data.dec(_f$quantity),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderDetailResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderDetailResponse>(map);
  }

  static OrderDetailResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<OrderDetailResponse>(json);
  }
}

mixin OrderDetailResponseMappable {
  String toJsonString() {
    return OrderDetailResponseMapper.ensureInitialized()
        .encodeJson<OrderDetailResponse>(this as OrderDetailResponse);
  }

  Map<String, dynamic> toJson() {
    return OrderDetailResponseMapper.ensureInitialized()
        .encodeMap<OrderDetailResponse>(this as OrderDetailResponse);
  }

  OrderDetailResponseCopyWith<OrderDetailResponse, OrderDetailResponse,
          OrderDetailResponse>
      get copyWith => _OrderDetailResponseCopyWithImpl(
          this as OrderDetailResponse, $identity, $identity);
  @override
  String toString() {
    return OrderDetailResponseMapper.ensureInitialized()
        .stringifyValue(this as OrderDetailResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderDetailResponseMapper.ensureInitialized()
                .isValueEqual(this as OrderDetailResponse, other));
  }

  @override
  int get hashCode {
    return OrderDetailResponseMapper.ensureInitialized()
        .hashValue(this as OrderDetailResponse);
  }
}

extension OrderDetailResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderDetailResponse, $Out> {
  OrderDetailResponseCopyWith<$R, OrderDetailResponse, $Out>
      get $asOrderDetailResponse =>
          $base.as((v, t, t2) => _OrderDetailResponseCopyWithImpl(v, t, t2));
}

abstract class OrderDetailResponseCopyWith<$R, $In extends OrderDetailResponse,
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
  OrderDetailResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OrderDetailResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderDetailResponse, $Out>
    implements OrderDetailResponseCopyWith<$R, OrderDetailResponse, $Out> {
  _OrderDetailResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderDetailResponse> $mapper =
      OrderDetailResponseMapper.ensureInitialized();
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
  OrderDetailResponse $make(CopyWithData data) => OrderDetailResponse(
      id: data.get(#id, or: $value.id),
      productResponse: data.get(#productResponse, or: $value.productResponse),
      currentPrice: data.get(#currentPrice, or: $value.currentPrice),
      quantity: data.get(#quantity, or: $value.quantity),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  OrderDetailResponseCopyWith<$R2, OrderDetailResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OrderDetailResponseCopyWithImpl($value, $cast, t);
}
