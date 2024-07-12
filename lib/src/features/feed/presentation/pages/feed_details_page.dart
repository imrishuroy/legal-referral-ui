import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/data/data.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:toastification/toastification.dart';

class FeedDetailsPageArgs {
  FeedDetailsPageArgs({
    required this.feedBloc,
    required this.feed,
    required this.index,
  });
  final FeedBloc feedBloc;
  final Feed? feed;

  final int index;
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
  final _commentsController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    widget.args.feedBloc.add(
      FeedDetailsInitialized(
        feed: widget.args.feed,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.args.feed?.post;

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
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeedTile(
                          feed: widget.args.feed,
                          isLiked: state.feed?.isLiked ?? false,
                          likesCount: state.feed?.likesCount ?? 0,
                          commentsCount: state.feed?.commentsCount ?? 0,
                          onLikePressed: () => _onLikePressed(
                            widget.args.feed,
                            state.feed?.isLiked ?? false,
                            widget.args.index,
                          ),
                          onCommentPressed: () {
                            _focusNode.unfocus();
                            FocusScope.of(context).requestFocus(_focusNode);
                          },
                          onDiscussPressed: () {},
                          onSharePressed: () {},
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
                              if (post?.postId != null)
                                PostLikedUsers(
                                  postId: post!.postId,
                                  feedBloc: widget.args.feedBloc,
                                ),
                              SizedBox(height: 24.h),
                              if (post?.postId != null)
                                CommentsList(
                                  feedBloc: widget.args.feedBloc,
                                  postId: post!.postId,
                                  onReplyPressed: (commentId) {
                                    widget.args.feedBloc.add(
                                      ParentCommentIdChanged(
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
                    post: widget.args.feed?.post,
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

  void _onLikePressed(
    Feed? feed,
    bool isLiked,
    int index,
  ) {
    final postId = feed?.post?.postId;
    if (postId != null) {
      if (isLiked == true) {
        widget.args.feedBloc.add(
          PostUnliked(
            postId: postId,
            index: index,
          ),
        );
      } else {
        widget.args.feedBloc.add(
          PostLiked(
            postId: postId,
            index: index,
          ),
        );
      }
    }
  }

  void _commentOnPost({
    required FeedBloc feedBloc,
    required Post? post,
    required int? parentCommentId,
  }) {
    final userId = getIt<AuthBloc>().state.user?.userId;
    final postId = post?.postId;
    final comment = _commentsController.text;
    if (postId != null && userId != null && comment.isNotEmpty) {
      feedBloc.add(
        Commented(
          comment: CommentReq(
            userId: userId,
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
