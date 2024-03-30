import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
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

  @POST('/sign-up')
  Future<SignUpResponse?> signUp(
    @Body() AppUser appUser,
  );

  @POST('/sign-in')
  Future<AppUser?> signIn(
    @Body() SignInReq signInReq,
  );

  @POST('/otp/email')
  Future<SendEmailOtpRes> sendEmailOtp(
    @Body() SendEmailOtpReq sendEmailOtpReq,
  );

  @POST('/otp/email/verify')
  Future<ResponseMsg?> verifyEmailOtp(
    @Body() VerifyEmailOtpReq verifyEmailOtpReq,
  );

  @POST('/otp/mobile')
  Future<ResponseMsg?> sendMobileOtp(
    @Body() SendMobileOtpReq sendMobileOtpReq,
  );

  @POST('/otp/mobile/verify')
  Future<ResponseMsg?> verifyMobileOtp(
    @Body() VerifyMobileOtpReq verifyMobileOtpReq,
  );

  @PUT('/user')
  Future<AppUser?> updateUser(
    @Body() AppUser appUser,
  );
}
