// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class ProposalDetailsPage extends StatelessWidget {
  const ProposalDetailsPage({
    required this.caseName,
    required this.startDate,
    required this.caseDescription,
    required this.attorneyName,
    required this.attorneyType,
    required this.profileImage,
    required this.practiceArea,
    required this.date,
    this.style,
    this.radius,
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 4.h,
        shadowColor: Colors.grey[100],
        title: Text(
          caseName ?? '',
          style: textTheme.headlineLarge,
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
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    caseDescription ?? '',
                    style: textTheme.bodyLarge,
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
                        style: textTheme.headlineSmall,
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
                    style: textTheme.bodyLarge,
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
