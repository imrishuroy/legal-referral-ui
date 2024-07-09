import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/active_discussions.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/discussions_invites.dart';

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
        ActiveDiscussions(),
        DiscussionInvites(),
      ],
      initialIndex: 0,
    );
  }
}
