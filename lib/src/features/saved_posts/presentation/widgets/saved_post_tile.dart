import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';

class SavedPostTile extends StatelessWidget {
  const SavedPostTile({
    required this.savedPost,
    required this.onTap,
    this.onOptionsPressed,
    this.imageHeight = 380,
    super.key,
  });

  final SavedPost savedPost;
  final double imageHeight;
  final VoidCallback onTap;
  final VoidCallback? onOptionsPressed;

  @override
  Widget build(BuildContext context) {
    final user = savedPost.owner;
    final post = savedPost.post;
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
