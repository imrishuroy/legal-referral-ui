// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
// import 'package:legal_referral_ui/src/core/constants/colors.dart';
// import 'package:legal_referral_ui/src/features/profile/presentation/pages/review_page.dart';
// import 'package:legal_referral_ui/src/features/profile/presentation/widgets/review_widget.dart';

// class ReviewsSection extends StatelessWidget {
//   const ReviewsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: LegalReferralColors.backgroundWhite255,
//       margin: EdgeInsets.symmetric(vertical: 2.h),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Review',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//                 CustomTextButton(
//                   text: 'See All',
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const ReviewPage(),
//                       ),
//                     );
//                   },
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 200.h,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//               itemCount: 2,
//               itemBuilder: (context, index) => SizedBox(
//                 width: 318.w,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 2.w),
//                   child: const ReviewWidget(),
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: DotsIndicator(
//               dotsCount: 2,
//               decorator: DotsDecorator(
//                 activeSize: const Size(7, 7),
//                 activeShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.r),
//                 ),
//                 activeColor: LegalReferralColors.containerBlue100,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/review_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/review_widget.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const reviewCount = 5;

    return Container(
      color: LegalReferralColors.backgroundWhite255,
      margin: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Review',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                CustomTextButton(
                  text: 'See All',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ReviewPage(),
                      ),
                    );
                  },
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200.h,
            child: CarouselSlider.builder(
              itemCount: reviewCount,
              itemBuilder: (context, index, realIndex) => const ReviewWidget(),
              options: CarouselOptions(
                // height: 200.h,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Center(
            child: DotsIndicator(
              dotsCount: reviewCount,
              position: _currentIndex.toDouble(),
              decorator: DotsDecorator(
                size: const Size(5, 5),
                spacing: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8),
                activeSize: const Size(7, 7),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                activeColor: LegalReferralColors.containerBlue100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
