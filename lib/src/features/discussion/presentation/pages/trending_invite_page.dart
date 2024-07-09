import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/widgets/trending_invite.dart';

class TrendingInvitePage extends StatelessWidget {
  const TrendingInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trendings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemBuilder: (context, index) {
          return const TrendingInvite();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 8.h,
          );
        },
        itemCount: 30,
      ),
    );
  }
}
