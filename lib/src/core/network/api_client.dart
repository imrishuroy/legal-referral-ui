import 'package:dio/dio.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
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
  Future<AppUser> signUp(
    @Body() AppUser appUser,
  );

  @POST('/sign-in')
  Future<AppUser> signIn(
    @Body() SignInReq signInReq,
  );
}
