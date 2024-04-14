import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/skills_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';

class SchoolDetails extends StatelessWidget {
  const SchoolDetails({
    required TextEditingController school,
    required TextEditingController degree,
    required TextEditingController law,
    required TextEditingController startDate,
    required this.isCurrentlyWorkingHere,
    required TextEditingController endDate,
    required TextEditingController grade,
    required TextEditingController achievements,
    super.key,
  })  : _school = school,
        _degree = degree,
        _law = law,
        _startDate = startDate,
        _endDate = endDate,
        _grade = grade,
        _achievements = achievements;

  final TextEditingController _school;
  final TextEditingController _degree;
  final TextEditingController _law;
  final TextEditingController _startDate;
  final bool isCurrentlyWorkingHere;
  final TextEditingController _endDate;
  final TextEditingController _grade;
  final TextEditingController _achievements;

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
          CustomTextField(
            controller: _school,
            hintText: 'Boston University',
            labelText: 'School',
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _degree,
            hintText: "Bachelor's",
            labelText: 'Degree',
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _law,
            hintText: 'Field of study',
            labelText: 'Law',
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: LegalReferralColors.buttonPrimary,
                      ),
                      dialogBackgroundColor:
                          LegalReferralColors.primaryBackground,
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                _startDate.text = DateTimeUtil.getFormattedDate(
                  pickedDate,
                );
              }
            },
            child: CustomTextField(
              controller: _startDate,
              hintText: 'dd/mm/yyyy',
              labelText: 'Start date',
              enabled: false,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isCurrentlyWorkingHere,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  side: const BorderSide(),
                ),
                checkColor: LegalReferralColors.textBlue100,
                activeColor: Colors.transparent,
                onChanged: (value) {},
              ),
              Text(
                'Currently pursuing',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: LegalReferralColors.buttonPrimary,
                      ),
                      dialogBackgroundColor:
                          LegalReferralColors.primaryBackground,
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                _endDate.text = DateTimeUtil.getFormattedDate(
                  pickedDate,
                );
              }
            },
            child: CustomTextField(
              controller: _endDate,
              hintText: 'dd/mm/yyyy',
              labelText: 'End date',
              enabled: false,
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _grade,
            hintText: 'First class',
            labelText: 'Grade',
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _achievements,
            hintText: 'Sports, cultural',
            labelText: 'Achievements',
          ),
          SizedBox(height: 16.h),
          CustomDropDown(
            items: LawyerSkillsConstants.lawyerSkills,
            onChange: (skills) {},
            hintText: 'Skills',
            labelText: 'Skills',
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
