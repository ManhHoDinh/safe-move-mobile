// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order_status_type.dart';

class OrderStatusTypeMapper extends EnumMapper<OrderStatusType> {
  OrderStatusTypeMapper._();

  static OrderStatusTypeMapper? _instance;
  static OrderStatusTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderStatusTypeMapper._());
    }
    return _instance!;
  }

  static OrderStatusType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  OrderStatusType decode(dynamic value) {
    switch (value) {
      case 'UNCONFIRMED':
        return OrderStatusType.unconfirmed;
      case 'CONFIRMED':
        return OrderStatusType.confirmed;
      case 'DELIVERING':
        return OrderStatusType.delivering;
      case 'DELIVERED':
        return OrderStatusType.delivered;
      case 'CANCEL':
        return OrderStatusType.cancel;
      case 'REFUND':
        return OrderStatusType.refund;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(OrderStatusType self) {
    switch (self) {
      case OrderStatusType.unconfirmed:
        return 'UNCONFIRMED';
      case OrderStatusType.confirmed:
        return 'CONFIRMED';
      case OrderStatusType.delivering:
        return 'DELIVERING';
      case OrderStatusType.delivered:
        return 'DELIVERED';
      case OrderStatusType.cancel:
        return 'CANCEL';
      case OrderStatusType.refund:
        return 'REFUND';
    }
  }
}

extension OrderStatusTypeMapperExtension on OrderStatusType {
  String toValue() {
    OrderStatusTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<OrderStatusType>(this) as String;
  }
}
