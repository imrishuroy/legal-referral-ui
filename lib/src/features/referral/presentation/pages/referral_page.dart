import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_tabbar.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/my_referral_tab.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/proposal_tab.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({super.key});

  static const String name = 'ReferralPage';

  @override
  Widget build(BuildContext context) {
    return const CustomTabView(
      tabNames: ['Proposals', 'My Referrals'],
      tabViews: [
        ProposalTab(),
        MyReferralTab(),
      ],
    );
  }
}
