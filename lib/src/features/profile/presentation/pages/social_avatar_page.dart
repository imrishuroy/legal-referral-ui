import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/upload_license_page.dart';

class SocialAvatarPage extends StatelessWidget {
  SocialAvatarPage({super.key});
  final _userName = TextEditingController();
  final _createPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Social Avatar',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // ---- Profile picture
                CircleAvatar(
                  radius: 86.r,
                  backgroundColor: LegalReferralColors.containerWhite500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 81.h,
                        width: 81.w,
                        child: SvgPicture.asset(
                          ImageStringsUtil.personIcon,
                        ),
                      ),
                      Text(
                        'ADD PROFILE\nPICTURE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: LegalReferralColors.textBlue100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                //------ User Name
                CustomTextField(
                  controller: _userName,
                  hintText: 'John Dev',
                  labelText: 'User Name',
                ),
                SizedBox(
                  height: 16.h,
                ),
                //------ Create Password
                CustomTextField(
                  controller: _createPassword,
                  hintText: 'David',
                  labelText: 'Create Password',
                ),
                SizedBox(
                  height: 16.h,
                ),
                //------ Confirm password
                CustomTextField(
                  controller: _confirmPassword,
                  hintText: '+1 347 877 7879',
                  labelText: 'Confirm Password',
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomElevatedButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UploadLicensePage(),
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
