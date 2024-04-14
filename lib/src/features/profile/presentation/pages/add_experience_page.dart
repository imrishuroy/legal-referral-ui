import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/experience_details.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  // final _title = TextEditingController();

  // final _companyName = TextEditingController();

  // final _startDate = TextEditingController();

  // final _endDate = TextEditingController();

  // final _description = TextEditingController();

  // final bool isCurrentlyWorkingHere = false;

  List<ExperienceDetails> experienceDetailsList = [
    ExperienceDetails(
      title: TextEditingController(),
      companyName: TextEditingController(),
      // law: TextEditingController(),
      startDate: TextEditingController(),
      endDate: TextEditingController(),
      description: TextEditingController(),
      // achievements: TextEditingController(),
      isCurrentlyWorkingHere: false,
    ),
  ];

  void addToSchoolDetailsList() {
    setState(() {
      experienceDetailsList.add(
        ExperienceDetails(
          title: TextEditingController(),
          companyName: TextEditingController(),
          // law: TextEditingController(),
          startDate: TextEditingController(),
          endDate: TextEditingController(),
          description: TextEditingController(),
          // achievements: TextEditingController(),
          isCurrentlyWorkingHere: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
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
          child: Column(
            children: [
              for (final ExperienceDetails experienceDetails
                  in experienceDetailsList)
                experienceDetails,
              HorizontalIconButon(
                onTap: addToSchoolDetailsList,
                height: 24.h,
                width: 24.w,
                text: 'Add Experience',
                icon: ImageStringsUtil.addIcon,
                iconColor: LegalReferralColors.buttonPrimary,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlue100),
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                onTap: () {},
                text: 'Save and Proceed',
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
