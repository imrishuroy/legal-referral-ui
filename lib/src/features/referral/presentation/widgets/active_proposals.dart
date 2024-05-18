import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Text(
            'Active Proposals',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        BlocConsumer<ReferralBloc, ReferralState>(
          bloc: _referralBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == ReferralStatus.loading) {
              return const CustomLoadingIndicator();
            }
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.proposals.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final proposal = state.proposals[index];
                return GestureDetector(
                  onTap: () => context.pushNamed(
                    ProposalDetailsPage.name,
                    extra: proposal,
                  ),
                  child: ActiveProposalCard(
                    proposal: proposal,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1.h,
              ),
            );
          },
        ),
      ],
    );
  }
}
