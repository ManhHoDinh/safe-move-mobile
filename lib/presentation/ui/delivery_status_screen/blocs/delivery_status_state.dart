import '../../../../application/services/sweettracker/response/response.dart';

class DeliveryStatusState {
  const DeliveryStatusState({
    this.trackingInfoResponse,
    this.loading = false,
    this.error,
  });

  final TrackingInfoResponse? trackingInfoResponse;
  final bool loading;
  final String? error;

  DeliveryStatusState copyWith({
    TrackingInfoResponse? trackingInfoResponse,
    bool? loading,
    String? error,
  }) {
    return DeliveryStatusState(
        trackingInfoResponse: trackingInfoResponse ?? this.trackingInfoResponse,
        loading: loading ?? this.loading,
        error: error);
  }

  DeliveryStatusState errorHandler() {
    return DeliveryStatusState(
      trackingInfoResponse: trackingInfoResponse,
      loading: loading,
    );
  }
}
