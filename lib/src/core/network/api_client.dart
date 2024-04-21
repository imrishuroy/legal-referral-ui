import 'dart:io';

import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/data/data.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class APIClient {
  factory APIClient(
    Dio dio, {
    String? baseUrl,
  }) = _APIClient;

  @GET('/')
  Future<String> ping();

  @POST('/custom-signup')
  Future<String?> customSignUp(
    @Body() AppUser appUser,
  );

  @POST('/users')
  @MultiPart()
  Future<AppUser?> createUser({
    @Part(name: 'email') required String email,
    @Part(name: 'first_name') required String firstName,
    @Part(name: 'last_name') required String lastName,
    @Part(name: 'signup_method') required int signUpMethod,
    @Part(name: 'mobile') String? mobile,
    @Part(name: 'image_url') String? imageUrl,
    @Part(name: 'user_image') File? userImage,
  });

  @POST('/sign-up')
  Future<AppUser?> signUp(
    @Body() AppUser appUser,
  );

  @POST('/sign-in')
  Future<AppUser?> signIn(
    @Body() SignInReq signInReq,
  );

  @POST('/reset-password')
  Future<ResponseMsg?> resetPassword(
    @Body() ResetPasswordReq resetPasswordReq,
  );

  @GET('/users/{userId}')
  Future<AppUser?> getUser(
    @Path('userId') String userId,
  );

  @GET('/users/{userId}/wizardstep')
  Future<int?> getWizardStep(
    @Path('userId') String userId,
  );

  @POST('/otp/send')
  Future<ResponseMsg?> sendOtp(
    @Body() SendOtpReq sendOtpReq,
  );

  @POST('/otp/verify')
  Future<ResponseMsg?> verifyOtp(
    @Body() VerifyOtpReq verifyOtpReq,
  );

  @PUT('/user')
  Future<AppUser?> updateUser(
    @Body() AppUser appUser,
  );

  @POST('/license')
  Future<License?> saveLicense(
    @Body() License license,
  );

  @POST('/license/upload')
  @MultiPart()
  Future<ResponseMsg?> uploadLicense(
    @Part(name: 'license_pdf') File licensePdf,
  );

  @POST('/about-you')
  Future<ResponseMsg?> saveAboutYou(
    @Body() AboutYouReq aboutYouReq,
  );

  // profile

  @GET('/users/{userId}/profile')
  Future<UserProfile?> fetchUserProfile(
    @Path('userId') String userId,
  );

  @GET('/firms')
  Future<List<Firm?>> searchFirm(
    @Query('query') String query,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/education')
  Future<Education?> addEducation(
    @Body() Education education,
  );

  @PUT('/users/info')
  Future<AppUser?> uploadUserInfo(
    @Body() UploadUserInfoReq uploadUserInfoReq,
  );

  @POST('/socials')
  Future<Social?> addSocial(
    @Body() Social social,
  );

  @GET('/socials/{entityType}/{entityId}')
  Future<List<Social?>> fetchSocials(
    @Path('entityType') EntityType entityType,
    @Path('entityId') String entityId,
  );

  @PUT('/socials/{socialId}')
  Future<Social?> updateSocial(
    @Path('socialId') int socialId,
    @Body() Social social,
  );

  @POST('/price')
  Future<Price?> addPrice(
    @Body() Price price,
  );

  @PUT('/price/{priceId}')
  Future<Price?> updatePrice(
    @Path('priceId') int priceId,
    @Body() Price price,
  );

  @PUT('/users/{userId}/toggle-referral')
  Future<ResponseMsg?> toggleReferral(
    @Path('userId') String userId,
    @Body() ToggleReferralReq toggleReferralReq,
  );

  @PUT('/users/{userId}/banner')
  @MultiPart()
  Future<String?> updateUserBanner(
    @Path('userId') String userId,
    @Part(name: 'file') File file,
  );

  // profile/experiences
  @POST('/users/{userId}/experiences')
  Future<UserExperience?> addExperience(
    @Path('userId') String userId,
    @Body() AddUpdateExperienceReq addExperienceReq,
  );

  @PUT('/users/{userId}/experiences/{experienceId}')
  Future<UserExperience?> updateExperience(
    @Path('userId') String userId,
    @Path('experienceId') int experienceId,
    @Body() AddUpdateExperienceReq experienceReq,
  );

  @GET('/users/{userId}/experiences')
  Future<List<UserExperience>> fetchExperiences(
    @Path('userId') String userId,
  );

  @DELETE('/users/{userId}/experiences/{experienceId}')
  Future<ResponseMsg?> deleteExperience(
    @Path('userId') String userId,
    @Path('experienceId') int experienceId,
  );
}
