// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_response.dart';

class OrderResponseMapper extends ClassMapperBase<OrderResponse> {
  OrderResponseMapper._();

  static OrderResponseMapper? _instance;
  static OrderResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderResponseMapper._());
      UserDTOMapper.ensureInitialized();
      OrderDetailResponseMapper.ensureInitialized();
      OrderStatusTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderResponse';

  static int? _$id(OrderResponse v) => v.id;
  static const Field<OrderResponse, int> _f$id = Field('id', _$id, opt: true);
  static UserDTO? _$user(OrderResponse v) => v.user;
  static const Field<OrderResponse, UserDTO> _f$user =
      Field('user', _$user, opt: true);
  static List<OrderDetailResponse>? _$orderDetailResponses(OrderResponse v) =>
      v.orderDetailResponses;
  static const Field<OrderResponse, List<OrderDetailResponse>>
      _f$orderDetailResponses =
      Field('orderDetailResponses', _$orderDetailResponses, opt: true);
  static double? _$productsPrice(OrderResponse v) => v.productsPrice;
  static const Field<OrderResponse, double> _f$productsPrice =
      Field('productsPrice', _$productsPrice, opt: true);
  static double? _$shippingFee(OrderResponse v) => v.shippingFee;
  static const Field<OrderResponse, double> _f$shippingFee =
      Field('shippingFee', _$shippingFee, opt: true);
  static double? _$discountPrice(OrderResponse v) => v.discountPrice;
  static const Field<OrderResponse, double> _f$discountPrice =
      Field('discountPrice', _$discountPrice, opt: true);
  static double? _$totalPrice(OrderResponse v) => v.totalPrice;
  static const Field<OrderResponse, double> _f$totalPrice =
      Field('totalPrice', _$totalPrice, opt: true);
  static String? _$zipCode(OrderResponse v) => v.zipCode;
  static const Field<OrderResponse, String> _f$zipCode =
      Field('zipCode', _$zipCode, opt: true);
  static String? _$mainAddress(OrderResponse v) => v.mainAddress;
  static const Field<OrderResponse, String> _f$mainAddress =
      Field('mainAddress', _$mainAddress, opt: true);
  static String? _$detailAddress(OrderResponse v) => v.detailAddress;
  static const Field<OrderResponse, String> _f$detailAddress =
      Field('detailAddress', _$detailAddress, opt: true);
  static String? _$phoneNumber(OrderResponse v) => v.phoneNumber;
  static const Field<OrderResponse, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$name(OrderResponse v) => v.name;
  static const Field<OrderResponse, String> _f$name =
      Field('name', _$name, opt: true);
  static OrderStatusType? _$orderStatus(OrderResponse v) => v.orderStatus;
  static const Field<OrderResponse, OrderStatusType> _f$orderStatus =
      Field('orderStatus', _$orderStatus, opt: true);
  static DateTime? _$createdAt(OrderResponse v) => v.createdAt;
  static const Field<OrderResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(OrderResponse v) => v.updatedAt;
  static const Field<OrderResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static String? _$courierId(OrderResponse v) => v.courierId;
  static const Field<OrderResponse, String> _f$courierId =
      Field('courierId', _$courierId, opt: true);
  static String? _$courierName(OrderResponse v) => v.courierName;
  static const Field<OrderResponse, String> _f$courierName =
      Field('courierName', _$courierName, opt: true);
  static String? _$trackingId(OrderResponse v) => v.trackingId;
  static const Field<OrderResponse, String> _f$trackingId =
      Field('trackingId', _$trackingId, opt: true);

  @override
  final MappableFields<OrderResponse> fields = const {
    #id: _f$id,
    #user: _f$user,
    #orderDetailResponses: _f$orderDetailResponses,
    #productsPrice: _f$productsPrice,
    #shippingFee: _f$shippingFee,
    #discountPrice: _f$discountPrice,
    #totalPrice: _f$totalPrice,
    #zipCode: _f$zipCode,
    #mainAddress: _f$mainAddress,
    #detailAddress: _f$detailAddress,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
    #orderStatus: _f$orderStatus,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #courierId: _f$courierId,
    #courierName: _f$courierName,
    #trackingId: _f$trackingId,
  };

  static OrderResponse _instantiate(DecodingData data) {
    return OrderResponse(
        id: data.dec(_f$id),
        user: data.dec(_f$user),
        orderDetailResponses: data.dec(_f$orderDetailResponses),
        productsPrice: data.dec(_f$productsPrice),
        shippingFee: data.dec(_f$shippingFee),
        discountPrice: data.dec(_f$discountPrice),
        totalPrice: data.dec(_f$totalPrice),
        zipCode: data.dec(_f$zipCode),
        mainAddress: data.dec(_f$mainAddress),
        detailAddress: data.dec(_f$detailAddress),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name),
        orderStatus: data.dec(_f$orderStatus),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        courierId: data.dec(_f$courierId),
        courierName: data.dec(_f$courierName),
        trackingId: data.dec(_f$trackingId));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderResponse>(map);
  }

  static OrderResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<OrderResponse>(json);
  }
}

