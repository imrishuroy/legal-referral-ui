import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ActiveProposals extends StatefulWidget {
  const ActiveProposals({super.key});

  @override
  State<ActiveProposals> createState() => _ActiveProposalsState();
}

class _ActiveProposalsState extends State<ActiveProposals> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _referralBloc.add(
        ProposalsFetched(userId: userId),
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
        final proposalsProjects = state.proposalsProjects;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReferralSectionTitle(
              title: 'Active Proposals',
              count: state.proposalsProjects.length,
            ),
            SizedBox(
              height: 12.h,
            ),
            if (state.status == ReferralStatus.loading) const ProposalShimmer(),
            if (state.status == ReferralStatus.success &&
                proposalsProjects.isEmpty)
              const EmptyItem(message: 'No active proposals'),
            if (state.status == ReferralStatus.success)
              ListView.separated(
                shrinkWrap: true,
                itemCount: proposalsProjects.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final project = proposalsProjects[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      ProposalDetailsPage.name,
                      extra: project,
                    ),
                    child: ActiveProposalCard(
                      proposal: project,
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
