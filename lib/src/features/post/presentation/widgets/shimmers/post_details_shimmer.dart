import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class PostDetailsShimmer extends StatelessWidget {
  const PostDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomShimmer(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostTileShimmer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostTileShimmer extends StatelessWidget {
  const PostTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: Row(
              children: [
                const CustomAvatarShimmer(),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150.w,
                        height: 12.h,
                        color: LegalReferralColors.backgroundWhite255,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 12.h,
                        color: LegalReferralColors.backgroundWhite255,
                      ),
                      SizedBox(
                        height: 2.8.h,
                      ),
                      Container(
                        width: 50.w,
                        height: 12.h,
                        color: LegalReferralColors.backgroundWhite255,
                      ),
                    ],
                  ),
                ),
                SvgButton(
                  height: 24.w,
                  width: 24.h,
                  imagePath: IconStringConstants.threeDots,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.h,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 12.h,
                      color: LegalReferralColors.backgroundWhite255,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: Container(
              width: double.infinity,
              height: 280.h,
              color: LegalReferralColors.backgroundWhite255,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAvatarShimmer extends StatelessWidget {
  const CustomAvatarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28.r,
      backgroundColor: LegalReferralColors.backgroundWhite255,
    );
  }
}

class PostActionShimmer extends StatelessWidget {
  const PostActionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: LegalReferralColors.backgroundWhite255,
      ),
    );
  }
}
