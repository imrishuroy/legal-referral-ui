import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/add_social_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/education_details.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  // final _school = TextEditingController();

  // final _law = TextEditingController();

  // final _startDate = TextEditingController();

  // final _endDate = TextEditingController();

  // final _grade = TextEditingController();

  // final _achievements = TextEditingController();

  // final _degree = TextEditingController();

  // final bool isCurrentlyWorkingHere = false;

  List<SchoolDetails> schoolDetailsList = [
    SchoolDetails(
      school: TextEditingController(),
      degree: TextEditingController(),
      law: TextEditingController(),
      startDate: TextEditingController(),
      endDate: TextEditingController(),
      grade: TextEditingController(),
      achievements: TextEditingController(),
      isCurrentlyWorkingHere: false,
    ),
  ];

  void addToSchoolDetailsList() {
    setState(() {
      schoolDetailsList.add(
        SchoolDetails(
          school: TextEditingController(),
          degree: TextEditingController(),
          law: TextEditingController(),
          startDate: TextEditingController(),
          endDate: TextEditingController(),
          grade: TextEditingController(),
          achievements: TextEditingController(),
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
          'Education Details',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (final SchoolDetails schoolDetails in schoolDetailsList)
                schoolDetails,
              HorizontalIconButon(
                height: 24.h,
                width: 24.w,
                text: 'Add Experience',
                icon: ImageStringsUtil.addIcon,
                iconColor: LegalReferralColors.buttonPrimary,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlue100),
                onTap: addToSchoolDetailsList,
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddSocialPage(),
                    ),
                  );
                },
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
