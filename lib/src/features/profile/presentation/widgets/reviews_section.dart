import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/custom_card.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/review_widget.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {},
      title: 'Review',
      visibility: false,
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) => SizedBox(
            width: 318.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: const ReviewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
