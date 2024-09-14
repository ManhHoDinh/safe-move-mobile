import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../request/src/tracking_info_request.dart';
import '../response/response.dart';

mixin SweetTrackerController {
  Future<Result<Failure, TrackingInfoResponse>> getTrackingInfo(
      TrackingInfoRequest request, String url);
}
