// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class ProposalDetails extends StatelessWidget {
  const ProposalDetails({
    required this.caseName,
    required this.startDate,
    required this.caseDescription,
    required this.attorneyName,
    required this.attorneyType,
    required this.profileImage,
    required this.style,
    required this.radius,
    required this.practiceArea,
    required this.date,
    super.key,
  });
  final String? caseName;
  final String? startDate;
  final String? caseDescription;
  final String? attorneyName;
  final String? attorneyType;
  final String? profileImage;
  final TextStyle? style;
  final double? radius;

  final String? practiceArea;

  final String? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          caseName ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              color: LegalReferralColors.containerWhite500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AttorneyDetails(
                          attorneyName: attorneyName,
                          attorneyType: '$attorneyType • 1st',
                          profileImage: profileImage,
                          style: null,
                          radius: null,
                        ),
                      ),
                      Expanded(
                        child: CustomOutlinedButton(
                          width: 96.w,
                          height: 36.h,
                          textColor: LegalReferralColors.textBlue100,
                          borderColor: LegalReferralColors.borderBlue300,
                          onPressed: () {},
                          text: 'Message',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CaseDetails(
                    padding: EdgeInsets.zero,
                    caseName: null,
                    attorneyType: attorneyType,
                    practiceArea: practiceArea,
                    date: date,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Wrap(
                    children: [
                      Text(
                        caseDescription ?? '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              color: LegalReferralColors.containerWhite500,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'My Proposal',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(),
                      CustomTextButton(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        text: 'Edit',
                        onPressed: () {},
                        textColor: LegalReferralColors.textBlue100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Hi Barry\n\nI am Hue, a '
                    'lawyer with 12 years of experience and '
                    r'I can do this job for $1500. Let’s discuss.'
                    ' You may reach me on +1 876 888 2222. Best.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
