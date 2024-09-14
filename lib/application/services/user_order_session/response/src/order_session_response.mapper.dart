// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_session_response.dart';

class SessionStatusMapper extends EnumMapper<SessionStatus> {
  SessionStatusMapper._();

  static SessionStatusMapper? _instance;
  static SessionStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionStatusMapper._());
    }
    return _instance!;
  }

  static SessionStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SessionStatus decode(dynamic value) {
    switch (value) {
      case 'PAID':
        return SessionStatus.paid;
      case 'UNPAID':
        return SessionStatus.unpaid;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SessionStatus self) {
    switch (self) {
      case SessionStatus.paid:
        return 'PAID';
      case SessionStatus.unpaid:
        return 'UNPAID';
    }
  }
}

extension SessionStatusMapperExtension on SessionStatus {
  String toValue() {
    SessionStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SessionStatus>(this) as String;
  }
}

class OrderSessionResponseMapper extends ClassMapperBase<OrderSessionResponse> {
  OrderSessionResponseMapper._();

  static OrderSessionResponseMapper? _instance;
  static OrderSessionResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderSessionResponseMapper._());
      UserDTOMapper.ensureInitialized();
      SessionStatusMapper.ensureInitialized();
      OrderDetailSessionResponseMapper.ensureInitialized();
      AddressResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OrderSessionResponse';

  static int? _$id(OrderSessionResponse v) => v.id;
  static const Field<OrderSessionResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static UserDTO? _$user(OrderSessionResponse v) => v.user;
  static const Field<OrderSessionResponse, UserDTO> _f$user =
      Field('user', _$user, opt: true);
  static double? _$productsPrice(OrderSessionResponse v) => v.productsPrice;
  static const Field<OrderSessionResponse, double> _f$productsPrice =
      Field('productsPrice', _$productsPrice, opt: true);
  static double? _$shippingFee(OrderSessionResponse v) => v.shippingFee;
  static const Field<OrderSessionResponse, double> _f$shippingFee =
      Field('shippingFee', _$shippingFee, opt: true);
  static double? _$discountPrice(OrderSessionResponse v) => v.discountPrice;
  static const Field<OrderSessionResponse, double> _f$discountPrice =
      Field('discountPrice', _$discountPrice, opt: true);
  static double? _$totalPrice(OrderSessionResponse v) => v.totalPrice;
  static const Field<OrderSessionResponse, double> _f$totalPrice =
      Field('totalPrice', _$totalPrice, opt: true);
  static String? _$zipcode(OrderSessionResponse v) => v.zipcode;
  static const Field<OrderSessionResponse, String> _f$zipcode =
      Field('zipcode', _$zipcode, opt: true);
  static String? _$mainAddress(OrderSessionResponse v) => v.mainAddress;
  static const Field<OrderSessionResponse, String> _f$mainAddress =
      Field('mainAddress', _$mainAddress, opt: true);
  static String? _$detailAddress(OrderSessionResponse v) => v.detailAddress;
  static const Field<OrderSessionResponse, String> _f$detailAddress =
      Field('detailAddress', _$detailAddress, opt: true);
  static String? _$phoneNumber(OrderSessionResponse v) => v.phoneNumber;
  static const Field<OrderSessionResponse, String> _f$phoneNumber =
      Field('phoneNumber', _$phoneNumber, opt: true);
  static String? _$name(OrderSessionResponse v) => v.name;
  static const Field<OrderSessionResponse, String> _f$name =
      Field('name', _$name, opt: true);
  static SessionStatus? _$sessionStatus(OrderSessionResponse v) =>
      v.sessionStatus;
  static const Field<OrderSessionResponse, SessionStatus> _f$sessionStatus =
      Field('sessionStatus', _$sessionStatus, opt: true);
  static DateTime? _$createdAt(OrderSessionResponse v) => v.createdAt;
  static const Field<OrderSessionResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(OrderSessionResponse v) => v.updatedAt;
  static const Field<OrderSessionResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static List<OrderDetailSessionResponse>? _$orderDetailSessionResponse(
          OrderSessionResponse v) =>
      v.orderDetailSessionResponse;
  static const Field<OrderSessionResponse, List<OrderDetailSessionResponse>>
      _f$orderDetailSessionResponse = Field(
          'orderDetailSessionResponse', _$orderDetailSessionResponse,
          opt: true);
  static bool? _$isDefaultAddress(OrderSessionResponse v) => v.isDefaultAddress;
  static const Field<OrderSessionResponse, bool> _f$isDefaultAddress =
      Field('isDefaultAddress', _$isDefaultAddress, opt: true);
  static AddressResponse? _$address(OrderSessionResponse v) => v.address;
  static const Field<OrderSessionResponse, AddressResponse> _f$address =
      Field('address', _$address, opt: true);
  static double? _$maxDiscountPrice(OrderSessionResponse v) =>
      v.maxDiscountPrice;
  static const Field<OrderSessionResponse, double> _f$maxDiscountPrice =
      Field('maxDiscountPrice', _$maxDiscountPrice, opt: true);

  @override
  final MappableFields<OrderSessionResponse> fields = const {
    #id: _f$id,
    #user: _f$user,
    #productsPrice: _f$productsPrice,
    #shippingFee: _f$shippingFee,
    #discountPrice: _f$discountPrice,
    #totalPrice: _f$totalPrice,
    #zipcode: _f$zipcode,
    #mainAddress: _f$mainAddress,
    #detailAddress: _f$detailAddress,
    #phoneNumber: _f$phoneNumber,
    #name: _f$name,
    #sessionStatus: _f$sessionStatus,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #orderDetailSessionResponse: _f$orderDetailSessionResponse,
    #isDefaultAddress: _f$isDefaultAddress,
    #address: _f$address,
    #maxDiscountPrice: _f$maxDiscountPrice,
  };

  static OrderSessionResponse _instantiate(DecodingData data) {
    return OrderSessionResponse(
        id: data.dec(_f$id),
        user: data.dec(_f$user),
        productsPrice: data.dec(_f$productsPrice),
        shippingFee: data.dec(_f$shippingFee),
        discountPrice: data.dec(_f$discountPrice),
        totalPrice: data.dec(_f$totalPrice),
        zipcode: data.dec(_f$zipcode),
        mainAddress: data.dec(_f$mainAddress),
        detailAddress: data.dec(_f$detailAddress),
        phoneNumber: data.dec(_f$phoneNumber),
        name: data.dec(_f$name),
        sessionStatus: data.dec(_f$sessionStatus),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        orderDetailSessionResponse: data.dec(_f$orderDetailSessionResponse),
        isDefaultAddress: data.dec(_f$isDefaultAddress),
        address: data.dec(_f$address),
        maxDiscountPrice: data.dec(_f$maxDiscountPrice));
  }

  @override
  final Function instantiate = _instantiate;

  static OrderSessionResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OrderSessionResponse>(map);
  }

  static OrderSessionResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<OrderSessionResponse>(json);
  }
}

