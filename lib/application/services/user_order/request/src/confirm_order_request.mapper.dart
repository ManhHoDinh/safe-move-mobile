// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'confirm_order_request.dart';

class ConfirmOrderRequestMapper extends ClassMapperBase<ConfirmOrderRequest> {
  ConfirmOrderRequestMapper._();

  static ConfirmOrderRequestMapper? _instance;
  static ConfirmOrderRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfirmOrderRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ConfirmOrderRequest';

  static String _$orderId(ConfirmOrderRequest v) => v.orderId;
  static const Field<ConfirmOrderRequest, String> _f$orderId =
      Field('orderId', _$orderId);
  static String _$paymentKey(ConfirmOrderRequest v) => v.paymentKey;
  static const Field<ConfirmOrderRequest, String> _f$paymentKey =
      Field('paymentKey', _$paymentKey);
  static String _$amount(ConfirmOrderRequest v) => v.amount;
  static const Field<ConfirmOrderRequest, String> _f$amount =
      Field('amount', _$amount);
  static int _$orderSessionId(ConfirmOrderRequest v) => v.orderSessionId;
  static const Field<ConfirmOrderRequest, int> _f$orderSessionId =
      Field('orderSessionId', _$orderSessionId);

  @override
  final MappableFields<ConfirmOrderRequest> fields = const {
    #orderId: _f$orderId,
    #paymentKey: _f$paymentKey,
    #amount: _f$amount,
    #orderSessionId: _f$orderSessionId,
  };

  static ConfirmOrderRequest _instantiate(DecodingData data) {
    return ConfirmOrderRequest(
        orderId: data.dec(_f$orderId),
        paymentKey: data.dec(_f$paymentKey),
        amount: data.dec(_f$amount),
        orderSessionId: data.dec(_f$orderSessionId));
  }

  @override
  final Function instantiate = _instantiate;

  static ConfirmOrderRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConfirmOrderRequest>(map);
  }

  static ConfirmOrderRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ConfirmOrderRequest>(json);
  }
}

mixin ConfirmOrderRequestMappable {
  String toJsonString() {
    return ConfirmOrderRequestMapper.ensureInitialized()
        .encodeJson<ConfirmOrderRequest>(this as ConfirmOrderRequest);
  }

  Map<String, dynamic> toJson() {
    return ConfirmOrderRequestMapper.ensureInitialized()
        .encodeMap<ConfirmOrderRequest>(this as ConfirmOrderRequest);
  }

  ConfirmOrderRequestCopyWith<ConfirmOrderRequest, ConfirmOrderRequest,
          ConfirmOrderRequest>
      get copyWith => _ConfirmOrderRequestCopyWithImpl(
          this as ConfirmOrderRequest, $identity, $identity);
  @override
  String toString() {
    return ConfirmOrderRequestMapper.ensureInitialized()
        .stringifyValue(this as ConfirmOrderRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ConfirmOrderRequestMapper.ensureInitialized()
                .isValueEqual(this as ConfirmOrderRequest, other));
  }

  @override
  int get hashCode {
    return ConfirmOrderRequestMapper.ensureInitialized()
        .hashValue(this as ConfirmOrderRequest);
  }
}

extension ConfirmOrderRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConfirmOrderRequest, $Out> {
  ConfirmOrderRequestCopyWith<$R, ConfirmOrderRequest, $Out>
      get $asConfirmOrderRequest =>
          $base.as((v, t, t2) => _ConfirmOrderRequestCopyWithImpl(v, t, t2));
}

abstract class ConfirmOrderRequestCopyWith<$R, $In extends ConfirmOrderRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? orderId,
      String? paymentKey,
      String? amount,
      int? orderSessionId});
  ConfirmOrderRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ConfirmOrderRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConfirmOrderRequest, $Out>
    implements ConfirmOrderRequestCopyWith<$R, ConfirmOrderRequest, $Out> {
  _ConfirmOrderRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConfirmOrderRequest> $mapper =
      ConfirmOrderRequestMapper.ensureInitialized();
  @override
  $R call(
          {String? orderId,
          String? paymentKey,
          String? amount,
          int? orderSessionId}) =>
      $apply(FieldCopyWithData({
        if (orderId != null) #orderId: orderId,
        if (paymentKey != null) #paymentKey: paymentKey,
        if (amount != null) #amount: amount,
        if (orderSessionId != null) #orderSessionId: orderSessionId
      }));
  @override
  ConfirmOrderRequest $make(CopyWithData data) => ConfirmOrderRequest(
      orderId: data.get(#orderId, or: $value.orderId),
      paymentKey: data.get(#paymentKey, or: $value.paymentKey),
      amount: data.get(#amount, or: $value.amount),
      orderSessionId: data.get(#orderSessionId, or: $value.orderSessionId));

  @override
  ConfirmOrderRequestCopyWith<$R2, ConfirmOrderRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ConfirmOrderRequestCopyWithImpl($value, $cast, t);
}
