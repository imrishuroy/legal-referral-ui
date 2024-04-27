import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/network/presentation/widgets/recommendation_card.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recommendation',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            mainAxisExtent: 226.h,

            // childAspectRatio: 0.75,
          ),
          itemBuilder: (BuildContext context, int index) {
            return const RecommendationCard();
          },
        ),
      ),
    );
  }
}
