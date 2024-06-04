import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/home/presentation/widgets/widgets.dart';

class NormalPost extends StatelessWidget {
  const NormalPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ExpandableText(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          text: lorem50,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
