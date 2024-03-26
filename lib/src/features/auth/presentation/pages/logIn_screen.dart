import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/signUp_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customButton.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customtextfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _userName = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                    controller: _userName,
                    hintText: 'SamAtman',
                    labelText: 'User Name'),
                const SizedBox(height: 16),
                CustomTextField(
                    controller: _password,
                    hintText: 'Enter Password',
                    labelText: 'Password'),
                const SizedBox(height: 16),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: LegalReferralColors.textgrey300),
                    )),
                const SizedBox(height: 24),
                CustomButton(onTap: () {}, text: 'LOG IN'),
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(89, 158, 217, 1),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
