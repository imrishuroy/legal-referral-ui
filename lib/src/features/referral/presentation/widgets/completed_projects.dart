import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class CompletedProjects extends StatefulWidget {
  const CompletedProjects({
    required this.isReferrer,
    super.key,
  });

  final bool isReferrer;

  @override
  State<CompletedProjects> createState() => _CompletedProjectsState();
}

class _CompletedProjectsState extends State<CompletedProjects> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();
  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _referralBloc.add(
        CompletedProjectsFetched(
          userId: userId,
          role: widget.isReferrer ? 'referrer' : 'referred',
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
        final projects = state.completedProjects;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReferralSectionTitle(
              title: 'Completed Projects',
              count: projects.length,
            ),
            SizedBox(
              height: 12.h,
            ),
            if (state.status == ReferralStatus.loading) const ProjectShimmer(),
            if (state.status == ReferralStatus.success && projects.isEmpty)
              const EmptyItem(message: 'No completed projects'),
            if (state.status == ReferralStatus.success)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      CompletedProjectDetailsPage.name,
                      extra: project,
                    ),
                    child: CompletedProjectCard(
                      project: project,
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 1.h,
                ),
              ),
          ],
        );
      },
    );
  }
}
