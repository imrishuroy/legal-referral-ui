import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';

class ActiveDiscussions extends StatefulWidget {
  const ActiveDiscussions({super.key});

  @override
  State<ActiveDiscussions> createState() => _ActiveDiscussionsState();
}

class _ActiveDiscussionsState extends State<ActiveDiscussions> {
  final _authBloc = getIt<AuthBloc>();
  final _discussionBloc = getIt<DiscussionBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      _discussionBloc.add(ActiveDiscussionFetched(userId: userId));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: BlocConsumer<DiscussionBloc, DiscussionState>(
        bloc: _discussionBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == DiscussionStatus.loading) {
            return const CustomLoadingIndicator();
          }

          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final discussion = state.discussions[index];
              return Card(
                margin: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  bottom: 1.h,
                ),
                elevation: 1,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  onTap: () {
                    final discussionId = discussion?.discussionId;
                    if (discussionId == null) {
                      return;
                    }
                    context.pushNamed(
                      DiscussionChatsPage.name,
                      extra: discussion,
                      pathParameters: {
                        'discussionId': '$discussionId',
                      },
                    );
                  },
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4, right: 2),
                    child: Text(
                      discussion?.topic ?? '',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  subtitle: Text(
                    '${discussion?.activeMemberCount ?? 0} active members',
                    style: textTheme.bodyLarge
                        ?.copyWith(color: LegalReferralColors.textGrey400),
                  ),
                  trailing: const NotificationLabel(
                    notificationNum: '1',
                  ),
                ),
              );
            },
            itemCount: state.discussions.length,
          );
        },
      ),
    );
  }
}
