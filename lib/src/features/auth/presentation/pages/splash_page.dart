import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const name = 'SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authBloc = getIt<AuthBloc>();
  late AppUser? appUser;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        appUser = SharedPrefs.getUser();
        final token = SharedPrefs.getToken();

        AppLogger.info('app user from spalsh $appUser');
        if (appUser?.userId != null &&
            appUser!.userId!.isNotEmpty &&
            token != null) {
          _authBloc.add(
            AuthUserRequested(userId: appUser!.userId!),
          );
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
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.authStatus == AuthStatus.signedIn) {
            if (state.user?.mobileVerified == false) {
              context.goNamed(ContactDetailsPage.name);
            } else if (state.user?.wizardCompleted == true) {
              context.goNamed(FeedsPage.name);
            } else {
              context.goNamed(WizardInspectionPage.name);
            }
          } else if (state.authStatus == AuthStatus.failure) {
            context.goNamed(SignInPage.name);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: SizedBox(
                  height: 239.h,
                  width: 239.w,
                  child: SvgPicture.asset(
                    IconStringConstants.legalReferralLogo,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Access attorney referral network nationwide',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
