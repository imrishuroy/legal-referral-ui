import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({
    required this.feed,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onDiscussPressed,
    required this.onSharePressed,
    required this.isLiked,
    required this.likesCount,
    required this.commentsCount,
    this.imageHeight = 400,
    super.key,
  });

  final Feed? feed;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onDiscussPressed;
  final VoidCallback onSharePressed;
  final double imageHeight;
  final bool isLiked;
  final int likesCount;
  final int commentsCount;

  @override
  Widget build(BuildContext context) {
    final user = feed?.user;
    final post = feed?.post;
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
                        DateTimeUtil.timeAgo(feed?.createdAt),
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
                  onPressed: () => _showOptionSheet(context),
                ),
              ],
            ),
          ),
          if (post?.content != null && post!.content!.isNotEmpty)
            ExpandableText(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              text: post.content ?? '',
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
                onTap: () {},
              ),
              VerticalIconButton(
                icon: IconStringConstants.share,
                text: 'Share',
                textColor: LegalReferralColors.textGrey117,
                onTap: () {},
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

void _showOptionSheet(BuildContext context) {
  CustomBottomSheet.show(
    isDismissible: true,
    borderRadius: true,
    maxWidth: double.infinity,
    context: context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(IconStringConstants.download),
          title: Text(
            'Save',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(IconStringConstants.message),
          title: Text(
            'Message',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(IconStringConstants.addFollow),
          title: Text(
            'Follow',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () async {
            final appinioSocialShare = AppinioSocialShare();

            final result = await FilePicker.platform.pickFiles();

            if (result != null && result.paths.isNotEmpty) {
              await appinioSocialShare.android
                  .shareFilesToSMS(result.paths.nonNulls.toList());
            }
          },
          leading: SvgPicture.asset(
            IconStringConstants.share,
            colorFilter: const ColorFilter.mode(
              LegalReferralColors.borderBlue100,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            'Share via',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(IconStringConstants.restrict),
          title: Text(
            '''I don't want to see this''',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(IconStringConstants.flag),
          title: Text(
            'Report post',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(
            IconStringConstants.editIcon,
            colorFilter: const ColorFilter.mode(
              LegalReferralColors.borderBlue100,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            'Edit',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(IconStringConstants.favorite),
          title: Text(
            'Make feature post',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          leading: SvgPicture.asset(
            IconStringConstants.deleteIcon,
            colorFilter: const ColorFilter.mode(
              LegalReferralColors.borderBlue100,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            'Delete',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: LegalReferralColors.textGrey500),
          ),
        ),
        const Divider(),
      ],
    ),
  );
}
