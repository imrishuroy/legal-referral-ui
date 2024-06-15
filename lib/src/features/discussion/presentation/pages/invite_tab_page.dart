import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/dicussion_invite_page.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/trending_invite_page.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/widgets/discussion_invites.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/widgets/trending_invite.dart';

class InviteTab extends StatelessWidget {
  const InviteTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discussion Invites',
                  style: textTheme.headlineLarge,
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DiscussionInvitePage(),
                      ),
                    );
                  },
                  text: 'View all',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const DiscussionInvites();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 12.h,
              );
            },
            itemCount: 1,
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending',
                  style: textTheme.headlineLarge,
                ),
                CustomTextButton(
                  onPressed: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TrendingInvitePage(),
                      ),
                    );
                  },
                  text: 'View all',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const TrendingInvite();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 12.h,
              );
            },
            itemCount: 2,
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
