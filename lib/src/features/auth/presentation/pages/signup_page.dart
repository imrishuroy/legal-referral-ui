import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

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
            await _verifyEmailBottomSheet(context);
          }
          if (state.emailOTPStatus == EmailOTPStatus.failure) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.failure?.message}'),
              ),
            );
          }
          if (state.emailOTPStatus == EmailOTPStatus.failure) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.failure?.message}'),
              ),
            );
          }
        },
        builder: (_, state) {
          AppLogger.debug('Auth Bloc SignUp Page $state');
          return SafeArea(
            child: state.emailOTPStatus == EmailOTPStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160,
                              width: 160,
                              child: SvgPicture.asset(
                                ImageStringsUtil.legalReferralLogo,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _firstNameController,
                              hintText: 'David',
                              labelText: 'First Name',
                              validator: (value) =>
                                  Validator.validateFirstName(value),
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _lastNameController,
                              hintText: 'John',
                              labelText: 'Last Name',
                              validator: (value) =>
                                  Validator.validateLastName(value),
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'JohnDavid22@gmail.com',
                              labelText: 'Email address',
                              validator: (value) =>
                                  Validator.validateEmail(value),
                            ),
                            const SizedBox(height: 24),
                            CustomElevatedButton(
                              onTap: _signUp,
                              text: 'Sign Up',
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                const Text(
                                  'Already a member? ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: LegalReferralColors.textgrey300,
                                  ),
                                ),
                                CustomTextButton(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  textColor: LegalReferralColors.textBlue100,
                                  text: 'LOG IN',
                                  onPressed: () =>
                                      context.goNamed(SignInPage.name),
                                ),
                              ],
                            ),
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

  Future<void> _verifyEmailBottomSheet(BuildContext context) async {
    // TODO(Satyam): Add animation to it, smooth closing and smooth opening
    return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: LegalReferralColors.containerWhite500,
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) => EmailVerificationModal(
        email: _emailController.text,
        authBloc: _authBloc,
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
