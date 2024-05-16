// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/proposal_detail_page.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class ActiveproposalCard extends StatelessWidget {
  final String? attorneyName;
  final String? attorneyType;
  final String? caseName;
  final String? practiceArea;
  final String? profileImage;
  final String? date;
  final String? startDate;
  final String? caseDescription;

  const ActiveproposalCard({
    required this.attorneyName,
    required this.attorneyType,
    required this.caseName,
    required this.practiceArea,
    required this.profileImage,
    required this.date,
    required this.startDate,
    required this.caseDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LegalReferralColors.backgroundWhite255,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProposalDetailsPage(
                caseName: caseName,
                startDate: startDate,
                caseDescription: caseDescription,
                attorneyName: attorneyName,
                attorneyType: attorneyType,
                profileImage: profileImage,
                practiceArea: practiceArea,
                date: date,
              ),
            ),
          );
        },
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AttorneyDetails(
                attorneyName: attorneyName,
                attorneyType: attorneyType,
                profileImage: profileImage,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CaseDetails(
              caseName: caseName,
              practiceArea: practiceArea,
              attorneyType: attorneyType,
              date: date,
            ),
          ],
        ),
      ),
    );
  }
}
