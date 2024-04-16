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

  @GET('/firms')
  Future<List<Firm?>> searchFirm(
    @Query('query') String query,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/experience')
  Future<Experience?> addExperience(
    @Body() AddExperienceReq addExperienceReq,
  );

  @POST('/education')
  Future<Education?> addEducation(
    @Body() Education education,
  );

  @PUT('/users/info')
  Future<AppUser?> uploadUserInfo(
    @Body() UploadUserInfoReq uploadUserInfoReq,
  );
}
