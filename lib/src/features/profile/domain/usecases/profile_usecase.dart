import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

@lazySingleton
class ProfileUseCase {
  ProfileUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;
  final ProfileRepository _profileRepository;

  Future<Either<Failure, UserProfile?>> fetchUserProfile({
    required String userId,
  }) async {
    return _profileRepository.fetchUserProfile(
      userId: userId,
    );
  }

  Future<Either<Failure, String?>> updateUserAvatar({
    required String userId,
    required File file,
  }) async {
    return _profileRepository.updateUserAvatar(
      userId: userId,
      file: file,
    );
  }

  Future<Either<Failure, List<Firm?>>> searchFirm({
    required String query,
    required int limit,
    required int offset,
  }) async {
    return _profileRepository.searchFirm(
      query: query,
      limit: limit,
      offset: offset,
    );
  }

  Future<Either<Failure, AppUser?>> uploadUserInfo({
    required UploadUserInfoReq uploadUserInfoReq,
  }) async {
    return _profileRepository.uploadUserInfo(
      uploadUserInfoReq: uploadUserInfoReq,
    );
  }

  Future<Either<Failure, Social?>> addSocial({
    required Social social,
  }) async {
    return _profileRepository.addSocial(
      social: social,
    );
  }

  Future<Either<Failure, Social?>> updateSocial({
    required int socialId,
    required Social social,
  }) async {
    return _profileRepository.updateSocial(
      socialId: socialId,
      social: social,
    );
  }

  Future<Either<Failure, List<Social?>>> fetchSocials({
    required EntityType entityType,
    required String entityId,
  }) async {
    return _profileRepository.fetchSocials(
      entityType: entityType,
      entityId: entityId,
    );
  }

  Future<Either<Failure, ResponseMsg?>> deleteSocial({
    required int socialId,
  }) async {
    return _profileRepository.deleteSocial(
      socialId: socialId,
    );
  }

  Future<Either<Failure, Price?>> addPrice({
    required Price price,
  }) async {
    return _profileRepository.addPrice(
      price: price,
    );
  }

  Future<Either<Failure, Price?>> updatePrice({
    required int priceId,
    required Price price,
  }) async {
    return _profileRepository.updatePrice(
      priceId: priceId,
      price: price,
    );
  }

  Future<Either<Failure, ResponseMsg?>> toggleReferral({
    required String userId,
    required ToggleReferralReq toggleReferralReq,
  }) async {
    return _profileRepository.toggleReferral(
      userId: userId,
      toggleReferralReq: toggleReferralReq,
    );
  }

  Future<Either<Failure, String?>> updateUserBanner({
    required String userId,
    required File file,
  }) async {
    return _profileRepository.updateUserBanner(
      userId: userId,
      file: file,
    );
  }

  // profile/experiences

  Future<Either<Failure, UserExperience?>> addExperience({
    required String userId,
    required AddUpdateExperienceReq experienceReq,
  }) async {
    return _profileRepository.addExperience(
      userId: userId,
      experienceReq: experienceReq,
    );
  }

  Future<Either<Failure, List<UserExperience?>>> fetchExperiences({
    required String userId,
  }) async {
    return _profileRepository.fetchExperiences(
      userId: userId,
    );
  }

  Future<Either<Failure, UserExperience?>> updateExperience({
    required String userId,
    required int experienceId,
    required AddUpdateExperienceReq experienceReq,
  }) async {
    return _profileRepository.updateExperience(
      userId: userId,
      experienceId: experienceId,
      experienceReq: experienceReq,
    );
  }

  Future<Either<Failure, ResponseMsg?>> deleteExperience({
    required String userId,
    required int experienceId,
  }) async {
    return _profileRepository.deleteExperience(
      userId: userId,
      experienceId: experienceId,
    );
  }

  // profile/educations

  Future<Either<Failure, Education?>> addEducation({
    required Education education,
  }) async {
    return _profileRepository.addEducation(
      education: education,
    );
  }

  Future<Either<Failure, List<Education?>>> fetchEducations({
    required String userId,
  }) async {
    return _profileRepository.fetchEducations(
      userId: userId,
    );
  }

  Future<Either<Failure, Education?>> updateEducation({
    required String userId,
    required int educationId,
    required Education education,
  }) async {
    return _profileRepository.updateEducation(
      userId: userId,
      educationId: educationId,
      education: education,
    );
  }

  Future<Either<Failure, ResponseMsg?>> deleteEducation({
    required String userId,
    required int educationId,
  }) async {
    return _profileRepository.deleteEducation(
      userId: userId,
      educationId: educationId,
    );
  }
}
