import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';

class ExperiencePage extends StatelessWidget {
  ExperiencePage({super.key});
  final _title = TextEditingController();
  final _companyName = TextEditingController();
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  final _description = TextEditingController();
  final bool isCurrentlyWorkingHere = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Experience Details',
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
                CustomTextField(
                  controller: _title,
                  hintText: 'Senior attorney',
                  labelText: 'title',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _companyName,
                  hintText: 'Simon LAW firm',
                  labelText: 'Company name',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _startDate,
                  hintText: 'dd/mm/yyyy',
                  labelText: 'Start date',
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Checkbox(
                      value: isCurrentlyWorkingHere,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      onChanged: (value) {},
                    ),
                    const Text('Currently work here'),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _endDate,
                  hintText: 'dd/mm/yyyy',
                  labelText: 'End date',
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _description,
                  hintText: 'Job summary',
                  maxLines: 3,
                  labelText: 'Description',
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ));
                  },
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
