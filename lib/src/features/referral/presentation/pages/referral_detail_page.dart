import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ReferralDetailPage extends StatelessWidget {
  const ReferralDetailPage({
    super.key,
    this.project,
  });
  final Project? project;

  static const String name = 'ReferralDetailPage';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project?.title ?? '',
          style: textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              color: LegalReferralColors.backgroundWhite255,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReferralCard(
                    referral: project,
                    showTitle: false,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      project?.description ?? '',
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            if (project?.projectId != null)
              _ActiveReferredUsers(
                project: project,
              ),
          ],
        ),
      ),
    );
  }
}

class _ActiveReferredUsers extends StatefulWidget {
  const _ActiveReferredUsers({
    required this.project,
  });

  final Project? project;

  @override
  State<_ActiveReferredUsers> createState() => _ActiveReferredUsersState();
}

class _ActiveReferredUsersState extends State<_ActiveReferredUsers> {
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final projectId = widget.project?.projectId;
    if (projectId != null) {
      _referralBloc.add(
        ReferredUsersFetched(projectId: projectId),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReferralBloc, ReferralState>(
      bloc: _referralBloc,
      listener: (context, state) {
        if (state.status == ReferralStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        } else if (state.status == ReferralStatus.awardProject) {
          context.pushReplacementNamed(ReferralPage.name, extra: 1);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Active Referrals',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 12.r,
                    child: Text(
                      state.referredUsers.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            if (state.status == ReferralStatus.loading)
              const ReferredUsersShimmer()
            else
              ListView.separated(
                shrinkWrap: true,
                itemCount: state.referredUsers.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final referredUser = state.referredUsers[index];

                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      ReferralProposalPage.name,
                      extra: ReferralProposalPageArgs(
                        referredUser: referredUser,
                        project: widget.project,
                      ),
                    ),
                    child: ReferredUserCard(
                      user: referredUser,
                      radius: 28.r,
                      onAward: () =>
                          _projectAwarded(referredUserId: referredUser?.userId),
                      onMessage: () => _onTapMessage(
                        referredUser?.userId,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
              ),
          ],
        );
      },
    );
  }

  void _projectAwarded({required String? referredUserId}) {
    final projectId = widget.project?.projectId;

    if (projectId == null || referredUserId == null) {
      return;
    }

    final req = AwardProjectReq(
      projectId: projectId,
      referredUserId: referredUserId,
    );

    _referralBloc.add(
      ProjectAwarded(
        awardProjectReq: req,
      ),
    );
  }

  void _onTapMessage(String? otherUserId) {
    final authBloc = getIt<AuthBloc>();
    final currentUserId = authBloc.state.user?.userId;
    if (currentUserId == null || otherUserId == null) {
      return;
    }
    context.pushNamed(
      ChatMessagesPage.name,
      pathParameters: {
        'recipientId': otherUserId,
      },
    );
  }
}
