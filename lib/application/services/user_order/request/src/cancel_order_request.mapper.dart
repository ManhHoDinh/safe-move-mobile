// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cancel_order_request.dart';

class CancelOrderRequestMapper extends ClassMapperBase<CancelOrderRequest> {
  CancelOrderRequestMapper._();

  static CancelOrderRequestMapper? _instance;
  static CancelOrderRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CancelOrderRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CancelOrderRequest';

  static int _$orderId(CancelOrderRequest v) => v.orderId;
  static const Field<CancelOrderRequest, int> _f$orderId =
      Field('orderId', _$orderId);

  @override
  final MappableFields<CancelOrderRequest> fields = const {
    #orderId: _f$orderId,
  };

  static CancelOrderRequest _instantiate(DecodingData data) {
    return CancelOrderRequest(orderId: data.dec(_f$orderId));
  }

  @override
  final Function instantiate = _instantiate;

  static CancelOrderRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CancelOrderRequest>(map);
  }

  static CancelOrderRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<CancelOrderRequest>(json);
  }
}

mixin CancelOrderRequestMappable {
  String toJsonString() {
    return CancelOrderRequestMapper.ensureInitialized()
        .encodeJson<CancelOrderRequest>(this as CancelOrderRequest);
  }

  Map<String, dynamic> toJson() {
    return CancelOrderRequestMapper.ensureInitialized()
        .encodeMap<CancelOrderRequest>(this as CancelOrderRequest);
  }

  CancelOrderRequestCopyWith<CancelOrderRequest, CancelOrderRequest,
          CancelOrderRequest>
      get copyWith => _CancelOrderRequestCopyWithImpl(
          this as CancelOrderRequest, $identity, $identity);
  @override
  String toString() {
    return CancelOrderRequestMapper.ensureInitialized()
        .stringifyValue(this as CancelOrderRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CancelOrderRequestMapper.ensureInitialized()
                .isValueEqual(this as CancelOrderRequest, other));
  }

  @override
  int get hashCode {
    return CancelOrderRequestMapper.ensureInitialized()
        .hashValue(this as CancelOrderRequest);
  }
}

extension CancelOrderRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CancelOrderRequest, $Out> {
  CancelOrderRequestCopyWith<$R, CancelOrderRequest, $Out>
      get $asCancelOrderRequest =>
          $base.as((v, t, t2) => _CancelOrderRequestCopyWithImpl(v, t, t2));
}

abstract class CancelOrderRequestCopyWith<$R, $In extends CancelOrderRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? orderId});
  CancelOrderRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CancelOrderRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CancelOrderRequest, $Out>
    implements CancelOrderRequestCopyWith<$R, CancelOrderRequest, $Out> {
  _CancelOrderRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CancelOrderRequest> $mapper =
      CancelOrderRequestMapper.ensureInitialized();
  @override
  $R call({int? orderId}) =>
      $apply(FieldCopyWithData({if (orderId != null) #orderId: orderId}));
  @override
  CancelOrderRequest $make(CopyWithData data) =>
      CancelOrderRequest(orderId: data.get(#orderId, or: $value.orderId));

  @override
  CancelOrderRequestCopyWith<$R2, CancelOrderRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CancelOrderRequestCopyWithImpl($value, $cast, t);
}
