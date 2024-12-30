import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ActivityPosts extends StatefulWidget {
  const ActivityPosts({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  @override
  State<ActivityPosts> createState() => _ActivityPostsState();
}

class _ActivityPostsState extends State<ActivityPosts> {
  final _authBloc = getIt<AuthBloc>();
  ProfileBloc get _profileBloc => widget.profileBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      builder: (context, state) {
        if (state.activityStatus == ActivityStatus.loading) {
          return const ActivityPostShimmer();
        }
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.activityPosts.length,
              itemBuilder: (context, index) {
                final post = state.activityPosts[index];
                return ActivityPostTile(post: post);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            if (state.activityPosts.isNotEmpty)
              TextButton.icon(
                iconAlignment: IconAlignment.end,
                onPressed: () => context.pushNamed(
                  AllActivitiesPage.name,
                  pathParameters: {
                    'userId': '${_authBloc.state.user?.userId}',
                  },
                  extra: ActivityType.post,
                ),
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(
                    LegalReferralColors.textBlue100,
                  ),
                  iconSize: WidgetStateProperty.all(18.sp),
                ),
                label: Text(
                  'View More',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LegalReferralColors.textBlue100,
                      ),
                ),
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                ),
              ),
          ],
        );
      },
    );
  }
}
