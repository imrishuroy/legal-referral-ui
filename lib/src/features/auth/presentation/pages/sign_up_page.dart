import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';

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
        listener: (context, state) {
          if (state.authStatus == AuthStatus.signedUp) {
            context.goNamed(
              HomePage.name,
            );
          }
          if (state.authStatus == AuthStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.failure?.message}'),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: state.authStatus == AuthStatus.loading
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
                                LegalReferralImg.legalReferralLogo,
                              ),
                            ),

                            // Sign Up fiels
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
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _lastNameController,
                              hintText: 'John',
                              labelText: 'Last Name',
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'JohnDavid22@gmail.com',
                              labelText: 'Email address',
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            const SizedBox(height: 24),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: '*********',
                              labelText: 'Password',
                              // validator: () {
                              //   return null;
                              // },
                            ),
                            const SizedBox(height: 24),
                            // verify button
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
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInPage(),
                                      ),
                                    );
                                  },
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
        AuthSignedUp(
          email: _emailController.text,
          password: _passwordController.text,
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
