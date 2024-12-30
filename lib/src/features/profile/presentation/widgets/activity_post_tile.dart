import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';

class ActivityPostTile extends StatelessWidget {
  const ActivityPostTile({
    super.key,
    this.post,
    this.imageHeight = 380,
    this.isFromAllActivities = false,
  });

  final Post? post;
  final double imageHeight;
  final bool isFromAllActivities;

  @override
  Widget build(BuildContext context) {
    final name = '${post?.ownerFirstName} ${post?.ownerLastName}';
    final theme = Theme.of(context).textTheme;
    final media = post?.media ?? [];
    final likesCount = post?.likesCount ?? 0;
    final commentsCount = post?.commentsCount ?? 0;
    return ColoredBox(
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isFromAllActivities ? 16.w : 0,
              vertical: 12.h,
            ),
            child: Row(
              children: [
                CustomAvatar(
                  imageUrl: post?.ownerAvatarUrl,
                  radius: 28.r,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          name,
                          style: theme.titleLarge?.copyWith(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.bodyLarge?.copyWith(
                                color: LegalReferralColors.textGrey117,
                              ),
                              children: [
                                TextSpan(
                                  text: '${post?.ownerPracticeArea ?? ''} ',
                                ),
                                const TextSpan(text: ' • 1st'),
                              ],
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        DateTimeUtil.timeAgo(post?.createdAt),
                        style: theme.bodyMedium?.copyWith(
                          color: LegalReferralColors.textGrey117,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(
              PostDetailsPage.name,
              pathParameters: {
                'postId': '${post?.postId}',
              },
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post?.content != null && post!.content!.isNotEmpty)
                  ExpandableText(
                    padding: EdgeInsets.symmetric(
                      horizontal: isFromAllActivities ? 16.w : 0,
                      vertical: 8.h,
                    ),
                    text: post?.content ?? '',
                  ),
                if (post?.postType == PostType.link && post?.content != null)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    child: LinkPreviewWidget(
                      text: post!.content!,
                    ),
                  )
                else
                  MediaPost(
                    imageHeight: imageHeight,
                    postType: post?.postType ?? PostType.image,
                    mediaUrls: media.isEmpty ? [] : [media.first],
                    fileName: post?.content,
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconStringConstants.thumbUp,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '$likesCount ${likesCount == 1 ? 'Like' : 'Likes'}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconStringConstants.comment,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '$commentsCount '
                      '${commentsCount == 1 ? 'Comment' : 'Comments'}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
