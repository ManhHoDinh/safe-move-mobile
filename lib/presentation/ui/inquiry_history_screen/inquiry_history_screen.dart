import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/qa/qa.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import 'blocs/inquiry_history_cubit.dart';
import 'widgets/inquiry_history_status_filter.dart';
import 'widgets/qa_list.dart';

class InquiryHistoryScreen extends StatelessWidget {
  const InquiryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InquiryHistoryCubit>(
      create: (context) {
        return InquiryHistoryCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          qaController: context.read<QAController>(),
        );
      },
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: CommonAppBar(
            title: Text(
              S.of(context).inquiryHistory,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withHeight(1)
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.main),
            ),
            centerTitle: true,
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              InquiryHistoryStatusFilter(),
              SizedBox(
                height: 24,
              ),
              Expanded(child: QAList())
            ],
          ),
        );
      }),
    );
  }
}
