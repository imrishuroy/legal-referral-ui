import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/accept_project_message.dart';

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
          const AcceptProjectDialog(),
          SizedBox(
            height: 16.h,
          ),
          const ActiveProposals(),
          SizedBox(
            height: 16.h,
          ),
          const CompletedProposals(),
        ],
      ),
    );
  }
}
