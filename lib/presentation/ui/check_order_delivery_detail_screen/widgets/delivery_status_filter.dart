import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user_order/user_order.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../blocs/get_order_list_cubit.dart';
import '../blocs/get_order_list_state.dart';

class DeliveryStatusFilter extends StatelessWidget {
  const DeliveryStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderListCubit, GetOrderListState>(
        buildWhen: (previous, current) {
      return previous.filterOrderStatus != current.filterOrderStatus;
    }, builder: (context, state) {
      return SelectableChips<OrderStatusType?>(
        selected: <OrderStatusType?>{}..add(state.filterOrderStatus),
        data: [
          ChipData(
            value: null,
            label: S.of(context).entire,
          ),
          ChipData(
            value: OrderStatusType.unconfirmed,
            label: S.of(context).unconfirmed,
          ),
          ChipData(
            value: OrderStatusType.confirmed,
            label: S.of(context).confirmed,
          ),
          ChipData(
            value: OrderStatusType.delivering,
            label: S.of(context).shipping,
          ),
          ChipData(
            value: OrderStatusType.delivered,
            label: S.of(context).delivered,
          ),
          ChipData(
            value: OrderStatusType.cancel,
            label: S.of(context).cancel,
          ),
          ChipData(
            value: OrderStatusType.refund,
            label: S.of(context).refund,
          ),
        ],
        onSelect: (value) {
          context.read<GetOrderListCubit>().onChangeFilterOrderStatus(value);
        },
      );
    });
  }
}
