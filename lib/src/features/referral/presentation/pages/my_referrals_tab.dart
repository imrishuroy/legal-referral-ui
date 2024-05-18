import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/active_projects.dart';

class MyReferralsTab extends StatelessWidget {
  const MyReferralsTab({super.key});
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: Text(
              'Active Projects',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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

          const ActiveReferrals(),

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

          // ListView.separated(
          //   shrinkWrap: true,
          //   itemCount: 2,
          //   physics: neverScroll,
          //   itemBuilder: (context, index) => const ReferralCard(
          //     caseName: 'Akron, Ohio car accident',
          //     practiceArea: 'Akron, OH',
          //     attorneyType: 'Divorse Attorney',
          //     date: '24 Feb 2024',
          //   ),
          //   separatorBuilder: (context, index) => Divider(
          //     height: 1.h,
          //   ),
          // ),
        ],
      ),
    );
  }
}
