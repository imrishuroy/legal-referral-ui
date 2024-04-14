import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/social_constants.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';

class SocialMediaDetails extends StatelessWidget {
  const SocialMediaDetails({
    required TextEditingController link,
    super.key,
  }) : _link = link;

  final TextEditingController _link;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(vertical: 16.h),
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          CustomDropDown(
            items: SocialMediaConstants.socialMediaList,
            onChange: (practiceArea) {},
            hintText: 'Select social media',
            labelText: 'Social Media',
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _link,
            hintText: 'https://www.linkedin.com',
            labelText: 'Link',
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