mixin OrderSessionResponseMappable {
  String toJsonString() {
    return OrderSessionResponseMapper.ensureInitialized()
        .encodeJson<OrderSessionResponse>(this as OrderSessionResponse);
  }

  Map<String, dynamic> toJson() {
    return OrderSessionResponseMapper.ensureInitialized()
        .encodeMap<OrderSessionResponse>(this as OrderSessionResponse);
  }

  OrderSessionResponseCopyWith<OrderSessionResponse, OrderSessionResponse,
          OrderSessionResponse>
      get copyWith => _OrderSessionResponseCopyWithImpl(
          this as OrderSessionResponse, $identity, $identity);
  @override
  String toString() {
    return OrderSessionResponseMapper.ensureInitialized()
        .stringifyValue(this as OrderSessionResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrderSessionResponseMapper.ensureInitialized()
                .isValueEqual(this as OrderSessionResponse, other));
  }

  @override
  int get hashCode {
    return OrderSessionResponseMapper.ensureInitialized()
        .hashValue(this as OrderSessionResponse);
  }
}

extension OrderSessionResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OrderSessionResponse, $Out> {
  OrderSessionResponseCopyWith<$R, OrderSessionResponse, $Out>
      get $asOrderSessionResponse =>
          $base.as((v, t, t2) => _OrderSessionResponseCopyWithImpl(v, t, t2));
}

