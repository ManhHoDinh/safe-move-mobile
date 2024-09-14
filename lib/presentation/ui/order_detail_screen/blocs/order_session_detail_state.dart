import 'package:equatable/equatable.dart';

import '../../../../application/services/user_order_session/user_order_session.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/base_form_input/base_form_input.dart';

enum DiscountFieldError { discountInvalid }

class DiscountField extends BaseFormInput<String, DiscountFieldError> {
  const DiscountField.pure({super.value = '', this.maxDiscount = 0})
      : super.pure(validateOnChanged: true);

  const DiscountField.dirty({required super.value, required this.maxDiscount})
      : super.dirty(validateOnChanged: true);

  final int maxDiscount;

  @override
  DiscountFieldError? selfValidate() {
    if (value.isEmpty) {
      return null;
    }
    if (int.parse(value) > maxDiscount) {
      return DiscountFieldError.discountInvalid;
    }
    return null;
  }
}

class OrderSessionState extends Equatable {
  const OrderSessionState({
    this.orderSessionResponse,
    this.discountField = const DiscountField.pure(),
    this.loading = false,
    this.checkBoxValue = false,
    this.apiPostStatus = ApiStatus.initial,
  });

  final OrderSessionResponse? orderSessionResponse;
  final DiscountField discountField;
  final bool loading;
  final bool checkBoxValue;
  final ApiStatus apiPostStatus;

  OrderSessionState copyWith({
    OrderSessionResponse? orderSessionResponse,
    DiscountField? discountField,
    bool? loading,
    bool? checkBoxValue,
    ApiStatus? apiPostStatus,
  }) {
    return OrderSessionState(
      orderSessionResponse: orderSessionResponse ?? this.orderSessionResponse,
      loading: loading ?? this.loading,
      checkBoxValue: checkBoxValue ?? this.checkBoxValue,
      apiPostStatus: apiPostStatus ?? this.apiPostStatus,
      discountField: discountField ?? this.discountField,
    );
  }

  @override
  List<Object?> get props => [
        discountField.value,
        discountField.error,
        loading,
        checkBoxValue,
        apiPostStatus
      ];
}
