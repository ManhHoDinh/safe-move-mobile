import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'order_status_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum OrderStatusType {
  unconfirmed,
  confirmed,
  delivering,
  delivered,
  cancel,
  refund
}

String? encodeOrderStatusType(OrderStatusType? self) {
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
    case null:
      return null;
  }
}
