import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AwardedProjects extends StatefulWidget {
  const AwardedProjects({
    required this.onRefresh,
    super.key,
  });

  final VoidCallback onRefresh;

  @override
  State<AwardedProjects> createState() => _AwardedProjectsState();
}

class _AwardedProjectsState extends State<AwardedProjects> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _referralBloc.add(
        AwardedProjectsFetched(
          userId: userId,
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
        } else if (state.status == ReferralStatus.success && state.isReset) {
          widget.onRefresh();
        }
      },
      builder: (context, state) {
        if (state.status == ReferralStatus.loading) {
          return const AwardedProjectShimmer();
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.awardedProjects.length,
          itemBuilder: (context, index) {
            final project = state.awardedProjects[index];
            return AwardedProjectCard(
              project: project,
              onAccept: () {
                if (project != null) {
                  _referralBloc.add(
                    ProjectAccepted(
                      projectId: project.projectId!,
                    ),
                  );
                }
              },
              onReject: () {
                if (project != null) {
                  _referralBloc.add(
                    ProjectRejected(
                      projectId: project.projectId!,
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
