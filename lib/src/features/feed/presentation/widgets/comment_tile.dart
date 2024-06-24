import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    required this.comment,
    required this.onLikePressed,
    required this.onReplyPressed,
    super.key,
  });

  final Comment? comment;
  final VoidCallback onLikePressed;
  final VoidCallback onReplyPressed;

  @override
  Widget build(BuildContext context) {
    final name =
        '${comment?.authorFirstName ?? ''} ${comment?.authorLastName ?? ''}';
    final likesCount = comment?.likesCount ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              final userId = comment?.authorUserId;
              if (userId != null) {
                context.pushNamed(
                  ProfilePage.name,
                  pathParameters: {
                    'userId': userId,
                  },
                );
              }
            },
            child: CustomAvatar(
              imageUrl: comment?.authorAvatarUrl,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: LegalReferralColors.containerWhite400,
                  ),
                  padding: const EdgeInsets.all(8),
                  width: 295.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name • 1st',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        comment?.authorPracticeArea ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: LegalReferralColors.textGrey400,
                            ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        comment?.content ?? '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    HorizontalIconButton(
                      text: 'Like ${likesCount != 0 ? '•$likesCount' : ''}',
                      style: Theme.of(context).textTheme.titleSmall,
                      height: 16.h,
                      width: 16.w,
                      icon: IconStringConstants.thumbUp,
                      iconColor: comment?.isLiked ?? false ? Colors.blue : null,
                      onTap: onLikePressed,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    HorizontalIconButton(
                      text: 'Reply',
                      style: Theme.of(context).textTheme.titleSmall,
                      height: 16.h,
                      width: 16.w,
                      icon: IconStringConstants.reply,
                      onTap: onReplyPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
