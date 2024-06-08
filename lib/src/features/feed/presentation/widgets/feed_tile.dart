import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({
    required this.feed,
    super.key,
    this.onLikePressed,
    this.onCommentPressed,
    this.onDiscussPressed,
    this.onSharePressed,
  });

  final Feed? feed;
  final VoidCallback? onLikePressed;
  final VoidCallback? onCommentPressed;
  final VoidCallback? onDiscussPressed;
  final VoidCallback? onSharePressed;

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
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: LegalReferralColors.borderGrey300,
                    ),
                  ),
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
                SvgPicture.asset(IconStringConstants.threeDots),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ExpandableText(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            text: post?.title ?? '',
          ),
          ImagePost(
            postContent: post?.title ?? '',
            imageUrls: post?.filesUrls ?? [],
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
                      '21 Likes',
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
                      'Comments',
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
                onTap: () {},
              ),
              VerticalIconButton(
                icon: IconStringConstants.comment,
                text: 'Comment',
                textColor: LegalReferralColors.textGrey117,
                onTap: () {
                  // // implement a callback for comments
                  // if (ModalRoute.of(context)?.settings.name !=
                  //     PostCommentPage.routeName) {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => PostCommentPage(
                  //         attorneyName: attorneyName,
                  //         attorneyType: attorneyType,
                  //         postedTime: postedTime,
                  //         child: child,
                  //       ),
                  //       settings: const RouteSettings(
                  //           name: PostCommentPage.routeName,),
                  //     ),
                  //   );
                  // }
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => PostCommentPage(
                  //       attorneyName: attorneyName,
                  //       attorneyType: attorneyType,
                  //       postedTime: postedTime,
                  //       child: child,
                  //     ),
                  //   ),
                  // );
                },
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
