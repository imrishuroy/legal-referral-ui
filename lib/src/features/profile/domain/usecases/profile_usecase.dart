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

  Future<Either<Failure, Experience?>> addExperience({
    required AddExperienceReq addExperienceReq,
  }) async {
    return _profileRepository.addExperience(
      addExperienceReq: addExperienceReq,
    );
  }

  Future<Either<Failure, Education?>> addEducation({
    required Education education,
  }) async {
    return _profileRepository.addEducation(
      education: education,
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
}
