import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/feed/domain/domain.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:share_plus/share_plus.dart';

class FeedPostOptionsContent extends StatefulWidget {
  const FeedPostOptionsContent({
    required this.feedBloc,
    required this.feed,
    required this.index,
    required this.userId,
    super.key,
  });

  final FeedBloc feedBloc;
  final Feed? feed;
  final int index;
  final String? userId;

  @override
  State<FeedPostOptionsContent> createState() => _FeedPostOptionsContentState();
}

class _FeedPostOptionsContentState extends State<FeedPostOptionsContent> {
  FeedBloc get _feedBloc => widget.feedBloc;

  @override
  void initState() {
    final postId = widget.feed?.feedPost?.postId;
    if (postId != null) {
      _feedBloc.add(IsFeedPostFeatured(postId: postId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: _feedBloc,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                final postId = widget.feed?.feedPost?.postId;
                if (postId != null && widget.userId != null) {
                  widget.feedBloc.add(
                    PostSaved(
                      postId: postId,
                      userId: widget.userId!,
                    ),
                  );
                  context.pop();
                }
              },
              leading: SvgPicture.asset(IconStringConstants.download),
              title: Text(
                'Save',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey500),
              ),
            ),
            const Divider(),
            // TODO: Implement this
            if (widget.feed?.feedPost?.ownerId != widget.userId)
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(IconStringConstants.message),
                    title: Text(
                      'Message',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: LegalReferralColors.textGrey500),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset(IconStringConstants.addFollow),
              title: Text(
                'Follow',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey500),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () async {
                await _sharePost(widget.feed?.feedPost?.media ?? []);
              },
              leading: SvgPicture.asset(
                IconStringConstants.share,
                colorFilter: const ColorFilter.mode(
                  LegalReferralColors.borderBlue100,
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                'Share via',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                context.pop();
                final feedId = widget.feed?.feedId;
                if (feedId != null) {
                  _feedBloc.add(
                    FeedPostIgnored(
                      feedId: feedId,
                      index: widget.index,
                    ),
                  );
                }
              },
              leading: SvgPicture.asset(IconStringConstants.restrict),
              title: Text(
                "I don't want to see this",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey500),
              ),
            ),
            const Divider(),

            ListTile(
              onTap: () {
                final postId = widget.feed?.feedPost?.postId;
                if (postId != null) {
                  _reportPost(postId);
                }
              },
              leading: SvgPicture.asset(IconStringConstants.flag),
              title: Text(
                'Report post',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey500),
              ),
            ),
            const Divider(),
            if (widget.feed?.feedPost?.ownerId == widget.userId)
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset(
                  IconStringConstants.editIcon,
                  colorFilter: const ColorFilter.mode(
                    LegalReferralColors.borderBlue100,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  'Edit',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey500),
                ),
              ),
            if (widget.feed?.feedPost?.ownerId == widget.userId)
              Column(
                children: [
                  const Divider(),
                  if (widget.feed?.feedPost?.ownerId == widget.userId)
                    ListTile(
                      leading: SvgPicture.asset(
                        state.isPostFeatured
                            ? IconStringConstants.favouriteFilled
                            : IconStringConstants.favourite,
                        colorFilter: const ColorFilter.mode(
                          Colors.blue,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Text(
                        'Make feature post',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textGrey500,
                            ),
                      ),
                      onTap: () {
                        final postId = widget.feed?.feedPost?.postId;
                        if (postId != null && widget.userId != null) {
                          if (state.isPostFeatured) {
                            _feedBloc.add(
                              FeedPostUnFeatured(
                                postId: postId,
                                userId: widget.userId!,
                              ),
                            );
                          } else {
                            _feedBloc.add(
                              FeedPostFeatured(
                                postId: postId,
                                userId: widget.userId!,
                              ),
                            );
                          }
                          context.pop();
                        }
                      },
                    ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      final postId = widget.feed?.feedPost?.postId;
                      if (postId != null) {
                        widget.feedBloc.add(
                          PostDeleted(
                            postId: postId,
                          ),
                        );
                        context.pop();
                      }
                    },
                    leading: SvgPicture.asset(
                      IconStringConstants.deleteIcon,
                      colorFilter: const ColorFilter.mode(
                        LegalReferralColors.borderBlue100,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey500,
                          ),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  Future<void> _sharePost(List<String> postFiles) async {
    final file = postFiles.isNotEmpty ? postFiles.first : '';
    await Share.share(
      'check out this post from Legal Referral app $file',
    );
  }

  void _reportPost(int postId) {
    context.pop();
    CustomBottomSheet.show(
      isDismissible: true,
      borderRadius: true,
      maxWidth: double.infinity,
      context: context,
      child: ReportFeedPostContent(
        feedBloc: _feedBloc,
        postId: postId,
      ),
    );
  }
}
