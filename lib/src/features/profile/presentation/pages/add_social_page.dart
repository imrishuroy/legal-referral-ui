import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/add_pricing_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/socialmedia_details.dart';

class AddSocialPage extends StatefulWidget {
  const AddSocialPage({super.key});

  @override
  State<AddSocialPage> createState() => _AddSocialPageState();
}

class _AddSocialPageState extends State<AddSocialPage> {
  // final _link = TextEditingController();

  List<SocialMediaDetails> socialDetailsList = [
    SocialMediaDetails(
      link: TextEditingController(),
    ),
  ];

  void addToSchoolDetailsList() {
    setState(() {
      socialDetailsList.add(
        SocialMediaDetails(
          link: TextEditingController(),
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
          'Social',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (final SocialMediaDetails socialDetails in socialDetailsList)
                socialDetails,
              HorizontalIconButon(
                onTap: addToSchoolDetailsList,
                height: 24.h,
                width: 24.w,
                text: 'Add Social',
                icon: ImageStringsUtil.addIcon,
                iconColor: LegalReferralColors.buttonPrimary,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlue100),
              ),
              SizedBox(height: 28.h),
              CustomElevatedButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddPricePage(),
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
