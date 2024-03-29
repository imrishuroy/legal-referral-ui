import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = SharedPrefs.getToken();

    if (token != null) {
      logger.d('token from inceptor $token');
      options.headers.addAll(
        {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // final prefs = getIt<SharedPreferences>();
    // final refreshToken = response.headers.value('token');
    // if (refreshToken != null) {
    //   prefs.setString('accessToken', refreshToken);
    // }

    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint(
      'Error code: ${err.response?.statusCode}, '
      'Message: ${err.message}',
    );

    if (err.response?.statusCode == 401) {
      await LogoutManager.performLogout();
    }
    super.onError(err, handler);
  }
}
