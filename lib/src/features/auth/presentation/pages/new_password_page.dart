import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({super.key});
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
        centerTitle: false,
        title: const Text(
          'New Password',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomTextField(
                  controller: _password,
                  hintText: 'Enter new password',
                  labelText: 'New password',
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _confirmpassword,
                  hintText: 'Confirm password',
                  labelText: 'Confirm password',
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedButton(
                  onTap: () => successBottomSheet(context),
                  text: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> successBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: LegalReferralColors.containerWhite500,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              SizedBox(
                height: 114,
                width: 114,
                child: SvgPicture.asset(
                  ImageStringsUtil.successLogo,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'New Password Saved',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
                text: 'Log In',
              ),
            ],
          ),
        );
      },
    );
  }
}
