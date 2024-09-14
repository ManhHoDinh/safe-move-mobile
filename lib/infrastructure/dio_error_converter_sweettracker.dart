import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../application/failures/dio_failure/dio_failure.dart';
import '../utilities/logging/logging.dart';
import 'dio_error_converter.dart';

class DioErrorConverterSweetTracker extends DioErrorConverter {
  const DioErrorConverterSweetTracker({required super.error});

  @override
  @protected
  DioFailure parseResponseFailure(
      {required DioException error, required String apiPath}) {
    final errResponse = error.response;
    final statusCode = errResponse?.statusCode ?? 0;
    if (statusCode == 0) {
      return OtherDioFailure(apiPath: apiPath);
    }
    final responseData = errResponse?.data;
    String? code;
    String? message;
    if (responseData is Map<String, dynamic>) {
      Map<String, dynamic> data = {};
      data = responseData;
      if (data.containsKey('code')) {
        code = data['code']?.toString();
      }
      if (data.containsKey('msg')) {
        message = data['msg']?.toString();
      }
    }
    logging.e('code', message);
    return BadRequestFailure(
      statusCode: statusCode,
      apiPath: apiPath,
      code: code,
      message: message,
    );
  }
}
