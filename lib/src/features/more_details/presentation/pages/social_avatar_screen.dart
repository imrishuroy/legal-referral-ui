import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/more_details/presentation/pages/upload_license_screen.dart';
import 'package:legal_referral_ui/src/features/more_details/presentation/widgets/customtextfield.dart';

class SocialAvatarScreen extends StatelessWidget {
  SocialAvatarScreen({super.key});
  final _userName = TextEditingController();
  final _createPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LegalReferralColors.primaryBackground,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: LegalReferralColors.primaryBackground,
          title: const Text(
            'Social Avatar',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // ---- Profile picture
                CircleAvatar(
                  radius: 86,
                  backgroundColor: LegalReferralColors.containerWhite500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 81,
                        width: 81,
                        child: SvgPicture.asset(LegalReferralImg.personIcon),
                      ),
                      const Text(
                        'ADD PROFILE\nPICTURE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: LegalReferralColors.textBlue100,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //------ User Name
                CustomTextField(
                  controller: _userName,
                  hintText: 'John Dev',
                  labelText: 'User Name',
                ),
                const SizedBox(
                  height: 16,
                ),
                //------ Create Password
                CustomTextField(
                  controller: _createPassword,
                  hintText: 'David',
                  labelText: 'Create Password',
                ),
                const SizedBox(
                  height: 16,
                ),
                //------ Confirm password
                CustomTextField(
                  controller: _confirmPassword,
                  hintText: '+1 347 877 7879',
                  labelText: 'Confirm Password',
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UploadLicenseScreen(),
                      ),
                    );
                  },
                  text: 'Save and Proceed',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
