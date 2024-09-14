import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/app/app_config/app_config.dart';
import '../../../application/services/sweettracker/controller/controller.dart';
import '../../../application/services/sweettracker/response/response.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/item_divider.dart';
import 'blocs/delivery_status_cubit.dart';
import 'blocs/delivery_status_state.dart';
import 'widgets/delivery_level.dart';
import 'widgets/shipping_company_information.dart';
import 'widgets/time_line_item.dart';

class DeliveryStatusScreen extends StatefulWidget {
  const DeliveryStatusScreen({
    super.key,
    required this.courierId,
    required this.trackingId,
    required this.courierName,
  });

  final String courierId;
  final String trackingId;
  final String courierName;

  @override
  State<DeliveryStatusScreen> createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeliveryStatusCubit>(
      lazy: false,
      create: (context) {
        final AppConfig appConfig = context.read<AppConfig>();
        return DeliveryStatusCubit(
            sweetTrackerController: context.read<SweetTrackerController>(),
            failureHandlerManager: context.read<FailureHandlerManager>(),
            tCode: widget.courierId,
            tInvoice: widget.trackingId,
            tKey: appConfig.sweettrackerApiKey);
      },
      child: BlocBuilder<DeliveryStatusCubit, DeliveryStatusState>(
        builder: (context, state) {
          final TrackingInfoResponse? trackingDetailResponse =
              state.trackingInfoResponse;
          final int numberOfTrackingDetails =
              trackingDetailResponse?.trackingDetails?.length ?? 0;
          return Scaffold(
            appBar: CommonAppBar(
              title: Text(
                S.of(context).deliveryStatus,
                style: Styles.s15()
                    .withWeight(FontWeight.w600)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main),
              ),
              centerTitle: true,
            ),
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async {
                      context.read<DeliveryStatusCubit>().reload();
                    },
                    child: SingleChildScrollView(
                      child: Column(children: [
                        ShippingCompanyInformation(
                            invoiceNo: widget.trackingId,
                            shippingCompany: widget.courierName),
                        DeliveryLevel(
                          currentLevel: state.trackingInfoResponse?.level ?? 2,
                        ),
                        const ItemDivider(
                          thickness: 8,
                          padding: EdgeInsets.zero,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: numberOfTrackingDetails,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          itemBuilder: (context, index) {
                            return TimeLineItem(
                              trackingDetailResponse:
                                  trackingDetailResponse?.trackingDetails?[
                                      numberOfTrackingDetails - index - 1],
                              isFirst: index == 0,
                              isLast: index == numberOfTrackingDetails - 1,
                              isCompleted:
                                  state.trackingInfoResponse?.completeYN == 'Y',
                            );
                          },
                        ),
                      ]),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
