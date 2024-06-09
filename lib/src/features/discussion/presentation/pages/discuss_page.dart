import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/active_tab_page.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/invite_tab_page.dart';

class DiscussPage extends StatelessWidget {
  const DiscussPage({super.key});
  static const String name = 'discussPage';
  @override
  Widget build(BuildContext context) {
    return const CustomTabView(
      tabNames: [
        'Active',
        'Invites',
      ],
      tabViews: [
        ActiveTab(),
        InviteTab(),
      ],
      initialIndex: 0,
    );
  }
}
