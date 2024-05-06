import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/active_projects.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class MyReferralTab extends StatelessWidget {
  const MyReferralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
        ),

        /// Active Projects
        Text(
          'Active Projects',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
//!   later this will be wrapped in Listview
        const ActiveProjectCard(
          caseName: 'Rendville, Ohio land case',
          attorneyType: 'Corporate attorney',
          attorneyName: 'Barry E Janay',
          caseStatus: 'Completed',
          action: 'Acknowledge',
          profileImage: null,
        ),
        SizedBox(
          height: 24.h,
        ),

        /// Active Referrals
        Text(
          'Active Referrals',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
//!   later this will be wrapped in Listview
//!   ek cheej aur add krna hai
        const Column(
          children: [
            CaseDetails(
              caseName: 'Akron, Ohio car accident',
              practiceArea: 'Akron, OH',
              attorneyType: 'Divorse Attorney',
              date: '24 Feb 2024',
            ),
            Divider(
              height: 1,
            ),
          ],
        ),

        ///Completed Proposals
        SizedBox(
          height: 24.h,
        ),
        Text(
          'Completed Proposals',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
//!    later this will be wrapped in Listview
        const Column(
          children: [
            CaseDetails(
              caseName: 'Akron, Ohio car accident',
              practiceArea: 'Akron, OH',
              attorneyType: 'Divorse Attorney',
              date: '24 Feb 2024',
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ],
    );
  }
}
