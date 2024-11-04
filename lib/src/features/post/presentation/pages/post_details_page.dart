import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/bloc/post_bloc.dart';
import 'package:legal_referral_ui/src/features/post/presentation/widgets/widgets.dart';
import 'package:toastification/toastification.dart';

// TODO: Implement PostDetailsPage
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
              return const Center(
                child: CircularProgressIndicator(),
              );
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
                          user: const AppUser(
                            email: 'email',
                            firstName: 'Rishu',
                            lastName: 'Kumar',
                          ),
                          onLikePressed: () {},
                          onCommentPressed: () {},
                          onDiscussPressed: () {},
                          onSharePressed: () {},
                          imageHeight: 250,
                          isLiked: false,
                          likesCount: 20,
                          commentsCount: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
