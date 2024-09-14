import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../utilities/logging/logging.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      logging.i({
        'method request': options.method,
        'uri': options.uri,
        'header': options.headers,
        'data': options.data,
      });
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      logging.i({
        'method response': response.requestOptions.method,
        'uri': response.realUri,
        'statusCode': response.statusCode,
        'data': response.data,
      });
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      logging.e({
        'uri': err.response?.realUri,
        'statusCode': err.response?.statusCode,
        'data': err.response?.data,
      });
    }
    super.onError(err, handler);
  }
}
