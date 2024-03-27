import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const name = 'SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //  with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        final token = SharedPrefs.getToken();
        final appUser = SharedPrefs.getUser();

        if (token != null && appUser != null) {
          context.goNamed(HomePage.name);
        } else {
          final onBoarding = SharedPrefs.getOnBoarding();
          if (onBoarding) {
            context.goNamed(SignInPage.name);
          } else {
            context.goNamed(OnBoardingPage.name);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: SizedBox(
                height: 239,
                width: 239,
                child: SvgPicture.asset(
                  LegalReferralImg.legalReferralLogo,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Access  attorney referral network nationwide',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );
  }
}
