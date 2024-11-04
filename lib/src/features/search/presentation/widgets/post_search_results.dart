import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';

class PostSearchResults extends StatelessWidget {
  const PostSearchResults({
    required this.searchBloc,
    required this.searchController,
    super.key,
  });

  final SearchBloc searchBloc;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final state = searchBloc.state;
    final theme = Theme.of(context).textTheme;
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                final name =
                    '${post?.ownerFirstName} ${post?.ownerLastName ?? ''}';
                return ColoredBox(
                  color: LegalReferralColors.containerWhite500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CustomAvatar(
                                imageUrl: post?.ownerAvatarUrl,
                                radius: 28.r,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: Text(
                                      name,
                                      style: theme.titleLarge?.copyWith(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: theme.bodyLarge?.copyWith(
                                            color:
                                                LegalReferralColors.textGrey117,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  post?.ownerPracticeArea ?? '',
                                            ),
                                            // const TextSpan(text: ' • 1st'),
                                          ],
                                        ),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.8.h,
                                  ),
                                  Text(
                                    DateTimeUtil.timeAgo(post?.createdAt),
                                    style: theme.bodyMedium?.copyWith(
                                      color: LegalReferralColors.textGrey117,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Post details options
                            SvgButton(
                              height: 24.w,
                              width: 24.h,
                              imagePath: IconStringConstants.threeDots,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (post?.content != null &&
                                post!.content!.isNotEmpty)
                              ExpandableText(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                text: post.content ?? '',
                              ),
                            if (post?.type == PostType.link &&
                                post?.content != null)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                ),
                                child: LinkPreviewWidget(
                                  text: post!.content!,
                                ),
                              )
                            else
                              MediaPost(
                                imageHeight: 400,
                                postType: post?.type ?? PostType.image,
                                mediaUrls: post?.filesUrls ?? [],
                                fileName: post?.content,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                color: LegalReferralColors.primaryBackground,
                height: 8.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
