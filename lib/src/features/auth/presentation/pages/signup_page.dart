import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_bottomsheet.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/email_verification_model.dart';
import 'package:toastification/toastification.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const name = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (_, state) {
          if (state.authStatus == AuthStatus.signedUp &&
                  state.emailOTPStatus == EmailOTPStatus.sent ||
              state.emailOTPStatus == EmailOTPStatus.resent) {
            debugPrint('checking bottom sheet');
            _verifyEmailBottomSheet(context);
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
        builder: (_, state) {
          return SafeArea(
            child: state.authStatus == AuthStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160.h,
                              width: 160.w,
                              child: SvgPicture.asset(
                                ImageStringsUtil.legalReferralLogo,
                              ),
                            ),

                            // Sign Up fiels
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 24.h,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _firstNameController,
                              hintText: 'David',
                              labelText: 'First Name',
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _lastNameController,
                              hintText: 'John',
                              labelText: 'Last Name',
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'JohnDavid22@gmail.com',
                              labelText: 'Email address',
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            //   SizedBox(height: 24),
                            // CustomTextField(
                            //   controller: _passwordController,
                            //   hintText: '*********',
                            //   labelText: 'Password',
                            //   // validator: () {
                            //   //   return null;
                            //   // },
                            // ),
                            SizedBox(height: 24.h),
                            // verify button
                            CustomElevatedButton(
                              onTap: _signUp,
                              text: 'Sign Up',
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              children: [
                                Text(
                                  'Already a member? ',
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
                                  text: 'LOG IN',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: 156.h),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        AuthSignedUp(
          email: _emailController.text,
          password: _passwordController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        ),
      );
    }
  }

  Future<void> _verifyEmailBottomSheet(BuildContext context) async {
    // TODO(Satyam): Add animation to it, smooth closing and smooth opening
    return CustomBottomSheet.show(
      context: context,
      child: EmailVerificationModal(
        email: _emailController.text,
        authBloc: _authBloc,
      ),
    );
  }

  Future<dynamic> successBottomSheet(BuildContext context) {
    return CustomBottomSheet.show(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 114.h,
            width: 114.w,
            child: SvgPicture.asset(
              ImageStringsUtil.successLogo,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Mobile number verified',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.h),
          CustomElevatedButton(
            onTap: () {},
            text: 'Continue',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
