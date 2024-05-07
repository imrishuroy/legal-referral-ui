import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({super.key});

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  final _experienceController = TextEditingController();
  double _rating = 4.5;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey[100],
        title: Text(
          'Write Review',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
        color: LegalReferralColors.containerWhite500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rate your experience working with',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            const AttorneyDetails(
              attorneyName: 'attorneyName',
              attorneyType: 'attorneyType',
              profileImage: null,
              style: null,
              radius: null,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'How much do you rate out of 5?',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            //star
            Row(
              children: [
                RatingBar.builder(
                  unratedColor: Colors.grey[200],
                  initialRating: _rating,
                  minRating: 1,
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                Text(
                  '$_rating',
                  style: textTheme.headlineLarge,
                ),
              ],
            ),
            CustomTextField(
              controller: _experienceController,
              hintText: 'Brief your experience with the Tim Van Hain',
              labelText: '',
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomElevatedButton(
              text: 'Share Review',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
