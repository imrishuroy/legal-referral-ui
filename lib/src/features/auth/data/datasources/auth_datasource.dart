import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';

class AuthDataSource {
  AuthDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<AppUser?> createUser({
    required String email,
    required String firstName,
    required String lastName,
    required String? mobile,
    required int signUpMethod,
    String? imageUrl,
    File? userImage,
  }) async {
    try {
      final user = await _apiClient.createUser(
        email: email,
        firstName: firstName,
        lastName: lastName,
        signUpMethod: signUpMethod,
        mobile: mobile,
        imageUrl: imageUrl,
        userImage: userImage,
      );
      return user;
    } catch (_) {
      rethrow;
    }
  }

  Future<String?> ping() async {
    try {
      return _apiClient.ping();
    } catch (error) {
      debugPrint('Error in ping $error');
    }
    return null;
  }

  Future<String?> customSignUp({
    required AppUser appUser,
  }) async {
    try {
      final res = await _apiClient.customSignUp(appUser);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<AppUser?> signUp({
    required AppUser appUser,
  }) async {
    try {
      final res = await _apiClient.signUp(appUser);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<AppUser?> signIn({
    required SignInReq signInReq,
  }) async {
    try {
      final user = await _apiClient.signIn(signInReq);
      return user;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> sendOTP({
    required SendOtpReq sendOtpReq,
  }) async {
    try {
      final response = await _apiClient.sendOtp(sendOtpReq);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> verifyOTP({
    required VerifyOtpReq verifyOtpReq,
  }) async {
    try {
      final response = await _apiClient.verifyOtp(verifyOtpReq);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> resetPassword({
    required ResetPasswordReq resetPasswordReq,
  }) async {
    try {
      final response = await _apiClient.resetPassword(resetPasswordReq);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<AppUser?> getUser({
    required String userId,
  }) async {
    try {
      final user = await _apiClient.getUser(userId);
      return user;
    } catch (_) {
      rethrow;
    }
  }
}
