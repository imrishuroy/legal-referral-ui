import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({
    required this.post,
    required this.onUnSave,
    super.key,
  });

  final Post? post;
  final VoidCallback onUnSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: LegalReferralColors.borderLightGrey300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'POST',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: LegalReferralColors.textGrey400,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: SvgButton(
                    imagePath: IconStringConstants.deleteIcon,
                    onPressed: onUnSave,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 212.h,
            width: 253.w,
            child: _PreviewFeaturePostMedia(post: post),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              post?.content ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewFeaturePostMedia extends StatelessWidget {
  const _PreviewFeaturePostMedia({
    required this.post,
  });

  final Post? post;

  @override
  Widget build(BuildContext context) {
    final filesUrls = post?.filesUrls ?? [];
    final postType = post?.type;
    String? previewUrl;
    if (filesUrls.isNotEmpty) {
      previewUrl = filesUrls.first;
    }

    debugPrint('postType: $postType');

    switch (postType) {
      case PostType.image:
        return CustomNetworkImage(
          imageUrl: previewUrl,
          height: 212.h,
          width: 253.w,
        );
      default:
        return Image.asset(
          'assets/images/placeholder_image.png',
          height: 212.h,
          width: 253.w,
        );
    }
  }
}
