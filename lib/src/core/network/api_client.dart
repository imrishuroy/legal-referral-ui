import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
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
  Future<AppUser?> createUser(
    @Body() AppUser appUser,
  );

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

  @POST('/users/{userId}/profile-image')
  Future<ResponseMsg?> uploadUserImage(
    @Path('userId') String userId,
    @Body() UploadUserImageReq uploadUserImageReq,
  );

  @POST('/license/upload')
  Future<ResponseMsg?> uploadLicense(
    @Body() UploadLicenseReq uploadLicenseReq,
  );

  @POST('/about-you')
  Future<ResponseMsg?> saveAboutYou(
    @Body() AboutYouReq aboutYouReq,
  );
}
