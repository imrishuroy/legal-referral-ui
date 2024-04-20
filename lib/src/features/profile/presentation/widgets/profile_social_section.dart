import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/custom_card.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/social_widget.dart';

class ProfileSocialSection extends StatelessWidget {
  const ProfileSocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        context.pushNamed(AddSocialPage.name);
      },
      title: 'Social',
      child: const SocialWidget(),
    );
  }
}
