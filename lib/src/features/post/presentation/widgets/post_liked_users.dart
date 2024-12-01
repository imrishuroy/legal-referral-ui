import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class PostLikedUsers extends StatefulWidget {
  const PostLikedUsers({
    required this.postId,
    required this.postBloc,
    super.key,
  });

  final int postId;
  final PostBloc postBloc;

  @override
  State<PostLikedUsers> createState() => _PostLikedUsersState();
}

class _PostLikedUsersState extends State<PostLikedUsers> {
  @override
  void initState() {
    widget.postBloc.add(
      PostLikedUsersFetched(postId: widget.postId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      bloc: widget.postBloc,
      builder: (context, state) {
        if (state.likedUsersStatus == LikedUsersStatus.loading) {
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
