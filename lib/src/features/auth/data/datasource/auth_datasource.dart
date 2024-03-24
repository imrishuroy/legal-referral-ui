import 'package:flutter/foundation.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/data/models/sign_in_req.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';

class AuthDataSource {
  AuthDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<AppUser?> signUp({
    required AppUser appUser,
  }) async {
    try {
      final user = await _apiClient.signUp(appUser);
      return user;
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

  Future<String?> ping() async {
    try {
      return _apiClient.ping();
    } catch (error) {
      debugPrint('Error in ping $error');
    }
    return null;
  }

  // Future<AppUser> createUser({
  //   required AppUser appUser,
  // }) async {
  //   try {
  //     return await _apiClient.createUser(
  //       appUser,
  //     );
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // Future<AppUser> getUser({
  //   required String? id,
  // }) async {
  //   try {
  //     return await _apiClient.getUser(id);
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
