import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_bottom_sheet.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
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
  void initState() {
    _authBloc.add(AuthInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (_, state) async {
          if (state.emailOTPStatus == EmailOTPStatus.sent) {
            await CustomBottomSheet.show(
              context: context,
              child: EmailVerificationModal(
                email: _emailController.text,
                authBloc: _authBloc,
              ),
            );
          } else if (state.emailOTPStatus == EmailOTPStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Failed to send OTP',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          AppLogger.debug('Auth Bloc SignUp Page $state');
          return SafeArea(
            child: state.emailOTPStatus == EmailOTPStatus.loading
                ? const CustomLoadingIndicator()
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
                                IconStringConstants.legalReferralLogo,
                              ),
                            ),
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
                              labelText: 'Enter first name',
                              validator: (value) =>
                                  Validator.validateFirstName(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _lastNameController,
                              hintText: 'Enter last name',
                              labelText: 'Last Name',
                              validator: (value) =>
                                  Validator.validateLastName(value),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'Enter email address',
                              labelText: 'Email address',
                              validator: (value) =>
                                  Validator.validateEmail(value),
                            ),
                            SizedBox(height: 24.h),
                            CustomElevatedButton(
                              onTap: _signUp,
                              text: 'Verify Email',
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
                                  onPressed: () =>
                                      context.goNamed(SignInPage.name),
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
        AuthTempSignedUp(
          email: _emailController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        ),
      );
    }
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