abstract class OrderSessionResponseCopyWith<
    $R,
    $In extends OrderSessionResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user;
  ListCopyWith<
      $R,
      OrderDetailSessionResponse,
      OrderDetailSessionResponseCopyWith<$R, OrderDetailSessionResponse,
          OrderDetailSessionResponse>>? get orderDetailSessionResponse;
  AddressResponseCopyWith<$R, AddressResponse, AddressResponse>? get address;
  $R call(
      {int? id,
      UserDTO? user,
      double? productsPrice,
      double? shippingFee,
      double? discountPrice,
      double? totalPrice,
      String? zipcode,
      String? mainAddress,
      String? detailAddress,
      String? phoneNumber,
      String? name,
      SessionStatus? sessionStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<OrderDetailSessionResponse>? orderDetailSessionResponse,
      bool? isDefaultAddress,
      AddressResponse? address,
      double? maxDiscountPrice});
  OrderSessionResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OrderSessionResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OrderSessionResponse, $Out>
    implements OrderSessionResponseCopyWith<$R, OrderSessionResponse, $Out> {
  _OrderSessionResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OrderSessionResponse> $mapper =
      OrderSessionResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  ListCopyWith<
      $R,
      OrderDetailSessionResponse,
      OrderDetailSessionResponseCopyWith<$R, OrderDetailSessionResponse,
          OrderDetailSessionResponse>>? get orderDetailSessionResponse =>
      $value.orderDetailSessionResponse != null
          ? ListCopyWith(
              $value.orderDetailSessionResponse!,
              (v, t) => v.copyWith.$chain(t),
              (v) => call(orderDetailSessionResponse: v))
          : null;
  @override
  AddressResponseCopyWith<$R, AddressResponse, AddressResponse>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  $R call(
          {Object? id = $none,
          Object? user = $none,
          Object? productsPrice = $none,
          Object? shippingFee = $none,
          Object? discountPrice = $none,
          Object? totalPrice = $none,
          Object? zipcode = $none,
          Object? mainAddress = $none,
          Object? detailAddress = $none,
          Object? phoneNumber = $none,
          Object? name = $none,
          Object? sessionStatus = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? orderDetailSessionResponse = $none,
          Object? isDefaultAddress = $none,
          Object? address = $none,
          Object? maxDiscountPrice = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (user != $none) #user: user,
        if (productsPrice != $none) #productsPrice: productsPrice,
        if (shippingFee != $none) #shippingFee: shippingFee,
        if (discountPrice != $none) #discountPrice: discountPrice,
        if (totalPrice != $none) #totalPrice: totalPrice,
        if (zipcode != $none) #zipcode: zipcode,
        if (mainAddress != $none) #mainAddress: mainAddress,
        if (detailAddress != $none) #detailAddress: detailAddress,
        if (phoneNumber != $none) #phoneNumber: phoneNumber,
        if (name != $none) #name: name,
        if (sessionStatus != $none) #sessionStatus: sessionStatus,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (orderDetailSessionResponse != $none)
          #orderDetailSessionResponse: orderDetailSessionResponse,
        if (isDefaultAddress != $none) #isDefaultAddress: isDefaultAddress,
        if (address != $none) #address: address,
        if (maxDiscountPrice != $none) #maxDiscountPrice: maxDiscountPrice
      }));
  @override
  OrderSessionResponse $make(CopyWithData data) => OrderSessionResponse(
      id: data.get(#id, or: $value.id),
      user: data.get(#user, or: $value.user),
      productsPrice: data.get(#productsPrice, or: $value.productsPrice),
      shippingFee: data.get(#shippingFee, or: $value.shippingFee),
      discountPrice: data.get(#discountPrice, or: $value.discountPrice),
      totalPrice: data.get(#totalPrice, or: $value.totalPrice),
      zipcode: data.get(#zipcode, or: $value.zipcode),
      mainAddress: data.get(#mainAddress, or: $value.mainAddress),
      detailAddress: data.get(#detailAddress, or: $value.detailAddress),
      phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
      name: data.get(#name, or: $value.name),
      sessionStatus: data.get(#sessionStatus, or: $value.sessionStatus),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      orderDetailSessionResponse: data.get(#orderDetailSessionResponse,
          or: $value.orderDetailSessionResponse),
      isDefaultAddress:
          data.get(#isDefaultAddress, or: $value.isDefaultAddress),
      address: data.get(#address, or: $value.address),
      maxDiscountPrice:
          data.get(#maxDiscountPrice, or: $value.maxDiscountPrice));

  @override
  OrderSessionResponseCopyWith<$R2, OrderSessionResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OrderSessionResponseCopyWithImpl($value, $cast, t);
}
