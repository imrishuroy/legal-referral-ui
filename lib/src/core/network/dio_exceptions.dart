import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    statusCode = dioError.response?.statusCode;
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = StringConstants.dioExceptionCanceltxt;
        break;
      case DioExceptionType.connectionTimeout:
        message = StringConstants.dioExceptionConnectionTimeOutTxt;
        break;
      case DioExceptionType.receiveTimeout:
        message = StringConstants.dioExceptionreciveTimeoUt;
        break;
      case DioExceptionType.badResponse:
        if (dioError.response?.data is String) {
          message = _handleError(
            dioError.response?.statusCode,
            json.decode(dioError.response?.data) as Map<String, dynamic>,
          );
        } else {
          message = _handleError(
            dioError.response?.statusCode,
            dioError.response?.data as Map<String, dynamic>,
          );
        }

        break;
      case DioExceptionType.connectionError:
        message = StringConstants.dioExceptionConnectionErr;
        break;

      case DioExceptionType.sendTimeout:
        message = StringConstants.dioExceptionsendTimeout;
        break;
      case DioExceptionType.unknown:
        message = StringConstants.dioExceptionUnknowntxt;
        break;
      default:
        message = StringConstants.dioExcpetiondefaultError;
        break;
    }
  }
  late String message;
  late int? statusCode;

  String _handleError(int? statusCode, Map<String, dynamic> error) {
    switch (statusCode) {
      case 400:
        return error['message'] ??
            StringConstants.dioExceptionSomethingWentWrong;
      case 401:
        return StringConstants.dioExceptionSessionExpiredtxt;
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 409:
        return error['message'];
      case 500:
        return error['message'];
      case 502:
        return 'Bad gateway';
      default:
        return StringConstants.dioExceptionSomethingWentWrong;
    }
  }

  @override
  String toString() => message;
}
