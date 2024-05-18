import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/case_details.dart';

class CompletedProposals extends StatelessWidget {
  const CompletedProposals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Completed Proposals',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const CaseDetails(
            caseName: 'Hit and Run Case,Auburn',
            practiceArea: 'Auburn,AK',
            attorneyType: 'Criminal Attorney',
            date: '24 Feb 2024',
          ),
          separatorBuilder: (context, index) => Divider(
            height: 1.h,
          ),
        ),
      ],
    );
  }
}
