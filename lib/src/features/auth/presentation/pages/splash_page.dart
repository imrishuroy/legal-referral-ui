import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
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
    final onBoarding = SharedPrefs.getOnBoarding();
    if (onBoarding) {
      _authBloc.add(AuthInitialized());
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          if (mounted) {
            context.goNamed(OnBoardingPage.name);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.authStatus != AuthStatus.loading) {
            if (state.authStatus == AuthStatus.signedIn) {
              if (state.user?.mobileVerified == false) {
                context.goNamed(ContactDetailsPage.name);
              } else if (state.user?.wizardCompleted == true) {
                context.goNamed(SwipeRecommendationsPage.name);
              } else {
                context.goNamed(WizardInspectionPage.name);
              }
            } else if (state.authStatus == AuthStatus.failure ||
                state.authStatus == AuthStatus.initial) {
              context.goNamed(SignInPage.name);
            }
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
            const CustomLoadingIndicator(
              size: 32,
              lineWidth: 2,
            ),
            const SizedBox(height: 20),
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
