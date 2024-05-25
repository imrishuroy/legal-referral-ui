import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class MyReferralsTab extends StatelessWidget {
  const MyReferralsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          const ActiveProjects(
            isReferrer: true,
          ),
          SizedBox(
            height: 24.h,
          ),
          const ActiveReferrals(),
          SizedBox(
            height: 24.h,
          ),
          const CompletedProjects(
            isReferrer: true,
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
