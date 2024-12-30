import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';

class ActivityCommentTile extends StatelessWidget {
  const ActivityCommentTile({
    required this.comment,
    super.key,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final name = '${comment.authorFirstName} ${comment.authorLastName}';
    return GestureDetector(
      onTap: () => context.pushNamed(
        PostDetailsPage.name,
        pathParameters: {
          'postId': '${comment.postId}',
        },
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(4),
        dense: true,
        title: Row(
          children: [
            CustomAvatar(
              imageUrl: comment.authorAvatarUrl,
              radius: 16.r,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: LegalReferralColors.textGrey117,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    TextSpan(
                      text: ' commented on a post',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: LegalReferralColors.textGrey117,
                          ),
                    ),
                    TextSpan(
                      text: ' • ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: LegalReferralColors.textGrey117,
                          ),
                    ),
                    TextSpan(
                      text: DateTimeUtil.timeAgo(comment.createdAt),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: LegalReferralColors.textGrey117,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            comment.content,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
