import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/image_string_constants.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

const chatRoom = ChatRoom(
  roomId: '96b6cffdc5a4599184d1bd9f8b05baab07cd4253',
  user1Id: 'U0IOaCtQLWgzzHrFglBMhwIGl312',
  user2Id: 'babfbd48-3432-4d6b-ba2f-aa7f2e1c36d3',
  user2AvatarUrl:
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  user2FirstName: 'John',
  user2LastName: 'Doe',
);

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
              context.goNamed(HomePage.name);
              //context.goNamed(ChatMessagesPage.name, extra: chatRoom);
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
                    ImageStringConstants.legalReferralLogo,
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
