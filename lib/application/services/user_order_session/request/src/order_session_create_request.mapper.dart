// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_session_create_request.dart';

class OrderSessionCreateRequestMapper
    extends ClassMapperBase<OrderSessionCreateRequest> {
  OrderSessionCreateRequestMapper._();

  static OrderSessionCreateRequestMapper? _instance;
  static OrderSessionCreateRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OrderSessionCreateRequestMapper._());
      OrderDetailsSessionCreateRequestMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderSessionCreateRequest';

  static int? _$addressId(OrderSessionCreateRequest v) => v.addressId;
  static const Field<OrderSessionCreateRequest, int> _f$addressId =
      Field('addressId', _$addressId, opt: true);
  static double? _$discountPrice(OrderSessionCreateRequest v) =>
      v.discountPrice;
  static const Field<OrderSessionCreateRequest, double> _f$discountPrice =
      Field('discountPrice', _$discountPrice, opt: true);
  static List<OrderDetailsSessionCreateRequest>
      _$orderDetailSessionCreateRequests(OrderSessionCreateRequest v) =>
          v.orderDetailSessionCreateRequests;
  static const Field<OrderSessionCreateRequest,
          List<OrderDetailsSessionCreateRequest>>
      _f$orderDetailSessionCreateRequests = Field(
          'orderDetailSessionCreateRequests',
          _$orderDetailSessionCreateRequests);

  @override
  final MappableFields<OrderSessionCreateRequest> fields = const {
    #addressId: _f$addressId,
    #discountPrice: _f$discountPrice,
    #orderDetailSessionCreateRequests: _f$orderDetailSessionCreateRequests,
  };

  static OrderSessionCreateRequest _instantiate(DecodingData data) {
    return OrderSessionCreateRequest(
        addressId: data.dec(_f$addressId),
        discountPrice: data.dec(_f$discountPrice),
        orderDetailSessionCreateRequests:
            data.dec(_f$orderDetailSessionCreateRequests));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderSessionCreateRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderSessionCreateRequest>(map);
  }

  static OrderSessionCreateRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<OrderSessionCreateRequest>(json);
  }
}

mixin OrderSessionCreateRequestMappable {
  String toJsonString() {
    return OrderSessionCreateRequestMapper.ensureInitialized()
        .encodeJson<OrderSessionCreateRequest>(
            this as OrderSessionCreateRequest);
  }

  Map<String, dynamic> toJson() {
    return OrderSessionCreateRequestMapper.ensureInitialized()
        .encodeMap<OrderSessionCreateRequest>(
            this as OrderSessionCreateRequest);
  }

  OrderSessionCreateRequestCopyWith<OrderSessionCreateRequest,
          OrderSessionCreateRequest, OrderSessionCreateRequest>
      get copyWith => _OrderSessionCreateRequestCopyWithImpl(
          this as OrderSessionCreateRequest, $identity, $identity);
  @override
  String toString() {
    return OrderSessionCreateRequestMapper.ensureInitialized()
        .stringifyValue(this as OrderSessionCreateRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderSessionCreateRequestMapper.ensureInitialized()
                .isValueEqual(this as OrderSessionCreateRequest, other));
  }

  @override
  int get hashCode {
    return OrderSessionCreateRequestMapper.ensureInitialized()
        .hashValue(this as OrderSessionCreateRequest);
  }
}

extension OrderSessionCreateRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderSessionCreateRequest, $Out> {
  OrderSessionCreateRequestCopyWith<$R, OrderSessionCreateRequest, $Out>
      get $asOrderSessionCreateRequest => $base
          .as((v, t, t2) => _OrderSessionCreateRequestCopyWithImpl(v, t, t2));
}

abstract class OrderSessionCreateRequestCopyWith<
    $R,
    $In extends OrderSessionCreateRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
          $R,
          OrderDetailsSessionCreateRequest,
          OrderDetailsSessionCreateRequestCopyWith<
              $R,
              OrderDetailsSessionCreateRequest,
              OrderDetailsSessionCreateRequest>>
      get orderDetailSessionCreateRequests;
  $R call(
      {int? addressId,
      double? discountPrice,
      List<OrderDetailsSessionCreateRequest>?
          orderDetailSessionCreateRequests});
  OrderSessionCreateRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OrderSessionCreateRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderSessionCreateRequest, $Out>
    implements
        OrderSessionCreateRequestCopyWith<$R, OrderSessionCreateRequest, $Out> {
  _OrderSessionCreateRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderSessionCreateRequest> $mapper =
      OrderSessionCreateRequestMapper.ensureInitialized();
  @override
  ListCopyWith<
          $R,
          OrderDetailsSessionCreateRequest,
          OrderDetailsSessionCreateRequestCopyWith<
              $R,
              OrderDetailsSessionCreateRequest,
              OrderDetailsSessionCreateRequest>>
      get orderDetailSessionCreateRequests => ListCopyWith(
          $value.orderDetailSessionCreateRequests,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(orderDetailSessionCreateRequests: v));
  @override
  $R call(
          {Object? addressId = $none,
          Object? discountPrice = $none,
          List<OrderDetailsSessionCreateRequest>?
              orderDetailSessionCreateRequests}) =>
      $apply(FieldCopyWithData({
        if (addressId != $none) #addressId: addressId,
        if (discountPrice != $none) #discountPrice: discountPrice,
        if (orderDetailSessionCreateRequests != null)
          #orderDetailSessionCreateRequests: orderDetailSessionCreateRequests
      }));
  @override
  OrderSessionCreateRequest $make(CopyWithData data) =>
      OrderSessionCreateRequest(
          addressId: data.get(#addressId, or: $value.addressId),
          discountPrice: data.get(#discountPrice, or: $value.discountPrice),
          orderDetailSessionCreateRequests: data.get(
              #orderDetailSessionCreateRequests,
              or: $value.orderDetailSessionCreateRequests));

  @override
  OrderSessionCreateRequestCopyWith<$R2, OrderSessionCreateRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OrderSessionCreateRequestCopyWithImpl($value, $cast, t);
}
