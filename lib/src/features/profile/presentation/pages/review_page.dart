import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/review_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Review',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemBuilder: (BuildContext context, int index) {
          return const ReviewWidget();
        },
        itemCount: 5,
      ),
    );
  }
}
