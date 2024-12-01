import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class FeedPostLikedUsers extends StatefulWidget {
  const FeedPostLikedUsers({
    required this.postId,
    required this.feedBloc,
    super.key,
  });

  final int postId;
  final FeedBloc feedBloc;

  @override
  State<FeedPostLikedUsers> createState() => _FeedPostLikedUsersState();
}

class _FeedPostLikedUsersState extends State<FeedPostLikedUsers> {
  @override
  void initState() {
    widget.feedBloc.add(
      FeedPostLikedUsersFetched(postId: widget.postId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: widget.feedBloc,
      builder: (context, state) {
        if (state.status == FeedStatus.loading) {
          return SizedBox(
            height: 52.h,
            child: const PostLikedUsersShimmer(),
          );
        } else {
          final postLikedUsers = state.postLikedUsers;
          if (postLikedUsers.isEmpty) {
            return const SizedBox.shrink();
          }

          return SizedBox(
            height: 52.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final user = state.postLikedUsers[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      final userId = user?.userId;
                      if (userId != null) {
                        context.pushNamed(
                          ProfilePage.name,
                          pathParameters: {
                            'userId': userId,
                          },
                        );
                      }
                    },
                    child: CustomAvatar(
                      imageUrl: user?.avatarUrl,
                      radius: 26,
                    ),
                  ),
                );
              },
              itemCount: state.postLikedUsers.length,
            ),
          );
        }
      },
    );
  }
}
