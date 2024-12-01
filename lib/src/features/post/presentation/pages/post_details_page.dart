import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/data/data.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/bloc/post_bloc.dart';
import 'package:legal_referral_ui/src/features/post/presentation/widgets/widgets.dart';
import 'package:toastification/toastification.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({
    required this.postId,
    super.key,
  });

  final int postId;
  static const String name = 'PostDetailsPage';

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  final _commentsController = TextEditingController();
  final _focusNode = FocusNode();
  final _authBloc = getIt<AuthBloc>();
  final _postBloc = getIt<PostBloc>();

  @override
  void initState() {
    _postBloc.add(PostFetched(postId: widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: LegalReferralColors.containerWhite500,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocConsumer<PostBloc, PostState>(
          bloc: _postBloc,
          listener: (context, state) {
            if (state.status == PostStatus.failure) {
              ToastUtil.showToast(
                context,
                title: 'Error',
                description: state.failure?.message ?? 'something went wrong',
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state.status == PostStatus.loading) {
              return const PostDetailsShimmer();
            }
            final post = state.post;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PostTile(
                          post: post,
                          onLikePressed: () => _onLikePressed(post),
                          onCommentPressed: () {},
                          onDiscussPressed: () {},
                          onSharePressed: () {},
                          imageHeight: 250,
                          isLiked: post?.isLiked ?? false,
                          likesCount: post?.likesCount ?? 0,
                          commentsCount: post?.commentsCount ?? 0,
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
                                  postBloc: _postBloc,
                                ),
                              SizedBox(height: 24.h),
                              if (post?.postId != null)
                                PostCommentsList(
                                  postId: post!.postId,
                                  postBloc: _postBloc,
                                  onReplyPressed: (commendId) {
                                    _postBloc.add(
                                      PostParentCommentIdChanged(
                                        parentCommentId: commendId,
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
                    postBloc: _postBloc,
                    userId: post?.ownerId,
                    postId: post?.postId,
                    parentCommentId: state.parentCommentId,
                    currentUser: _authBloc.state.user,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onLikePressed(Post? post) {
    final currentUserId = _authBloc.state.user?.userId;
    if (post != null && currentUserId != null) {
      if (post.isLiked ?? false) {
        _postBloc.add(PostUnliked(postId: post.postId));
      } else {
        _postBloc.add(
          PostLiked(
            postId: post.postId,
            postOwnerId: post.ownerId,
            currentUserId: currentUserId,
          ),
        );
      }
    }
  }

  void _commentOnPost({
    required PostBloc postBloc,
    required String? userId,
    required int? postId,
    required int? parentCommentId,
    required AppUser? currentUser,
  }) {
    final senderId = currentUser?.userId;
    final comment = _commentsController.text;
    if (postId != null &&
        userId != null &&
        senderId != null &&
        comment.isNotEmpty) {
      postBloc.add(
        PostCommented(
          comment: CommentReq(
            userId: userId,
            senderId: senderId,
            postId: postId,
            content: comment,
            parentCommentId: parentCommentId,
          ),
          user: currentUser,
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
