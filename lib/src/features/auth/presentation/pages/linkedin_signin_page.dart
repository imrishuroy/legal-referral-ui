import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:linkedin_login/linkedin_login.dart';

class LinkedinSignInPage extends StatelessWidget {
  const LinkedinSignInPage({super.key});
  static const String name = 'LinkedinSignInPage';

  @override
  Widget build(BuildContext context) {
    return LinkedInUserWidget(
      clientId: dotenv.get('LINKEDIN_CLIENT_ID', fallback: ''),
      clientSecret: dotenv.get('LINKEDIN_CLIENT_SECRET', fallback: ''),
      redirectUrl: dotenv.get('LINKEDIN_REDIRECT_URL', fallback: ''),
      onGetUserProfile: (UserSucceededAction linkedInUser) {
        AppLogger.info('accessToken: ${linkedInUser.user.token.accessToken}');

        context.pop(linkedInUser);
      },
      onError: (UserFailedAction e) {
        AppLogger.error('Error Linkedin Login : $e');
        context.pop();
      },
    );
  }
}
