import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ActiveProjects extends StatefulWidget {
  const ActiveProjects({
    required this.isReferrer,
    required this.onRefresh,
    super.key,
  });

  final bool isReferrer;
  final VoidCallback onRefresh;

  @override
  State<ActiveProjects> createState() => _ActiveProjectsState();
}

class _ActiveProjectsState extends State<ActiveProjects> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    final role = widget.isReferrer ? 'referrer' : 'referred';

    if (userId != null) {
      _referralBloc.add(
        ActiveProjectsFetched(
          userId: userId,
          role: role,
        ),
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
        }
      },
      builder: (context, state) {
        final activeProjects = state.activeProjects;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReferralSectionTitle(
              title: 'Active Projects',
              count: activeProjects.length,
            ),
            SizedBox(
              height: 12.h,
            ),
            if (state.status == ReferralStatus.loading) const ProjectShimmer(),
            if (state.status == ReferralStatus.success &&
                activeProjects.isEmpty)
              const EmptyItem(message: 'No active projects'),
            if (state.status == ReferralStatus.success)
              ListView.separated(
                shrinkWrap: true,
                itemCount: activeProjects.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final project = activeProjects[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      ProjectDetailsPage.name,
                      extra: ProjectDetailsPageArgs(
                        isReferrer: widget.isReferrer,
                        project: project,
                      ),
                    ),
                    child: ActiveProjectCard(
                      project: project,
                      onTapAction: () => _onPressed(project),
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

  void _onPressed(Project? project) {
    final status = project?.status;
    if (project?.projectId == null) return;
    if (status == ProjectStatus.accepted) {
      _referralBloc.add(
        ProjectStarted(
          projectId: project!.projectId!,
        ),
      );
    } else {
      context.pushNamed(
        ProjectDetailsPage.name,
        extra: ProjectDetailsPageArgs(
          isReferrer: widget.isReferrer,
          project: project,
        ),
      );
    }
  }
}
