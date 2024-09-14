import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../application/failures/dio_failure/dio_failure.dart';

class DioErrorConverter {
  const DioErrorConverter({
    required this.error,
  });

  final DioException error;

  @protected
  bool isBadRequestError(int code) {
    return code >= 400 && code < 500;
  }

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
      if (data.containsKey('message')) {
        message = data['message']?.toString();
      }
    }
    if (isBadRequestError(statusCode)) {
      return BadRequestFailure(
        statusCode: statusCode,
        apiPath: apiPath,
        code: code,
        message: message,
      );
    }
    return ServerFailure(
      apiPath: apiPath,
      statusCode: statusCode,
      code: code,
      message: message,
    );
  }

  DioFailure convert() {
    final apiPath = error.requestOptions.uri.toString();

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutFailure(apiPath: apiPath);
      case DioExceptionType.badResponse:
        return parseResponseFailure(error: error, apiPath: apiPath);
      case DioExceptionType.connectionError:
        return ConnectionFailure(apiPath: apiPath);
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return OtherDioFailure(apiPath: apiPath);
    }
  }
}
