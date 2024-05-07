// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/active_referral_card.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class ReferralDetails extends StatelessWidget {
  final String? caseName;
  // final String? caseDetails;
  final String? caseDescription;
  final String? practiceArea;
  final String? attorneyType;
  final String? date;
  const ReferralDetails({
    required this.caseName,
    // required this.caseDetails,
    required this.caseDescription,
    required this.practiceArea,
    required this.attorneyType,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 4.h,
        shadowColor: Colors.grey[100],
        title: Text(caseName ?? '', style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:8.h ,),
            Container(
              color: LegalReferralColors.backgroundWhite255,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  CaseDetails(
                    padding: EdgeInsets.zero,
                    caseName: null,
                    practiceArea: practiceArea,
                    attorneyType: attorneyType,
                    date: date,
                  ),
                  const Divider(
                    height: 1,
                  ),
                    SizedBox(height:12.h ,),
                  Text(
                    caseDescription ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
              SizedBox(height:24.h ,),
            Text(
              'Active Referrals',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
              SizedBox(height:12.h ,),
       
            ActiveReferral(
              attorneyName: 'Divorce Attorney',
              attorneyType: attorneyType,
              profileImage: null,
              style: null,
              radius: 28.r,
            ),
          ],
        ),
      ),
    );
  }
}
