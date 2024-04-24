import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

@singleton
class ProfileDataSource {
  ProfileDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<String?> updateUserAvatar({
    required String userId,
    required File file,
  }) async {
    try {
      final response = await _apiClient.updateUserAvatar(
        userId,
        file,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<UserProfile?> fetchUserProfile({required String userId}) async {
    try {
      final res = await _apiClient.fetchUserProfile(userId);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Firm?>> searchFirm({
    required String query,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _apiClient.searchFirm(
        query,
        limit,
        offset,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<AppUser?> uploadUserInfo({
    required UploadUserInfoReq uploadUserInfoReq,
  }) async {
    try {
      final res = await _apiClient.uploadUserInfo(
        uploadUserInfoReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Price?> addPrice({
    required Price price,
  }) async {
    try {
      final response = await _apiClient.addPrice(price);
      AppLogger.info('price response: $response');
      return response;
    } catch (e) {
      AppLogger.error(
        'error adding price $e',
      );
      rethrow;
    }
  }

  Future<Price?> updatePrice({
    required int priceId,
    required Price price,
  }) async {
    try {
      final response = await _apiClient.updatePrice(
        priceId,
        price,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> toggleReferral({
    required String userId,
    required ToggleReferralReq toggleReferralReq,
  }) async {
    try {
      final response = await _apiClient.toggleReferral(
        userId,
        toggleReferralReq,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<String?> updateUserBanner({
    required String userId,
    required File file,
  }) async {
    try {
      final response = await _apiClient.updateUserBanner(
        userId,
        file,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  // profile/socials

  Future<Social?> addSocial({
    required Social social,
  }) async {
    try {
      final response = await _apiClient.addSocial(social);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<Social?> updateSocial({
    required int socialId,
    required Social social,
  }) async {
    try {
      final response = await _apiClient.updateSocial(
        socialId,
        social,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Social?>> fetchSocials({
    required EntityType entityType,
    required String entityId,
  }) async {
    try {
      final response = await _apiClient.fetchSocials(
        entityType,
        entityId,
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> deleteSocial({
    required int socialId,
  }) async {
    try {
      final response = await _apiClient.deleteSocial(socialId);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  // profile/experiences
  Future<UserExperience?> addExperience({
    required String userId,
    required AddUpdateExperienceReq addExperienceReq,
  }) async {
    try {
      final res = await _apiClient.addExperience(
        userId,
        addExperienceReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<UserExperience?> updateExperience({
    required String userId,
    required int experienceId,
    required AddUpdateExperienceReq experienceReq,
  }) async {
    try {
      final res = await _apiClient.updateExperience(
        userId,
        experienceId,
        experienceReq,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<UserExperience?>> fetchExperiences({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchExperiences(userId);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> deleteExperience({
    required String userId,
    required int experienceId,
  }) async {
    try {
      final res = await _apiClient.deleteExperience(
        userId,
        experienceId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  // profile/educations

  Future<Education?> addEducation({
    required Education education,
  }) async {
    try {
      final res = await _apiClient.addEducation(education);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Education?>> fetchEducations({
    required String userId,
  }) async {
    try {
      final res = await _apiClient.fetchEducations(userId);
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<Education?> updateEducation({
    required String userId,
    required int educationId,
    required Education education,
  }) async {
    try {
      final res = await _apiClient.updateEducation(
        userId,
        educationId,
        education,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResponseMsg?> deleteEducation({
    required String userId,
    required int educationId,
  }) async {
    try {
      final res = await _apiClient.deleteEducation(
        userId,
        educationId,
      );
      return res;
    } catch (_) {
      rethrow;
    }
  }
}
