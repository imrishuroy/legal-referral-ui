import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

class FeedAdTile extends StatelessWidget {
  const FeedAdTile({
    super.key,
    this.ad,
  });

  final Ad? ad;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              ad?.title ?? '',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ExpandableText(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            text: ad?.description ?? '',
          ),
          MediaPost(
            imageHeight: 400,
            postType:
                ad?.type == AdType.image ? PostType.image : PostType.video,
            mediaUrls: ad?.mediaUrls ?? [],
            fileName: 'File Name',
          ),
          Center(
            child: CustomOutlinedButton(
              height: 38.h,
              width: 122.w,
              text: 'Learn More',
              onPressed: () {},
              textColor: LegalReferralColors.borderBlue100,
              borderColor: LegalReferralColors.borderBlue100,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
