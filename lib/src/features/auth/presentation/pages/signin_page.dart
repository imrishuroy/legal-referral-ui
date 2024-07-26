import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';
import 'package:signin_with_linkedin/signin_with_linkedin.dart';
import 'package:toastification/toastification.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const name = 'SignInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    _authBloc.add(AuthInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: _authBloc,
          listener: (context, state) {
            if (state.authStatus == AuthStatus.signedIn) {
              if (state.user?.mobileVerified == false) {
                context.goNamed(ContactDetailsPage.name);
              } else if (state.user?.wizardCompleted == true) {
                // context.goNamed(FeedsPage.name);
                context.goNamed(SwipeRecommendationsPage.name);
              } else {
                context.goNamed(WizardInspectionPage.name);
              }
            } else if (state.authStatus == AuthStatus.failure) {
              ToastUtil.showToast(
                context,
                title: 'Error',
                description: state.failure?.message ?? 'Failed to sign in',
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            return state.authStatus == AuthStatus.loading
                ? const CustomLoadingIndicator()
                : SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            SizedBox(height: 48.h),
                            SizedBox(
                              height: 160.h,
                              width: 160.w,
                              child: SvgPicture.asset(
                                IconStringConstants.legalReferralLogo,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Log In',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Enter Email Address',
                              labelText: 'Email Address',
                              validator: (value) =>
                                  Validator.validateEmail(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Enter Password',
                              labelText: 'Password',
                              obscureText: true,
                              validator: (value) =>
                                  Validator.validatePassword(value),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              alignment: Alignment.centerRight,
                              child: CustomTextButton(
                                fontSize: 14.h,
                                fontWeight: FontWeight.w300,
                                onPressed: () =>
                                    context.pushNamed(ResetPasswordPage.name),
                                text: 'Forgot Password?',
                                textColor: LegalReferralColors.textgrey300,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: _signIn,
                              text: 'LOG IN',
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(),
                                ),
                                Text(
                                  '  Or continue using  ',
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400,
                                    color: LegalReferralColors.textGrey400,
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgButton(
                                  imagePath: IconStringConstants.googleIcon,
                                  onPressed: () =>
                                      _authBloc.add(AuthGoogleSignedIn()),
                                ),
                                SizedBox(width: 12.w),
                                SvgButton(
                                  imagePath: IconStringConstants.facebookIcon,
                                  onPressed: () => _authBloc.add(
                                    AuthFacebookSignedIn(),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                SvgButton(
                                  imagePath: IconStringConstants.appleIcon,
                                  onPressed: () {},
                                ),
                                SizedBox(width: 12.w),
                                SvgButton(
                                  imagePath: IconStringConstants.linkedinIcon,
                                  onPressed: () async {
                                    await _linkedinLogin();
                                    // final data = await context
                                    //     .pushNamed(LinkedinSignInPage.name);

                                    // if (data is UserSucceededAction) {
                                    //   _authBloc.add(
                                    //     AuthLinkedInSignedIn(
                                    //       userSucceededAction: data,
                                    //     ),
                                    //   );
                                    // }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 48.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Not a member yet? ',
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400,
                                    color: LegalReferralColors.textgrey300,
                                  ),
                                ),
                                CustomTextButton(
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w600,
                                  textColor: LegalReferralColors.textBlue100,
                                  text: 'SIGN UP',
                                  onPressed: () =>
                                      context.pushNamed(SignUpPage.name),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        AuthSignedIn(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  Future<void> _linkedinLogin() async {
    AppLogger.info(
      'Client ID: ${dotenv.get('LINKEDIN_CLIENT_ID', fallback: '')}',
    );
    final linkedInConfig = LinkedInConfig(
      clientId: dotenv.get('LINKEDIN_CLIENT_ID', fallback: ''),
      clientSecret: dotenv.get('LINKEDIN_CLIENT_SECRET', fallback: ''),
      redirectUrl: dotenv.get('LINKEDIN_REDIRECT_URL', fallback: ''),
      scope: ['openid', 'profile', 'email'],
    );

    await SignInWithLinkedIn.signIn(
      context,
      config: linkedInConfig,
      onGetAuthToken: (data) {},
      onGetUserProfile: (token, user) {
        _authBloc.add(
          AuthLinkedInSignedIn(
            email: user.email,
            firstName: user.givenName,
            lastName: user.familyName,
            imageUrl: user.picture,
            accesToken: token.accessToken,
          ),
        );
      },
      onSignInError: (error) {
        AppLogger.error('Error on sign in: $error');
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
