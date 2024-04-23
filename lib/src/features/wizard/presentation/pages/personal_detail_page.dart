import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class PersonalDetailsPage extends StatelessWidget {
  PersonalDetailsPage({super.key});
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _address = TextEditingController();
  final _practiceArea = TextEditingController();
  final _practiceLocation = TextEditingController();
  final _experience = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Share About You',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Text(
                  'Personal',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.h,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _firstName,
                  hintText: 'John',
                  labelText: 'First Name',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _lastName,
                  hintText: 'David',
                  labelText: 'Last Name',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _address,
                  hintText: 'St. Thomas Street, Anchorage, Alaska, USA',
                  labelText: 'Address',
                ),
                SizedBox(height: 24.h),
                Text(
                  'Share About Your Experience',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.h,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _practiceArea,
                  hintText: 'Real estate, Finance etc',
                  labelText: 'Practice Area',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _practiceLocation,
                  hintText: 'Alaska, Florida',
                  labelText: 'Practice Location',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _experience,
                  hintText: '4 years',
                  labelText: 'Experience',
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  onTap: () {},
                  text: 'Save and Proceed',
                ),
                SizedBox(height: 58.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
