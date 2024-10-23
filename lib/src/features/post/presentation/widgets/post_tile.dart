import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    required this.post,
    required this.user,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onDiscussPressed,
    required this.onSharePressed,
    required this.imageHeight,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
    super.key,
    this.onTap,
    this.onOptionsPressed,
  });

  final Post? post;
  final AppUser? user;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onDiscussPressed;
  final VoidCallback onSharePressed;
  final double imageHeight;
  final bool isLiked;
  final int likesCount;
  final int commentsCount;
  final VoidCallback? onTap;
  final VoidCallback? onOptionsPressed;

  @override
  Widget build(BuildContext context) {
    final name = '${user?.firstName} ${user?.lastName}';
    final theme = Theme.of(context).textTheme;
    return ColoredBox(
      color: LegalReferralColors.containerWhite500,
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
                GestureDetector(
                  onTap: () {
                    final userId = user?.userId;
                    if (userId != null) {
                      context.pushNamed(
                        ProfilePage.name,
                        pathParameters: {'userId': userId},
                      );
                    }
                  },
                  child: CustomAvatar(
                    imageUrl: user?.avatarUrl,
                    radius: 28.r,
                  ),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.bodyLarge?.copyWith(
                                color: LegalReferralColors.textGrey117,
                              ),
                              children: [
                                TextSpan(text: '${user?.practiceArea ?? ''} '),
                                const TextSpan(text: ' • 1st'),
                              ],
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.8.h,
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
                // Post details options

                SvgButton(
                  height: 24.w,
                  width: 24.h,
                  imagePath: IconStringConstants.threeDots,
                  onPressed: () => onOptionsPressed?.call(),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post?.content != null && post!.content!.isNotEmpty)
                  ExpandableText(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    text: post?.content ?? '',
                  ),
                if (post?.type == PostType.link && post?.content != null)
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
                    postType: post?.type ?? PostType.image,
                    mediaUrls: post?.filesUrls ?? [],
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
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              VerticalIconButton(
                icon: IconStringConstants.thumbUp,
                text: 'Like',
                textColor: LegalReferralColors.textGrey117,
                onTap: onLikePressed,
                iconColor: isLiked ? LegalReferralColors.textBlue100 : null,
              ),
              VerticalIconButton(
                icon: IconStringConstants.comment,
                text: 'Comment',
                textColor: LegalReferralColors.textGrey117,
                onTap: onCommentPressed,
              ),
              VerticalIconButton(
                icon: IconStringConstants.discuss,
                text: 'Discuss',
                textColor: LegalReferralColors.textGrey117,
                onTap: onDiscussPressed,
              ),
              VerticalIconButton(
                icon: IconStringConstants.share,
                text: 'Share',
                textColor: LegalReferralColors.textGrey117,
                onTap: onSharePressed,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
