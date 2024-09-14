import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../application/services/app/token_service/token_service.dart';
import '../../dio_utils/dio_resend.dart';

abstract class AuthInterceptor extends QueuedInterceptor with DioResend {
  /// Implement logic of checking whether the request need token or nor
  @protected
  bool isTokenRequired(RequestOptions options);

  /// Get tokens from some source and attach it into options header
  @protected
  void attachToken(RequestOptions options);

  /// Update token from src when token expired and handle if the process false
  @protected
  Future<RefreshTokenResult> resetToken();

  @protected
  bool isTokenExpired(DioException error) {
    return error.response?.statusCode == 401;
  }

  @override
  @mustCallSuper
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (isTokenRequired(options)) {
      attachToken(options);
    }
    super.onRequest(options, handler);
  }

  @protected
  void onTokenExpired(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final resetTokenSuccess = await resetToken();
    if (!resetTokenSuccess.success) {
      return handler.reject(err);
    }
    attachToken(options);
    try {
      final response = await performResend(options);
      return handler.resolve(response);
    } on DioException catch (err) {
      return handler.reject(err);
    }
  }

  @override
  @mustCallSuper
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    if (isTokenExpired(err) && isTokenRequired(options)) {
      return onTokenExpired(err, handler);
    }
    return super.onError(err, handler);
  }
}
