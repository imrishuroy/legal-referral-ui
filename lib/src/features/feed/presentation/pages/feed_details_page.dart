import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:toastification/toastification.dart';

class FeedDetailsPageArgs {
  FeedDetailsPageArgs({
    required this.feedBloc,
    required this.feed,
    required this.index,
    this.fetchLikesAndCommentsCount = false,
  });

  final FeedBloc feedBloc;
  final Feed? feed;
  final int index;
  final bool fetchLikesAndCommentsCount;
}

class FeedDetailsPage extends StatefulWidget {
  const FeedDetailsPage({
    required this.args,
    super.key,
  });
  static const String name = 'FeedDetailsPage';

  final FeedDetailsPageArgs args;

  @override
  State<FeedDetailsPage> createState() => _FeedDetailsPageState();
}

class _FeedDetailsPageState extends State<FeedDetailsPage> {
  final _authBloc = getIt<AuthBloc>();
  FeedBloc get _feedBloc => widget.args.feedBloc;
  final _commentsController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    final args = widget.args;
    args.feedBloc.add(
      FeedDetailsInitialized(
        feed: widget.args.feed,
      ),
    );

    final postId = args.feed?.feedPost?.postId;
    if (postId != null && args.fetchLikesAndCommentsCount) {
      args.feedBloc.add(
        PostLikesAndCommentsCountFetched(
          postId: postId,
        ),
      );

      args.feedBloc.add(
        PostIsLikedFetched(
          postId: postId,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: LegalReferralColors.containerWhite500,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocConsumer<FeedBloc, FeedState>(
          bloc: widget.args.feedBloc,
          listener: (context, state) {
            if (state.status == FeedStatus.failure) {
              ToastUtil.showToast(
                context,
                title: 'Error',
                description: state.failure?.message ?? 'something went wrong',
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            final feedPost = state.feed?.feedPost;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeedTile(
                          feed: widget.args.feed,
                          isLiked: feedPost?.isLiked ?? false,
                          likesCount: feedPost?.likesCount ?? 0,
                          commentsCount: feedPost?.commentsCount ?? 0,
                          onLikePressed: () => _onLikePressed(
                            widget.args.feed,
                            feedPost?.isLiked ?? false,
                            widget.args.index,
                          ),
                          onOptionsPressed: () => _showPostOptionsSheet(
                            context: context,
                            feed: widget.args.feed,
                            index: widget.args.index,
                          ),
                          onCommentPressed: () {
                            _focusNode.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode);
                          },
                          imageHeight: 250,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state.postLikedUsers.isNotEmpty)
                                Text(
                                  'LIKES',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: LegalReferralColors.textGrey400,
                                      ),
                                ),
                              SizedBox(height: 8.h),
                              if (feedPost?.postId != null)
                                FeedPostLikedUsers(
                                  postId: feedPost!.postId,
                                  feedBloc: widget.args.feedBloc,
                                ),
                              SizedBox(height: 24.h),
                              if (feedPost?.postId != null)
                                FeedPostCommentsList(
                                  feedBloc: widget.args.feedBloc,
                                  postId: feedPost!.postId,
                                  onReplyPressed: (commentId) {
                                    widget.args.feedBloc.add(
                                      FeedPostParentCommentIdChanged(
                                        parentCommentId: commentId,
                                      ),
                                    );

                                    _focusNode.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomTextField(
                  focusNode: _focusNode,
                  hintText: 'Your comments here',
                  height: 88,
                  commentsController: _commentsController,
                  onSend: () => _commentOnPost(
                    feedBloc: widget.args.feedBloc,
                    userId: feedPost?.ownerId,
                    postId: feedPost?.postId,
                    parentCommentId: state.parentCommentId,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showPostOptionsSheet({
    required BuildContext context,
    required Feed? feed,
    required int index,
  }) {
    final userId = _authBloc.state.user?.userId;
    CustomBottomSheet.show(
      isDismissible: true,
      borderRadius: true,
      maxWidth: double.infinity,
      context: context,
      child: FeedPostOptionsContent(
        feedBloc: _feedBloc,
        feed: feed,
        userId: userId,
        index: index,
      ),
    );
  }

  void _onLikePressed(
    Feed? feed,
    bool isLiked,
    int index,
  ) {
    final postId = feed?.feedPost?.postId;
    if (postId != null) {
      if (isLiked == true) {
        widget.args.feedBloc.add(
          FeedPostUnliked(
            postId: postId,
            index: index,
            isFromeDetails: true,
          ),
        );
      } else {
        final senderId = getIt<AuthBloc>().state.user?.userId;
        final userId = feed?.feedPost?.ownerId;
        final postId = feed?.feedPost?.postId;

        if (userId != null && senderId != null && postId != null) {
          widget.args.feedBloc.add(
            FeedPostLiked(
              postId: postId,
              index: index,
              postOwnerId: userId,
              currentUserId: senderId,
              isFromeDetails: true,
            ),
          );
        }
      }
    }
  }

  void _commentOnPost({
    required FeedBloc feedBloc,
    required String? userId,
    required int? postId,
    required int? parentCommentId,
  }) {
    final senderId = getIt<AuthBloc>().state.user?.userId;
    final comment = _commentsController.text;
    if (postId != null &&
        userId != null &&
        senderId != null &&
        comment.isNotEmpty) {
      feedBloc.add(
        FeedPostCommented(
          comment: CommentReq(
            userId: userId,
            senderId: senderId,
            postId: postId,
            content: comment,
            parentCommentId: parentCommentId,
          ),
          user: getIt<AuthBloc>().state.user,
          index: widget.args.index,
        ),
      );
      _commentsController.clear();
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }
}
