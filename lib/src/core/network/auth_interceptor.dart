import 'dart:io';

import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = SharedPrefs.getIDToken();

    if (token != null) {
      AppLogger.info('Token from interceptor: $token');

      options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refToken = SharedPrefs.getRefreshToken();

      if (refToken != null) {
        try {
          final res = await _dio.post(
            '${APIConstants.baseUrl}/refresh-token',
            data: {
              'refresh_token': refToken,
              'grant_type': 'refresh_token',
            },
          );

          if (res.statusCode != 200) {
            await LogoutManager.performLogout();
            return;
          }

          final idToken = res.data['id_token'] as String;
          final refreshToken = res.data['refresh_token'] as String;

          await SharedPrefs.setIDToken(token: idToken);
          await SharedPrefs.setRefreshToken(token: refreshToken);

          // Retry the original request with the new token
          final opts = err.requestOptions;
          opts.headers[HttpHeaders.authorizationHeader] =
              'Bearer ${SharedPrefs.getIDToken()}';

          final response = await _dio.request(
            opts.path,
            options: Options(
              method: opts.method,
              headers: opts.headers,
            ),
            data: opts.data,
            queryParameters: opts.queryParameters,
          );

          return handler.resolve(response);
        } catch (e) {
          await LogoutManager.performLogout();
        }
      }
    }

    super.onError(err, handler);
  }
}
