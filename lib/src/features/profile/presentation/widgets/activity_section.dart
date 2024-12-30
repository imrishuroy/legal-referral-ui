import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ActivitySection extends StatefulWidget {
  const ActivitySection({
    super.key,
  });

  @override
  State<ActivitySection> createState() => _ActivitySectionState();
}

class _ActivitySectionState extends State<ActivitySection> {
  final _authBloc = getIt<AuthBloc>();
  final _profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _profileBloc.add(UserFollowersCountFetched(userId: userId));
      _profileBloc.add(
        ActivityPostsFetched(
          userId: userId,
          limit: 1,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${state.followersCount} Followers',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: LegalReferralColors.textGrey400),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                CustomOutlinedButton(
                  height: 35.h,
                  width: 76.w,
                  text: 'Posts',
                  onPressed: () => _profileBloc.add(
                    const ActivityTypeChanged(
                      activityType: ActivityType.post,
                    ),
                  ),
                  borderColor: state.activityType == ActivityType.post
                      ? LegalReferralColors.borderBlue
                      : LegalReferralColors.textGrey400,
                  textColor: state.activityType == ActivityType.post
                      ? LegalReferralColors.textBlue100
                      : LegalReferralColors.textGrey400,
                  borderRadius: 64,
                ),
                const SizedBox(width: 12),
                CustomOutlinedButton(
                  height: 35.h,
                  width: 116.w,
                  text: 'Comments',
                  onPressed: () => _profileBloc.add(
                    const ActivityTypeChanged(
                      activityType: ActivityType.comment,
                    ),
                  ),
                  borderRadius: 64,
                  borderColor: state.activityType == ActivityType.comment
                      ? LegalReferralColors.borderBlue
                      : LegalReferralColors.textGrey400,
                  textColor: state.activityType == ActivityType.comment
                      ? LegalReferralColors.textBlue100
                      : LegalReferralColors.textGrey400,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            if (state.activityType == ActivityType.post)
              ActivityPosts(
                profileBloc: _profileBloc,
              )
            else
              ActivityComments(
                profileBloc: _profileBloc,
              ),
          ],
        );
      },
    );
  }
}
