import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';

class FeedPostCommentsList extends StatefulWidget {
  const FeedPostCommentsList({
    required this.feedBloc,
    required this.postId,
    required this.onReplyPressed,
    super.key,
  });

  final FeedBloc feedBloc;
  final int postId;
  final void Function(int commentId) onReplyPressed;

  @override
  State<FeedPostCommentsList> createState() => _FeedPostCommentsListState();
}

class _FeedPostCommentsListState extends State<FeedPostCommentsList> {
  @override
  void initState() {
    widget.feedBloc.add(
      FeedPostCommentsFetched(postId: widget.postId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: widget.feedBloc,
      builder: (context, state) {
        final groupedComments = groupBy<Comment?, int?>(
          state.comments,
          (comment) => comment?.parentCommentId ?? comment?.commentId,
        );

        final keysList = groupedComments.keys.toList(growable: false);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.comments.isNotEmpty)
              Text(
                'COMMENTS',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: LegalReferralColors.textGrey400,
                    ),
              ),
            SizedBox(height: 8.h),
            if (state.status == FeedStatus.loading)
              const CommentsShimmer()
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: keysList.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final key = keysList[index];
                  final comments = groupedComments[key]!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, subIndex) {
                      final comment = comments[subIndex];
                      final padding = comment?.parentCommentId != null
                          ? const EdgeInsets.only(left: 40, right: 8)
                          : const EdgeInsets.symmetric(horizontal: 8);
                      return Padding(
                        padding: padding,
                        child: CommentTile(
                          comment: comment,
                          onLikePressed: () => _onLikePressed(comment),
                          onReplyPressed: () {
                            final commentId =
                                comment?.parentCommentId ?? comment?.commentId;
                            if (commentId != null) {
                              widget.onReplyPressed(commentId);
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),
          ],
        );
      },
    );
  }

  void _onLikePressed(
    Comment? comment,
  ) {
    final commentId = comment?.commentId;
    if (commentId != null) {
      if (comment?.isLiked == true) {
        widget.feedBloc.add(
          FeedPostCommentUnliked(
            commentId: commentId,
          ),
        );
      } else {
        widget.feedBloc.add(
          FeedPostCommentLiked(
            commentId: commentId,
          ),
        );
      }
    }
  }
}