mixin OrderResponseMappable {
  String toJsonString() {
    return OrderResponseMapper.ensureInitialized()
        .encodeJson<OrderResponse>(this as OrderResponse);
  }

  Map<String, dynamic> toJson() {
    return OrderResponseMapper.ensureInitialized()
        .encodeMap<OrderResponse>(this as OrderResponse);
  }

  OrderResponseCopyWith<OrderResponse, OrderResponse, OrderResponse>
      get copyWith => _OrderResponseCopyWithImpl(
          this as OrderResponse, $identity, $identity);
  @override
  String toString() {
    return OrderResponseMapper.ensureInitialized()
        .stringifyValue(this as OrderResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderResponseMapper.ensureInitialized()
                .isValueEqual(this as OrderResponse, other));
  }

  @override
  int get hashCode {
    return OrderResponseMapper.ensureInitialized()
        .hashValue(this as OrderResponse);
  }
}

extension OrderResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderResponse, $Out> {
  OrderResponseCopyWith<$R, OrderResponse, $Out> get $asOrderResponse =>
      $base.as((v, t, t2) => _OrderResponseCopyWithImpl(v, t, t2));
}

abstract class OrderResponseCopyWith<$R, $In extends OrderResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user;
  ListCopyWith<
      $R,
      OrderDetailResponse,
      OrderDetailResponseCopyWith<$R, OrderDetailResponse,
          OrderDetailResponse>>? get orderDetailResponses;
  $R call(
      {int? id,
      UserDTO? user,
      List<OrderDetailResponse>? orderDetailResponses,
      double? productsPrice,
      double? shippingFee,
      double? discountPrice,
      double? totalPrice,
      String? zipCode,
      String? mainAddress,
      String? detailAddress,
      String? phoneNumber,
      String? name,
      OrderStatusType? orderStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? courierId,
      String? courierName,
      String? trackingId});
  OrderResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderResponse, $Out>
    implements OrderResponseCopyWith<$R, OrderResponse, $Out> {
  _OrderResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderResponse> $mapper =
      OrderResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  ListCopyWith<
      $R,
      OrderDetailResponse,
      OrderDetailResponseCopyWith<$R, OrderDetailResponse,
          OrderDetailResponse>>? get orderDetailResponses =>
      $value.orderDetailResponses != null
          ? ListCopyWith(
              $value.orderDetailResponses!,
              (v, t) => v.copyWith.$chain(t),
              (v) => call(orderDetailResponses: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? user = $none,
          Object? orderDetailResponses = $none,
          Object? productsPrice = $none,
          Object? shippingFee = $none,
          Object? discountPrice = $none,
          Object? totalPrice = $none,
          Object? zipCode = $none,
          Object? mainAddress = $none,
          Object? detailAddress = $none,
          Object? phoneNumber = $none,
          Object? name = $none,
          Object? orderStatus = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? courierId = $none,
          Object? courierName = $none,
          Object? trackingId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (user != $none) #user: user,
        if (orderDetailResponses != $none)
          #orderDetailResponses: orderDetailResponses,
        if (productsPrice != $none) #productsPrice: productsPrice,
        if (shippingFee != $none) #shippingFee: shippingFee,
        if (discountPrice != $none) #discountPrice: discountPrice,
        if (totalPrice != $none) #totalPrice: totalPrice,
        if (zipCode != $none) #zipCode: zipCode,
        if (mainAddress != $none) #mainAddress: mainAddress,
        if (detailAddress != $none) #detailAddress: detailAddress,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (name != $none) #name: name,
        if (orderStatus != $none) #orderStatus: orderStatus,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (courierId != $none) #courierId: courierId,
        if (courierName != $none) #courierName: courierName,
        if (trackingId != $none) #trackingId: trackingId
      }));
  @override
  OrderResponse $make(CopyWithData data) => OrderResponse(
      id: data.get(#id, or: $value.id),
      user: data.get(#user, or: $value.user),
      orderDetailResponses:
          data.get(#orderDetailResponses, or: $value.orderDetailResponses),
      productsPrice: data.get(#productsPrice, or: $value.productsPrice),
      shippingFee: data.get(#shippingFee, or: $value.shippingFee),
      discountPrice: data.get(#discountPrice, or: $value.discountPrice),
      totalPrice: data.get(#totalPrice, or: $value.totalPrice),
      zipCode: data.get(#zipCode, or: $value.zipCode),
      mainAddress: data.get(#mainAddress, or: $value.mainAddress),
      detailAddress: data.get(#detailAddress, or: $value.detailAddress),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name),
      orderStatus: data.get(#orderStatus, or: $value.orderStatus),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      courierId: data.get(#courierId, or: $value.courierId),
      courierName: data.get(#courierName, or: $value.courierName),
      trackingId: data.get(#trackingId, or: $value.trackingId));

  @override
  OrderResponseCopyWith<$R2, OrderResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrderResponseCopyWithImpl($value, $cast, t);
}
