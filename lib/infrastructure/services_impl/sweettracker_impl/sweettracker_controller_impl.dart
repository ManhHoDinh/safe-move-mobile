import 'package:dio/dio.dart';

import '../../../application/failures/dio_failure/dio_failure.dart';
import '../../../application/services/sweettracker/controller/controller.dart';
import '../../../application/services/sweettracker/request/src/tracking_info_request.dart';
import '../../../application/services/sweettracker/response/response.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

class SweetTrackerControllerImpl with SweetTrackerController {
  SweetTrackerControllerImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Result<Failure, TrackingInfoResponse>> getTrackingInfo(
      TrackingInfoRequest request, String url) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          't_key': request.tKey,
          't_code': request.tCode,
          't_invoice': request.tInvoice,
        },
      );
      if ((response.data as Map<String, dynamic>).containsKey('msg')) {
        return Left(BadRequestFailure(
          apiPath: url,
          statusCode: response.statusCode ?? 0,
          code:
              "sw${(response.data as Map<String, dynamic>)['code'] as String}",
          message:
              "sw${(response.data as Map<String, dynamic>)['msg'] as String}",
        ));
      }
      return Right(
          TrackingInfoResponse.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (error) {
      return Left(BadRequestFailure(
        apiPath: url,
        statusCode: error.response?.statusCode ?? 0,
        code: (error.response?.data as Map<String, dynamic>).containsKey('code')
            ? "sw${(error.response?.data as Map<String, dynamic>)['code'] as String}"
            : null,
        message: (error.response?.data as Map<String, dynamic>)
                .containsKey('msg')
            ? "sw${(error.response?.data as Map<String, dynamic>)['msg'] as String}"
            : null,
      ));
    }
  }
}
