import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/features/account/presentation/widgets/proposal_tile.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';

class SavedPostPage extends StatelessWidget {
  const SavedPostPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PostProposalTile(),
            //saved post
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return FeedTile(
                  feed: null,
                  onLikePressed: () {},
                  onCommentPressed: () {},
                  onDiscussPressed: () {},
                  onSharePressed: () {},
                  isLiked: true,
                  likesCount: 5,
                  commentsCount: 2,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(
                  height: 8,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
