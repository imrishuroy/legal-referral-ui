import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class ProposalTab extends StatefulWidget {
  const ProposalTab({super.key});

  @override
  State<ProposalTab> createState() => _ProposalTabState();
}

class _ProposalTabState extends State<ProposalTab> {
  final _referralBloc = getIt<ReferralBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralBloc, ReferralState>(
      bloc: _referralBloc,
      builder: (context, state) {
        AppLogger.info('Referral bloc stat status ${state.status}');
        if (state.status == ReferralStatus.loading) {
          return const CustomLoadingIndicator();
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AwardedProjects(
                onRefresh: () {
                  AppLogger.info('Refresh awarded projects');
                  _referralBloc.add(ReferralStateReset());
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              ActiveProjects(
                isReferrer: false,
                onRefresh: () {
                  AppLogger.info('Refresh active projects');
                  _referralBloc.add(ReferralStateReset());
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              const ActiveProposals(),
              SizedBox(
                height: 16.h,
              ),
              const CompletedProjects(
                isReferrer: false,
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
