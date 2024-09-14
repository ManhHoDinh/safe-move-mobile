import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

mixin DioResend {
  Dio get dio;

  @protected
  Future<Response<dynamic>> performResend(RequestOptions options) async {
    final response = await dio.request(
      parseOriginalUri(options),
      data: options.data,
      options: Options(
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
        method: options.method,
        headers: options.headers,
        contentType: options.contentType,
        extra: options.extra,
        followRedirects: options.followRedirects,
        listFormat: options.listFormat,
        maxRedirects: options.maxRedirects,
        receiveDataWhenStatusError: options.receiveDataWhenStatusError,
        requestEncoder: options.requestEncoder,
      ),
      queryParameters: options.queryParameters,
      cancelToken: options.cancelToken,
    );
    return response;
  }

  @protected
  String parseOriginalUri(RequestOptions options) {
    String url = options.path;
    if (!url.startsWith(RegExp(r'https?:'))) {
      url = options.baseUrl + url;
      final s = url.split(':/');
      if (s.length == 2) {
        url = '${s[0]}:/${s[1].replaceAll('//', '/')}';
      }
    }
    return Uri.parse(url).normalizePath().toString();
  }
}
