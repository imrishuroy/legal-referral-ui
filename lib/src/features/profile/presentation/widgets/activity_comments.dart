import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ActivityComments extends StatefulWidget {
  const ActivityComments({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  @override
  State<ActivityComments> createState() => _ActivityCommentsState();
}

class _ActivityCommentsState extends State<ActivityComments> {
  final _authBloc = getIt<AuthBloc>();
  ProfileBloc get _profileBloc => widget.profileBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      builder: (context, state) {
        return ColoredBox(
          color: LegalReferralColors.containerWhite500,
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.activityStatus == ActivityStatus.loading
                    ? 5
                    : state.activityComments.length,
                itemBuilder: (context, index) {
                  if (state.activityStatus == ActivityStatus.loading) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: ActivityCommentShimmer(),
                    );
                  }

                  return ActivityCommentTile(
                    comment: state.activityComments[index],
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              if (state.activityComments.isNotEmpty)
                TextButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: () => context.pushNamed(
                    AllActivitiesPage.name,
                    pathParameters: {
                      'userId': '${_authBloc.state.user?.userId}',
                    },
                    extra: ActivityType.comment,
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
          ),
        );
      },
    );
  }
}
