import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/active_projects.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/active_proposals.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class ProposalTab extends StatelessWidget {
  const ProposalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///    Active Projects
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Active Projects',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
        const ActiveProjectCard(
          caseName: 'Rendville, Ohio land case',
          caseStatus: 'New',
          attorneyName: 'Samuel De Armas',
          attorneyType: 'Divorce attorney',
          action: 'Start Project',
          profileImage: null,
          caseDescription: lorem50,
          startDate: '12 Mar, 2024',
        ),
        SizedBox(
          height: 24.h,
        ),

        ///    Active proposal
        Text(
          'Active proposal',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        SizedBox(
          height: 12.h,
        ),
//!later this will be wrapped in Listview
        const Column(
          children: [
            ActiveproposalCard(
              attorneyName: 'Jery Danel',
              attorneyType: 'Divorse Attorney',
              caseName: 'Akron, Ohio car accident',
              practiceArea: 'Akron, OH',
              date: '24 Feb 2024',
              profileImage: null,
              startDate: '20/02/2024',
              caseDescription: lorem50,
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),

        ///    Completed Proposal

        Text(
          'Completed Proposals',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 12.h,
        ),
//!later this will be wrapped in Listview
        const Column(
          children: [
            CaseDetails(
              caseName: 'Hit and Run Case,Auburn',
              practiceArea: 'Auburn,AK',
              attorneyType: 'Criminal Attorney',
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

const String lorem50 = 'Lorem ipsum dolor sit amet,'
    ' consectetur adipiscing elit. Fusce sit'
    ' amet ultrices nisi. Nullam ultricies enim '
    'consequat nunc ac tortor consectetur, vitae suscipit ex '
    'Integer ut ex nec dolor ullamcorper pharetra. Sed vel purus '
    ' auctor dictum. Nulla facilisi. Aliquam vitae purus nec sapien'
    ' faucibus cursus vel ut ex. Nullam malesuada fringilla lacinia. '
    'Maecenas et libero metus. Sed volutpat libero eget vehicula'
    ' commodo. Vivamus accumsan ipsum vel nisi commodo, nec cursus'
    ' ligula malesuada. Vivamus dictum placerat diam, vel dapibus'
    ' nisi pharetra nec. Morbi condimentum pharetra nisi vel'
    ' facilisis. Sed tincidunt eros ut libero fermentum, quis '
    'fringilla libero dapibus. Phasellus bibendum viverra '
    'libero. Sed elementum purus nec efficitur ullamcorper.';
