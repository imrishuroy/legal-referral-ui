import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: _authBloc,
          listener: (context, state) {
            if (state.authStatus == AuthStatus.signedIn &&
                state.user?.mobileVerified == false) {
              context.goNamed(ContactDetailsPage.name);
            }

            if (state.authStatus == AuthStatus.signedIn &&
                state.user?.wizardCompleted == true) {
              context.goNamed(HomePage.name);
            }

            if (state.authStatus == AuthStatus.failure) {
              CustomSnackbar.showToast(
                context,
                title: 'Error',
                description: state.failure?.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            return state.authStatus == AuthStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160.h,
                              width: 160.w,
                              child: SvgPicture.asset(
                                ImageStringsUtil.legalReferralLogo,
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
                              hintText: 'SamAtman',
                              labelText: 'User Name',
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
                                    context.goNamed(ResetPasswordPage.name),
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
                            CustomOutlinedButton(
                              text: 'Log in using Google',
                              onPressed: _googleSignIn,
                            ),
                            SizedBox(height: 24.h),
                            Row(
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
                                      context.goNamed(SignUpPage.name),
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

  void _googleSignIn() {
    _authBloc.add(AuthGoogleSignedIn());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}