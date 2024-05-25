import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class ProposalTab extends StatefulWidget {
  const ProposalTab({super.key});

  @override
  State<ProposalTab> createState() => _ProposalTabState();
}

class _ProposalTabState extends State<ProposalTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AwardedProjects(),
          SizedBox(
            height: 16.h,
          ),
          const ActiveProjects(
            isReferrer: false,
          ),
          SizedBox(
            height: 16.h,
          ),
          const ActiveProposals(),
          SizedBox(
            height: 16.h,
          ),
          const CompletedProjects(
            isReferrer: false,
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
