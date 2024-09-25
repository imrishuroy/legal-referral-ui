import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrl => APIConstants.baseUrl;

  @singleton
  APIClient apiClient() {
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerSingleton<Dio>(Dio());
    }
    final dioInstance = getIt<Dio>();
    dioInstance.options.baseUrl = baseUrl;
    final apiClient = APIClient(dioInstance, baseUrl: baseUrl);
    return apiClient;
  }

  @singleton
  AuthDataSource authDataSource() {
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerSingleton<Dio>(Dio());
    }

    final dioInstance = getIt<Dio>();
    dioInstance.options.baseUrl = baseUrl;
    final apiClient = APIClient(dioInstance, baseUrl: baseUrl);
    return AuthDataSource(
      apiClient: apiClient,
    );
  }

  @singleton
  WizardDataSource wizardDataSource() {
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerSingleton<Dio>(Dio());
    }

    final dioInstance = getIt<Dio>();
    dioInstance.options.baseUrl = baseUrl;
    final apiClient = APIClient(dioInstance, baseUrl: baseUrl);
    return WizardDataSource(
      apiClient: apiClient,
    );
  }
}
