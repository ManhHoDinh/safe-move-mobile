import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/qa/qa.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../blocs/compose_qa_cubit.dart';
import '../blocs/compose_qa_state.dart';

class QACategorySelectionSection extends StatefulWidget {
  const QACategorySelectionSection({super.key});

  @override
  State<QACategorySelectionSection> createState() =>
      _QACategorySelectionSectionState();
}

class _QACategorySelectionSectionState
    extends State<QACategorySelectionSection> {
  String getStringByEnum(QAType type, BuildContext context) {
    switch (type) {
      case QAType.product:
        return S.of(context).product;
      case QAType.delivery:
        return S.of(context).delivery;
      case QAType.return_refund:
        return S.of(context).refund;
      case QAType.cancel:
        return S.of(context).cancel;
      case QAType.exchange:
        return S.of(context).exchange;
      case QAType.other:
        return S.of(context).other;
      case QAType.all:
        return '';
    }
  }

  String getConfirmByEnum(QAType type, BuildContext context) {
    switch (type) {
      case QAType.product:
        return S.of(context).product;
      case QAType.delivery:
        return S.of(context).delivery;
      case QAType.return_refund:
        return S.of(context).refund;
      case QAType.cancel:
        return S.of(context).cancel;
      case QAType.exchange:
        return S.of(context).exchange;
      case QAType.other:
        return S.of(context).other;
      case QAType.all:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComposeQACubit, ComposeQAState>(
        buildWhen: (previous, current) => previous.type != current.type,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).productRating,
                style: Styles.s18()
                    .withHeight(1)
                    .withLetterSpacing(-2.5 / 100)
                    .withWeight(FontWeight.w600)
                    .withColor(AppColors.text.main),
              ),
              const SizedBox(height: 16),
              BlocBuilder<ComposeQACubit, ComposeQAState>(
                  buildWhen: (previous, current) =>
                      previous.type != current.type,
                  builder: (context, state) {
                    return DropDownBar<QAType>(
                      value: state.type,
                      hintText: S.of(context).qaCategoryTypePlaceHolder,
                      onChanged: (value) {
                        context.read<ComposeQACubit>().onChangedType(value);
                      },
                      data: QAType.values
                          .where((e) => e != QAType.all)
                          .toList()
                          .map((e) => DropDownBarData(
                              value: e, title: getStringByEnum(e, context)))
                          .toList(),
                    );
                  }),
            ],
          );
        });
  }
}
