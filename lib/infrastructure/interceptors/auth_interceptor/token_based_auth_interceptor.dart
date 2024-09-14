import 'dart:io';

import 'package:dio/dio.dart';

import '../../../application/services/app/token_service/token_service.dart';
import 'auth_interceptor.dart';

class TokenBasedAuthInterceptor extends AuthInterceptor {
  TokenBasedAuthInterceptor({required this.tokenService, required this.dio});

  @override
  final Dio dio;

  final TokenService tokenService;

  @override
  void attachToken(RequestOptions options) {
    String? accessToken = tokenService.accessToken;
    if (accessToken != null) {
      accessToken = 'Bearer $accessToken';
      options.headers[HttpHeaders.authorizationHeader] = accessToken;
    }
  }

  @override
  Future<RefreshTokenResult> resetToken() async {
    return tokenService.refreshTokens();
  }

  @override
  bool isTokenRequired(RequestOptions options) {
    final String url = options.uri.toString();
    return !url.startsWith(
        'https://success-mania-assets-dev.s3.ap-northeast-2.amazonaws.com');
  }
}
