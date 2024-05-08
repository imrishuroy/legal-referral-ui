// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/write_review_page.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';

class ProjectDetails extends StatelessWidget {
  final String? caseName;
  final String? startDate;
  final String? caseDescription;
  final String? attorneyName;
  final String? attorneyType;
  final String? profileImage;
  final TextStyle? style;
  final double? radius;
  const ProjectDetails({
    required this.caseName,
    required this.startDate,
    required this.caseDescription,
    required this.attorneyName,
    required this.attorneyType,
    required this.profileImage,
    this.style,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          caseName ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          if (startDate != null)
            Container(
              width: double.infinity,
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              color: LegalReferralColors.containerGreen95,
              child: Text(
                'Started on $startDate',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: LegalReferralColors.textWhite450),
              ),
            )
          else
            SizedBox(
              height: 12.h,
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: LegalReferralColors.containerWhite500,
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  caseDescription ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Divider(
                  height: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AttorneyDetails(
                       
                        
                        attorneyName: attorneyName,
                        attorneyType: attorneyType,
                        profileImage: null,
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
                  height: 16.h,
                ),
                CustomElevatedButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WriteReview(),
                      ),
                    );
                  },
                  text: 'Complete & Review',
                ),
                SizedBox(
                  height: 8.h,
                ),
                //! this will be visible to barry
                CustomOutlinedButton(
                  textColor: LegalReferralColors.textGrey400,
                  borderColor: LegalReferralColors.borderGrey300,
                  onPressed: () {},
                  text: 'Yet To be Done',
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
