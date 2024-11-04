import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/saved_posts/domain/domain.dart';
import 'package:legal_referral_ui/src/features/saved_posts/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({super.key});

  static const String name = 'SavedPostsPage';

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {
  final _authBloc = getIt<AuthBloc>();
  final _savedPostsBloc = getIt<SavedPostsBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      _savedPostsBloc.add(SavedPostsFetched(userId: userId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts'),
      ),
      body: BlocConsumer<SavedPostsBloc, SavedPostsState>(
        bloc: _savedPostsBloc,
        listener: (context, state) {
          if (state.actionsStatus == SavedPostActionsStatus.success) {
            ToastUtil.showToast(
              context,
              title: 'Success',
              description: 'Post saved successfully',
              type: ToastificationType.success,
            );
          } else if (state.status == SavedPostStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == SavedPostStatus.loading) {
            return const SavedPostShimmer();
          }

          final savedPosts = state.savedPosts;
          if (state.status == SavedPostStatus.success && savedPosts.isEmpty) {
            return Center(
              child: Text(
                'No saved posts',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return ListView.separated(
            itemCount: savedPosts.length,
            itemBuilder: (context, index) {
              final savedPost = savedPosts[index];
              return SavedPostTile(
                savedPost: savedPost,
                onTap: () {
                  // TODO: fix this, instead this pushing this to
                  // feed details page, we should push to post details page
                  // final feed = Feed(
                  //   type: FeedType.post,
                  //   feedPost: FeedPost(
                  //     // feedId: savedPost.savedPostId,
                  //     post: savedPost.post,
                  //     // user: savedPost.owner,
                  //     createdAt: savedPost.createdAt,
                  //   ),
                  // );

                  // context.pushNamed(
                  //   FeedDetailsPage.name,
                  //   extra: FeedDetailsPageArgs(
                  //     feedBloc: getIt<FeedBloc>(),
                  //     feed: feed,
                  //     index: index,
                  //     fetchLikesAndCommentsCount: true,
                  //   ),
                  // );
                },
                onOptionsPressed: () => _showOptionsSheet(
                  context: context,
                  savedPost: savedPost,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          );
        },
      ),
    );
  }

  void _showOptionsSheet({
    required BuildContext context,
    required SavedPost? savedPost,
  }) {
    final userId = _authBloc.state.user?.userId;
    CustomBottomSheet.show(
      isDismissible: true,
      borderRadius: true,
      maxWidth: double.infinity,
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          ListTile(
            onTap: () {
              final savedPostId = savedPost?.savedPostId;
              if (savedPostId != null && userId != null) {
                _savedPostsBloc.add(
                  PostUnsaved(
                    savedPostId: savedPostId,
                  ),
                );

                context.pop();
              }
            },
            leading: SvgPicture.asset(IconStringConstants.deleteIcon),
            title: Text(
              'Unsave',
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
}
