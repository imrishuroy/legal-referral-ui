import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/practice_area_constants.dart';
import 'package:legal_referral_ui/src/core/constants/skills_constants.dart';
import 'package:legal_referral_ui/src/core/constants/state_constant.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_dropdown.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';

class ExperienceDetails extends StatelessWidget {
  const ExperienceDetails({
    required TextEditingController title,
    required TextEditingController companyName,
    required TextEditingController startDate,
    required this.isCurrentlyWorkingHere,
    required TextEditingController endDate,
    required TextEditingController description,
    super.key,
  })  : _title = title,
        _companyName = companyName,
        _startDate = startDate,
        _endDate = endDate,
        _description = description;

  final TextEditingController _title;
  final TextEditingController _companyName;
  final TextEditingController _startDate;
  final bool isCurrentlyWorkingHere;
  final TextEditingController _endDate;
  final TextEditingController _description;

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
            controller: _title,
            hintText: 'Senior attorney',
            labelText: 'Title',
          ),
          SizedBox(height: 16.h),
          CustomDropDown(
            items: PracticeAreaConstants.allPracticeAreas,
            onChange: (practiceArea) {},
            hintText: 'Practice area',
            labelText: 'Practice area',
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _companyName,
            hintText: 'Simon LAW firm',
            labelText: 'Company name',
          ),
          SizedBox(height: 16.h),
          CustomDropDown(
            items: StateConstants.statesList,
            onChange: (practiceLocation) {},
            hintText: 'Practice location',
            labelText: 'Practice location',
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
                'Currently work here',
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
          CustomDropDown(
            items: LawyerSkillsConstants.lawyerSkills,
            onChange: (skills) {},
            hintText: 'Skills',
            labelText: 'Skills',
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _description,
            hintText: 'Job summary',
            maxLines: 3,
            labelText: 'Description',
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
