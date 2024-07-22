import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

class AdTile extends StatelessWidget {
  const AdTile({
    required this.ad,
    required this.buttonText,
    required this.onTap,
    required this.isPlaying,
    super.key,
  });

  final Ad? ad;
  final String buttonText;
  final VoidCallback onTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final adImage = ad?.mediaUrls.isNotEmpty ?? false
        ? ad?.mediaUrls.first ?? IconStringConstants.imagePlaceholder
        : IconStringConstants.imagePlaceholder;

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: ad?.type == AdType.image
                  ? CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 60.h,
                      width: 60.w,
                      imageUrl: adImage,
                    )
                  : PreviewVideo(
                      videoUrl: ad?.mediaUrls.isNotEmpty ?? false
                          ? ad?.mediaUrls.first
                          : null,
                      height: 60.h,
                      width: 60.w,
                    ),
              title: Text(
                ad?.title ?? '',
                style: textTheme.headlineSmall,
              ),
              subtitle: Text(
                ad?.description ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textTheme.bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlack300),
              ),
            ),
            const Gap(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Started on: ',
                        style: textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey500,
                        ),
                      ),
                      TextSpan(
                        text: DateTimeUtil.formatProjectTime(ad?.startDate),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: isPlaying ? 'Expires on: ' : 'Expired on: ',
                        style: textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey500,
                        ),
                      ),
                      TextSpan(
                        text: DateTimeUtil.formatProjectTime(ad?.endDate),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(height: 16),
            CustomElevatedButton(
              text: buttonText,
              height: 44.h,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
