import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/qa/dto/dto.dart';
import '../../../../application/services/qa/request/src/qa_create_request.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/filters/selectable_chips.dart';
import '../blocs/inquiry_history_cubit.dart';
import '../blocs/inquiry_history_state.dart';

class InquiryHistoryStatusFilter extends StatelessWidget {
  const InquiryHistoryStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InquiryHistoryCubit, InquiryHistoryState>(
        buildWhen: (previous, current) {
      return previous.filterType != current.filterType ||
          previous.type != current.type;
    }, builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableChips<QAFilterType>(
            selected: <QAFilterType>{}..add(state.filterType),
            data: [
              ChipData(
                value: QAFilterType.all,
                label: S.of(context).entire,
              ),
              ChipData(
                value: QAFilterType.yes,
                label: S.of(context).answeredInquiry,
              ),
              ChipData(
                value: QAFilterType.no,
                label: S.of(context).pending,
              ),
            ],
            onSelect: (value) {
              context.read<InquiryHistoryCubit>().onChangeFilterStatus(value);
            },
          ),
          SizedBox(
            height: 10,
          ),
          SelectableChips<QAType>(
            selected: <QAType>{}..add(state.type),
            data: [
              ChipData(
                value: QAType.all,
                label: S.of(context).all,
              ),
              ChipData(
                value: QAType.product,
                label: S.of(context).product,
              ),
              ChipData(
                value: QAType.delivery,
                label: S.of(context).delivery,
              ),
              ChipData(
                value: QAType.return_refund,
                label: S.of(context).refund,
              ),
              ChipData(
                value: QAType.cancel,
                label: S.of(context).cancel,
              ),
              ChipData(
                value: QAType.exchange,
                label: S.of(context).exchange,
              ),
              ChipData(
                value: QAType.other,
                label: S.of(context).other,
              )
            ],
            onSelect: (value) {
              context.read<InquiryHistoryCubit>().onChangeQAType(value);
            },
          ),
        ],
      );
    });
  }
}
