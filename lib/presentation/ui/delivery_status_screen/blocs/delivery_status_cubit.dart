import 'dart:async';

import '../../../../application/services/sweettracker/controller/controller.dart';
import '../../../../application/services/sweettracker/request/request.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import 'delivery_status_state.dart';

class DeliveryStatusCubit extends SafeCubit<DeliveryStatusState> {
  DeliveryStatusCubit({
    required this.sweetTrackerController,
    required this.failureHandlerManager,
    required this.tCode,
    required this.tInvoice,
    required this.tKey,
  }) : super(const DeliveryStatusState()) {
    _fetchData();
  }

  final SweetTrackerController sweetTrackerController;
  final FailureHandlerManager failureHandlerManager;
  final String tCode;
  final String tInvoice;
  final String tKey;

  Future<void> _fetchData() async {
    emit(state.copyWith(loading: true));

    final result = await sweetTrackerController.getTrackingInfo(
        TrackingInfoRequest(tCode: tCode, tInvoice: tInvoice, tKey: tKey),
        '/api/v1/trackingInfo');
    if (result.isLeft) {
      return failureHandlerManager.handle(result.left);
    }
    emit(state.copyWith(loading: false, trackingInfoResponse: result.right));
  }

  void reload() {
    _fetchData();
  }
}
