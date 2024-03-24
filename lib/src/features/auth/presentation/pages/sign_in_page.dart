import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';

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
                state.userStatus == UserStatus.authorized) {
              context.goNamed(HomePage.name);
            }

            if (state.authStatus == AuthStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failure: ${state.failure?.message}'),
                ),
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160,
                              width: 160,
                              child: SvgPicture.asset(
                                LegalReferralImg.legalReferralLogo,
                              ),
                            ),
                            const Text(
                              'Log In',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _emailController,
                              hintText: 'SamAtman',
                              labelText: 'User Name',
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: LegalReferralColors.textgrey300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            CustomButton(
                              onTap: _signIn,
                              text: 'LOG IN',
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                const Text(
                                  'Not a member yet?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: LegalReferralColors.textgrey300,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(89, 158, 217, 1),
                                    ),
                                  ),
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
