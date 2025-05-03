import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIConstants {
  APIConstants._();

  static String get baseURL => dotenv.get('BASE_URL');
  static String get hostURL => dotenv.get('HOST_URL');
  static String get authBaseURL => dotenv.get('AUTH_BASE_URL');
  static String get cloudFrontURL => dotenv.get('CLOUDFRONT_URL');
}
