import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/proposal_tab.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/referral_detail_page.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/active_projects.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class MyReferralTab extends StatelessWidget {
  const MyReferralTab({super.key});
  @override
  Widget build(BuildContext context) {
    const neverScroll = NeverScrollableScrollPhysics();
    return SingleChildScrollView(
      child: Column(
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

          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            physics: neverScroll,
            itemBuilder: (context, index) => const ActiveProjectCard(
              caseName: 'Rendville, Ohio land case',
              attorneyType: 'Corporate attorney',
              attorneyName: 'Barry E Janay',
              caseStatus: 'Completed',
              action: 'Acknowledge',
              profileImage: null,
              caseDescription: '',
              startDate: null,
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.h,
            ),
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

          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            physics: neverScroll,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReferralDetailPage(
                      caseName: 'Akron, Ohio car accident',
                      caseDescription: lorem50,
                      practiceArea: 'Akron, OH',
                      attorneyType: 'Divorse Attorney',
                      date: '20/02/2023',
                    ),
                  ),
                );
              },
              child: const CaseDetails(
                caseName: 'Akron, Ohio car accident',
                practiceArea: 'Akron, OH',
                attorneyType: 'Divorse Attorney',
                date: '24 Feb 2024',
                proposals: 4,
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              height: 1.h,
            ),
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

          ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            physics: neverScroll,
            itemBuilder: (context, index) => const CaseDetails(
              caseName: 'Akron, Ohio car accident',
              practiceArea: 'Akron, OH',
              attorneyType: 'Divorse Attorney',
              date: '24 Feb 2024',
            ),
            separatorBuilder: (context, index) => Divider(
              height: 1.h,
            ),
          ),
        ],
      ),
    );
  }
}
